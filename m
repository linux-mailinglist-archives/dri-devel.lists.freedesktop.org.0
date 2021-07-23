Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88E93D360F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBCF6ED11;
	Fri, 23 Jul 2021 08:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31EB6ED11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH8aya6+uDqtRF1E6mzDUXqTwAP6K9Rx7HbLog0H0EvLz/9gNQdfJFRa0hf4xwp7uSytY75dSwPTyaKlpNAliFnKrucWzUNc3piT9zX09XqhHPLt8dUcOagRab2kZRdA3VagHdtt8gYABhqort3yjcTnkJQ9RMwuP5TTT/hpKUOlKQYGMk/fQP8TgQM9WRrKgRt0bpXU6RbJ/DxYt6TRlhUGGdj4ZayAf8bMmKi2I8uWpKdzVaz5l7yGGymkTparBwFWJhmChQ0uMGxkEpDposSfOxZynQe5hm0//s15/G/I+e1737O/nmu4gktpE9aUxir/xZwx3zjC+YDzbxZHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzCO7jk3zFT/lkNok6A4P9/7Lm8/gRvhoPfvWbl6fBE=;
 b=ZBiY0XIkyqw3CMt+qA8Wf7y2j7mvDXxsgfbxqi+EctsiahjdQOGUTGzmpfaRMTcXBPiLKKhKnhPGu4TP8hQetCgrTlnKcofhafTe5uT0N6bfUP78t2jcpseH2kaqL/sp1Q2SpzBzEziL+Vj6gd+uRYD7vJr6MEEXnOl2oUMIJB56C+H95kh0TYa34k9A8mbqS5XqxLsaWKWl4nlZowvIgypLQc0ijN2t4Gmj+bLxKlRDrMp0FiFajELR21sgGuCogBVShnQ/CETey2NuvPiQ8+Le4EcLz5lfsGvP/A8+tNsNfoil86akz7YwFtBs6ayp1wDHuAtW4YaZpbUoiOk17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzCO7jk3zFT/lkNok6A4P9/7Lm8/gRvhoPfvWbl6fBE=;
 b=Hd0x3QXEjB0iT5qC1H82jJwLblUwdiicZy+g0mxem9do0CHf2bXVvHBOr/XhPtB3fb9zBLvbxrXZaz2Jbl/uzT1mR2JXeE4sLQis0nvfvogiujl0mut70SO4+vJlBEKllZ9G6On0F8j5Uwnbgq98fae7/w1H3aoHzquDkRlTCfQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 08:05:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.028; Fri, 23 Jul 2021
 08:05:04 +0000
Subject: Re: [PATCH] dma-buf/poll: Get a file reference for outstanding fence
 callbacks
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20210723075857.4065-1-michel@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f5f37693-bfe2-e52f-172b-00f4aa94dbd9@amd.com>
Date: Fri, 23 Jul 2021 10:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210723075857.4065-1-michel@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b5eb:ae77:ac:3a23]
 (2a02:908:1252:fb60:b5eb:ae77:ac:3a23) by
 PR3P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.26 via Frontend Transport; Fri, 23 Jul 2021 08:05:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daa7a4f9-1f84-4d18-6a4e-08d94db093c3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4224:
