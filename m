Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69A169770
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 13:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51ED6E176;
	Sun, 23 Feb 2020 12:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5D96E176
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 12:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3s8o3GB1OFAN5vBhwFVj2a+ailLNDHo0w4aze/Vyi0YoS19yDEGwc21fPSkVMUIYKPQb9UrpFd/lHrSN9ReHhBA88milalKvsiygdr8ILpbSQWTj1L6m8Brc2cz627uQDSxF11cQY4mnGX5BtHVKaoSj3VYh5OF8LyBB10IR0ZaXy6yzdAeoUCcHlvcfMwskum+9C2B2C+ehcg1bEQz55E/1rlrIliWwugHCWPitdF0m0eS6goQhYZI4imU3sbsCkujTc0jmybmr2/in1C+GsUspNUOKoKLJJOIEhQnN/0Xv/dk+T88dTY2pSD27wbUjr1qO2/WEQ72c0ddcf/JrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7jMdzYGZWZjpE497kC91UPQK1IxaOoJsaEkq12vKJU=;
 b=Ns8+twXNIj82U827Sa6do85j3hSHjoQOYcp/KRw/YdvdXwua5uGfaFnvwz3clt2DHpFYv24kZdxcnUwbibRGrBYMyWpIgQAtRuxBXdQbsW7X2DhgipKHI21JUnDVyf9cGYFjjAS/gW6jnDFbmVHp5u7WPUVHCQhpYjTRJleCCtW6OXsxK+BIMigY4q9Do93ywD2TujvIdGg1f2Xv+78OaXWy9SjOjSk/T7ex2zA+T/CzJ4YQ7RXZXj4a40BKkHVwOhFXEA0a+CdKHjHh6/ihNXEIBezJRFslspg+n26Pkh1xijS/Zh0f842eVgwk/WIZM1VIfJdP9jiuoVwnfU8cxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7jMdzYGZWZjpE497kC91UPQK1IxaOoJsaEkq12vKJU=;
 b=zrgm2MAS5Fpd+J6hkekOiF2s6wS2ubWxIWt0h6gY8+8puyH1Lbu2hcRr6a1W1ZDeesyLZWPWVBaSHrP3mcWv4VFBuhUhyfg6QYVkJUB6l76D6E8zIPilNm69Q4EHY7b7SO6iHN1s4a3PcyXhkK/Qnap6D3vLJEl6Ghn10aBE0Bs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1625.namprd12.prod.outlook.com (2603:10b6:4:b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Sun, 23 Feb 2020 12:04:22 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Sun, 23 Feb
 2020 12:04:22 +0000
Subject: Re: [PATCH] dma-buf: Fix missing excl fence waiting
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
Date: Sun, 23 Feb 2020 13:04:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0086.eurprd05.prod.outlook.com
 (2603:10a6:207:1::12) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:207:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Sun, 23 Feb 2020 12:04:20 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7988bf35-994e-4260-608d-08d7b85884c7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1625:|DM5PR12MB1625:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1625728BCFD8A28EDB459FA383EF0@DM5PR12MB1625.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0322B4EDE1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(199004)(189003)(86362001)(66946007)(6486002)(6666004)(36756003)(2616005)(478600001)(5660300002)(81166006)(186003)(8676002)(16526019)(66476007)(52116002)(31696002)(316002)(110136005)(54906003)(81156014)(2906002)(4326008)(66556008)(8936002)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1625;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/uT05tIi3sDc45WnmKaKOEKzRq4/ChSSRS1U1j/cRmKAAQwdTpZ5IjWShz3IoI2OX7hh5JdbF1P9XOJLLxdwgsbR+Iz/Q3eZ0py1m1/nGKefmELkbphm7qutU+hcsjtcnQKrqN4lalBc3HF38IrR1bKS7lUZTRWUNe+nUDkgE3ljsznyEXIJ8gmB7EhVjHDEO5BvPVDEG4AGYOSo7nw+WFhtv0KpzVFr3SmpRAiCUxZVq1eLzCccWaLBtUdoE5rpFmw5lRpfiZY4Gz14TDZRXDjaTtM14jr86K39rGB465wBLzuw94dQYodqSs6lfoUfJ8jPXY4zy+EIvGDv6WpxRegQ++b47U4Yz/pt5qYU4U3KEwmesSnIRq2fNgqC1DT4l5ghVyyWttdhzUtnyxJZ4k91PWF1KayiSwmF467LCz+BsU2R7r2QGgPS5YMAThX
X-MS-Exchange-AntiSpam-MessageData: NmVkClFAZe5lc9iIWc9G9HypLDOn34DsqiuJLZh9ubc0NXB/5ZLvuLuyoEbYk/KgTWwcaLHd1iOSD2QwDUF6BI94mnky3FporMCtAuVsed6/XDIqRP65Wqb80UHSxBJHbYZvONMaE9pyzydPGFzD4jZkke0pammI9snwnOeNjBr+fB0TuwZ9ebjpaxaP3EpcwKp6yz30tmGp5Ikgeh5bdw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7988bf35-994e-4260-608d-08d7b85884c7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2020 12:04:22.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlGeM6PicH1L/xJy4EzlcrkDm069DYXTxkxnxJkQmwXhdHt0D84Ts2BMxHmcg1Qp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1625
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.02.20 um 12:56 schrieb Pan, Xinhui:
> If shared fence list is not empty, even we want to test all fences, excl fence is ignored.
> That is abviously wrong, so fix it.

Yeah that is a known issue and I completely agree with you, but other 
disagree.

See the shared fences are meant to depend on the exclusive fence. So all 
shared fences must finish only after the exclusive one has finished as well.

The problem now is that for error handling this isn't necessary true. In 
other words when a shared fence completes with an error it is perfectly 
possible that he does this before the exclusive fence is finished.

I'm trying to convince Daniel that this is a problem for years :)

Regards,
Christian.

>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/dma-buf/dma-resv.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 4264e64788c4..44dc64c547c6 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -632,14 +632,14 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
>    */
>   bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>   {
> -	unsigned seq, shared_count;
> +	unsigned int seq, shared_count, left;
>   	int ret;
>   
>   	rcu_read_lock();
>   retry:
>   	ret = true;
>   	shared_count = 0;
> -	seq = read_seqcount_begin(&obj->seq);
> +	left = seq = read_seqcount_begin(&obj->seq);
>   
>   	if (test_all) {
>   		unsigned i;
> @@ -647,7 +647,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>   		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
>   
>   		if (fobj)
> -			shared_count = fobj->shared_count;
> +			left = shared_count = fobj->shared_count;
>   
>   		for (i = 0; i < shared_count; ++i) {
>   			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
> @@ -657,13 +657,14 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>   				goto retry;
>   			else if (!ret)
>   				break;
> +			left--;
>   		}
>   
>   		if (read_seqcount_retry(&obj->seq, seq))
>   			goto retry;
>   	}
>   
> -	if (!shared_count) {
> +	if (!left) {
>   		struct dma_fence *fence_excl = rcu_dereference(obj->fence_excl);
>   
>   		if (fence_excl) {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