X-Microsoft-Antispam-PRVS: <MN2PR12MB422426150661C659C259D15D83E59@MN2PR12MB4224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PAOFrjuGyNBdX5BFExMNlg1rGbWqYKoza/DoIoqPGy2VNMjqmarSeLsxJtpbN6wc2VohtvfR+LeI0/ax+2VO5OBJp5qehoTaxKOdjGCuNDJI++wAxZRcALWoTgvwcDJD6Xii8kCgsg6HSZ9asxXLeIGyhRYfQ+1n+2NDGBwjxd0cpOPcX1Q5088d1VhpiukD5NP4HTTUIk+mTohBz+/fQ2oUQhOH11mjbyQmCida9/Cw8JzEZpcSA6lHIGSk6uJny8p0+Tsfj+2n1fDZmPugvL2ZwcXGfv3QOgaqYud9gnc0JLZUpJlFzSdTzoIb1NqH87lHl+hHrvqbQIduL2EjlBYVVuIFkihyk4Dhq/pAk/HxpAT1Vp1u7W6187Y8s1mng6j5Cv1i5FOO6RdGqxqJlkh0qK798h0E8r3AxJEJeF4iVlrcZlVeLFGasMilbAoDQpmP1kcH9HMRmoN69RnhO5ElcTYJ9ITP0JWIEdeBJpebC/IfCP+v9CSSUJvKL+co1jHfBkyS8B42T/pvuKt3+Sr8FPB4tZwOrKjS3BP+KSLhVOsR1klaT8x8A0IqVYKKecwJeOXV9hfsVHCPC2UGpD0eUmYDF/9ndM3abgqSLXaGQE+8qvzBjnmnNjJNoLA0081SRibXeRau9qMR/m7xSI7o106ZRCZc06kh+anmEFV38/rpW/bx9QWliDAoTAS7aIqyolHheLKjUFAmNQtdcPX4wdgrKQK1RdkgagRuhy8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(31696002)(6666004)(186003)(83380400001)(8676002)(31686004)(6486002)(86362001)(38100700002)(478600001)(5660300002)(66574015)(316002)(2616005)(36756003)(4326008)(6916009)(66946007)(66556008)(66476007)(8936002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2Y2cUdIdnlYK2NydFozSS9EekpoR09JTDNOVEpjc2JseWQwWnBhSjdPZkdr?=
 =?utf-8?B?WVZMYXd1ekFWUUhzTHhWbFNxaTNNTFNLdWpSUTVBQ3dHSVlIdlo2SWQ2aFZi?=
 =?utf-8?B?czdiWDNNaTFXcUtxUHZZK3FWNlpqbk5wN0ZEMkQxQ3ZUQWtxQ3Y2akdVWHNS?=
 =?utf-8?B?TjhOTUJGdGhMUnRKNmlhdDNsWW14OENTR2wyd3BLeUhzMnlreVR3Wmd2SUVm?=
 =?utf-8?B?Tm0yTUI0bnNwVGViL2VaM0lmOWpPQW1qNjFkMER5akRQOUM4VU5sT25FM1ZZ?=
 =?utf-8?B?TWZGN2dUUDJlVEdENE5ZNEVDS0ZiS05kWmdyTUk1V2JWbUJkSWJ0TFBRK1Nj?=
 =?utf-8?B?ZnpBZkRRSFhmSWpQbFFJaU9CSUdUVlBUTldGZkhpNDJmZEpxUUlBL3piM0I4?=
 =?utf-8?B?d3c1Ui9maHV6clNCOW55V1NKcnJQakRha2p2clpENFN1UlRuSjdqYW96MS9X?=
 =?utf-8?B?NXZtQTIwQ0cwZG53MWo0UHNHT0ZmZzd3eCsxd29QVHhSRG95dXVmRUt3ajFY?=
 =?utf-8?B?MHVvaXRabmFDL0hGNDhnc05JbXNOL21NcDV6N2RpMHRNTkxJTUVrUUt1MTRi?=
 =?utf-8?B?dnl1ZzV2Y2I2VDlpb2N2OUUwcUR0RmVUUWxrcUU5V0UwbDBHclJYODhPd1Jn?=
 =?utf-8?B?b2M5SU95RW54RWVNVWducjg2OTc2czA5ZlNoMHBOV1NPMnJDRzNoNlA1SUFx?=
 =?utf-8?B?SHdTR0lRdlNXOW5MdjcvTG5paVVTSkxjNGtHc0dYRXJjV215WC91RHlRT29P?=
 =?utf-8?B?MC9SNURjd1JtRk5USnlBUEZPb085SzdVMGJvMWVKR2tFVUNBek9uelBjN05s?=
 =?utf-8?B?ZTQzV3kyS2lmV3FXN0o5NmlCM0tXU21FRnlVQ2FVZkNmZW9kcm1oNUFQQlR0?=
 =?utf-8?B?Nm8wZ09GOFEzZjhVeWNiKzJHK3R2VUpRR3ZNYzB2bDZqKzhiYjNackhZWjEx?=
 =?utf-8?B?YnVQTFZ5NktGT3NRWTRkcVF0WU93ZTVkL01kUUFINDhpcHJFQkkrQTJCL1d6?=
 =?utf-8?B?L0h4S0V1cDkrVzUzak5iSi9sN1NvZlByVnRNL1ZUOENOd2g0ZlJ0bHZNSjFR?=
 =?utf-8?B?bll6UHdJUDN5bHE4aE4wcktiRUNOTkJrUVRCNDJpK0xTd2lzSS9BTmx4UVR2?=
 =?utf-8?B?a3gvUW9VS2s0ZTNsV0o4NVhFZGlnSEdEeVRvOEIwK2dyUm1SdU50bUkxZkR5?=
 =?utf-8?B?WmhRUmdURzFBdkJYOUQ0eC9MYzAzNFFwY0wvZTNTR3lEakwyczFQSjFWY09n?=
 =?utf-8?B?M2pqOG5kQTRMV2RlaTVIcWZtaFV1QzFLZGo0SDgwSVdvVi9VaTYxcm8yNVh2?=
 =?utf-8?B?bjQ3NHBVNUlDbi9IOHJPbTFObUR0bVBBdlIwMkhyL0ZEUjFrMDVqclRmWEV1?=
 =?utf-8?B?clNBSVlRMUptaGRuYUhZa0xmMW1VUW82UVBnT2hzbDNLeGZmSGhja2IwTGFH?=
 =?utf-8?B?QVNBaEhDUmd4R1UrcEdoQkZZN29McW5Dc1pBU29OejJmK0JMdlpWT2ptVVA5?=
 =?utf-8?B?cTRmbVgrQ25WYUhmMlNCcVFsSGdLdm9yUEV6S1g4bHlNZUtxSUkyVi9vQjRQ?=
 =?utf-8?B?cUk1Wk9hb2N6cUpLTGNGREFNMHIyaVZlSXpXNHBwMWVwL3VBTGkxNnJRbTJE?=
 =?utf-8?B?d3ZUTTV6OG9pQ1c1ZVdxOFRiMGk1T1FYS0JZSUd1L2xCUTZ1QXIrWDZISFYy?=
 =?utf-8?B?UHJXYUJFcjVkaVpJS21QbVFsaHpLNHo2WmIzWlNrMjB1U1piLzRnbms3Z29y?=
 =?utf-8?B?eHNZK1V4aTI3aEtNWCswOHJGZTg4UWpmb2RuL3hHYnRvdGIzdFVETXFJKzI0?=
 =?utf-8?B?NjdyYlpXSUtrRlJWcXNuNUNJT1BGSXRjL0M0UjIwVGRZOUxCcDdCeHhpRGpP?=
 =?utf-8?Q?WMLZmLZeBPPW7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa7a4f9-1f84-4d18-6a4e-08d94db093c3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 08:05:04.0065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8029NIa6XYyBSjYLR1VnSz0HSrfo7//QPy+vA9pN5Xp1PBuTK/Z6ep0+NNN5Ulz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.07.21 um 09:58 schrieb Michel Dänzer:
> From: Michel Dänzer <mdaenzer@redhat.com>
>
> This makes sure we don't hit the
>
> 	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>
> in dma_buf_release, which could be triggered by user space closing the
> dma-buf file description while there are outstanding fence callbacks
> from dma_buf_poll.

I was also wondering the same thing while working on this, but then 
thought that the poll interface would take care of this.

>
> Cc: stable@vger.kernel.org
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> ---
>   drivers/dma-buf/dma-buf.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 6c520c9bd93c..ec25498a971f 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -65,12 +65,9 @@ static void dma_buf_release(struct dentry *dentry)
>   	BUG_ON(dmabuf->vmapping_counter);
>   
>   	/*
> -	 * Any fences that a dma-buf poll can wait on should be signaled
> -	 * before releasing dma-buf. This is the responsibility of each
> -	 * driver that uses the reservation objects.
> -	 *
> -	 * If you hit this BUG() it means someone dropped their ref to the
> -	 * dma-buf while still having pending operation to the buffer.
> +	 * If you hit this BUG() it could mean:
> +	 * * There's a file reference imbalance in dma_buf_poll / dma_buf_poll_cb or somewhere else
> +	 * * dmabuf->cb_in/out.active are non-0 despite no pending fence callback
>   	 */
>   	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>   
> @@ -196,6 +193,7 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>   static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>   {
>   	struct dma_buf_poll_cb_t *dcb = (struct dma_buf_poll_cb_t *)cb;
> +	struct dma_buf *dmabuf = container_of(dcb->poll, struct dma_buf, poll);
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&dcb->poll->lock, flags);
> @@ -203,6 +201,8 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>   	dcb->active = 0;
>   	spin_unlock_irqrestore(&dcb->poll->lock, flags);
>   	dma_fence_put(fence);
> +	/* Paired with get_file in dma_buf_poll */
> +	fput(dmabuf->file);

Is calling fput() in interrupt context ok? IIRC that could potentially 
sleep.

Regards,
Christian.

>   }
>   
>   static bool dma_buf_poll_shared(struct dma_resv *resv,
> @@ -278,6 +278,9 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
>   		if (events & EPOLLOUT) {
> +			/* Paired with fput in dma_buf_poll_cb */
> +			get_file(dmabuf->file);
> +
>   			if (!dma_buf_poll_shared(resv, dcb) &&
>   			    !dma_buf_poll_excl(resv, dcb))
>   				/* No callback queued, wake up any other waiters */
> @@ -299,6 +302,9 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
>   		if (events & EPOLLIN) {
> +			/* Paired with fput in dma_buf_poll_cb */
> +			get_file(dmabuf->file);
> +
>   			if (!dma_buf_poll_excl(resv, dcb))
>   				/* No callback queued, wake up any other waiters */
>   				dma_buf_poll_cb(NULL, &dcb->cb);

