Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B2560EFF1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 08:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE3910E4CD;
	Thu, 27 Oct 2022 06:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A3110E4CD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 06:13:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rvdei3SF+YxsydyyPYH4IadqoZNZ5QpVVM9yfjktVAiiCLs+JPRNu7meY3K2iXAf5qfE9Zo8Ska8rsEqDoMd/aA1J5itBMHKA2j+ibZEpkHl4gLB9P13fUDDL1lgKK9kPz2A/Gp59i8mudqaNv6gGEa6d5s2r2XKmfOjtc0kMNpvqLxQIns4zZ1IRYwIbhZNRkm/XeVS/W+r3yCnERr3mGoddhhgj72JovOWi4eR68iGGmyugSN3FH9qM632M5/unXKeDgxa/Z6tXFkhzile+icA5ar17O/GMsb6vzq9NoXJgZ8uany9X7S/72y2WFByKHYbe+c1OdbZAHlccV/qGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hMzBadntLJ9F82KoDHR1wWGe1TN8F9dQzNfrPUvKRY=;
 b=XBzq4enzqJLVTkHaW79zd0iErlcSyzzbiZWRw2UHOM9X1QanjFX01J9/UMB1K3wOvc+Z1/nW98Ua0DMbyTJap2qrfEYoqGLGrULQZYo2SPkIuBDGWJvoRRUGDwA+NxAchny+4tU4JoIzoReIjnoonA5U7r8o2lTPjkCY9YWiOnzx3hBu174k6qJoGnrDK9izfBcrndNxqbps5E/U2J0v2z9fe8OQmZ7DGRS6t1qFYRYZWzUYjqFmOLDcKBKRjUUg3uBLBTxgv62qY6FZFUMJ96UuLkGn6v55vmM2hF0TwGAUfBgv+6Js6/F9RCk0dzpCd90ELYZBBCaZ7vHjHIJATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hMzBadntLJ9F82KoDHR1wWGe1TN8F9dQzNfrPUvKRY=;
 b=EZiDLUJ1l5Y/S1qAY2dZ1oMw3W6ju+6SHCf2IvzABpnBWleXq5u7ME8DqLFjyDlhrMu7k37dKrUPvbLCyh9fHqxCXtoQOp7bdfv/UftBrKuxZTHq4/ltzjj+U4yotmTfCieCP5GHDion634Wv0G0mF1Gd+fCd/xjOCssQWnOitw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5305.namprd12.prod.outlook.com (2603:10b6:408:102::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 06:13:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 06:13:52 +0000
Message-ID: <01f62e6c-a40b-42e4-6cb0-338bd268b0a5@amd.com>
Date: Thu, 27 Oct 2022 08:13:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/2] dma-buf: Make locking consistent in
 dma_buf_detach()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, noralf@tronnes.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20221026224640.7542-1-dmitry.osipenko@collabora.com>
 <20221026224640.7542-2-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221026224640.7542-2-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0030.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::35) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 125caf6a-8b3b-4c13-a5c2-08dab7e26b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1ErgpAl3FxFVhT1YW0i1b4NAv5EJO2ckP+PNodjLQmRytlhIarM5Ad0tmC9V0g+gF5xLfNexD4TZdAjKJP9AA50fk3G+MTGZfP49dPD0PYOnaI9NTGV+qftnPwKGFWlYaylq4hvPHYNnmxC+lWMSNyKAoNMr5zFO4093TbYg7cWKVQ7+0ETeIcPmXRAE4oSHKIAxi+NdO3nWJ5kcXy5+26S6baqWFd4AxMLgXp2fqNheLSBKGXgkxeS8012w9FUekLiXqYolH5rgVJa9xYQEUDxZePw2NumJgVyyLRTKcAyEubAxrKNGuM2LcksgZjPxNRes2I9sK7AgWpjksbg+kFKfjBLrjG1zOApubK3Fa+WCqCCo0HRcvpgdg4gylJZEoTpsqHpOIR+d7Zn2/0Wzczr944ok28dW6FJ11YphoH+Mad8lGHUrBTpjECa3RSfGGX3XvWTrJptjU0beRFKY8WfqFeuzqkCrOU1N6ha3rhwanWKG9q9K2qB522XQ4q13LdHq0FQ65T16+qGfBOpdCawGkdKsSYBQH1ftAH1nk8+ApBxPS8/INWqKBuUt9Rs5+7KN4G+kyv3KxzeneZw0rWozj3Jr8hAYVpnAjY0z73hKN9SikW9P0SU8ECGy2LpQDkN9rytKQB61gk4LsI27Ut5Kw7y7APq0sECe+ky3vLesbVxLBebnF9elzYA8QSDNpE4De+SK6dFfQxxlN9veaBQ9WPxVg0CZYEi8okRIzQ213lH+K0COjC6v7684i7YTFr51Dug/ctYK2G7ZVqxoHRdrK1aP8V8GFQ9KBwSFJ+y5CqvEOasiOyv/a7rJhi/bttaORfxXlmDToGhJYNFwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(4326008)(36756003)(6666004)(66556008)(8676002)(6506007)(66946007)(110136005)(66476007)(316002)(38100700002)(5660300002)(2906002)(186003)(83380400001)(86362001)(31696002)(66574015)(26005)(6512007)(41300700001)(2616005)(8936002)(7416002)(6486002)(966005)(31686004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtnMVh4SXVlU0F3NzR1QlliYnVxOW5laGZQR1FMK3g1azY1T0ZPV25KODNU?=
 =?utf-8?B?NUU2N2lQMU5qTmRDd3ROS1JOTEpoM09aMWJ5TWRBWW5GNjVTNFp1V2ZLZWdJ?=
 =?utf-8?B?MjB5bk5WNDNMZmV6OWRQVjdOclpNcFRqejNxZkJna0ZjbUt1QnN5OGxzUkh4?=
 =?utf-8?B?VmttTi9ld3FJR3NMdmVRQlBHeTZTbmxQc1Rla2ppVVVUTm9tNHZRZmw0NGRN?=
 =?utf-8?B?YkZYY3JrYkhrMXNSZnI4NzlCTGdwalFMb2kzYWFRdUpEcjdOeGEvQkdnditr?=
 =?utf-8?B?M010Z29sMUFiUXRmbVJRVHFleWQ0cXYySnYzWWNlclhwTmE0R2lCQ1V1VE5K?=
 =?utf-8?B?b2lKLzRRTEMwbTRCNnhzaGt3WTVsZ0g4Mml3blJhQ0Y0VEJsUjlUK0pRbGtE?=
 =?utf-8?B?eGxNcmZpZXpzRjFXTGFCdUE1RElUMCtBZ1dCdzI5cWVDOGJSNytVeDlORklq?=
 =?utf-8?B?dDdIcG8vM1hsVDFCbWNWUVhRUk5UbHQ1RzRFb2FEdkd0aWVNQlhHdW5ZcFNB?=
 =?utf-8?B?eW1MelZYSzhzcCtsRTJPY3hDREFieFJKck1HYm1VSVF5MWI4cXdjcHNJRjdy?=
 =?utf-8?B?WjA5ZG1Hd0VIUjdiSHF5bHFrektVSWl3a0V3cjNpNnI5OUVBNnJRZFppR2FV?=
 =?utf-8?B?VVViL0NQWTlaZ2pDVmgwMWpxc1o5UDIyQVFHMkhFSmpWWXhLakxuSU1PZ1VX?=
 =?utf-8?B?YUZ1UUdOcmV3b1ZyalM3bjUvQ0xaOHlOZlFaalFPYmdQVGtYdEp2WksyQkR6?=
 =?utf-8?B?MUg1ZHhLVFFleHJtYzZna1Y2SHlPODAvTDB1SXd4VHlodmRRdFg5emhUSGNy?=
 =?utf-8?B?aHZCenI0NThBQXJuZnV5eTYvZ1FNOEtyMnpjY1RMQjJLWWRTUVE5VmYrS2RR?=
 =?utf-8?B?a21qSmpVVStoM05jcjJxamNpNkg5RkVKaWhSR2Vucng2WEUwdnI3VTVLakRn?=
 =?utf-8?B?WFNwMy93M3lZSmRoRVc3eXEyQ2N4alhFSnNiaUtPaVJCQ2xvMVhkVmZmRnZj?=
 =?utf-8?B?aW9INExZb2lRS3dmQXpIL0Q0YlJ6dDA2KzZsNkRBaHJHMGZLR0kvK2RPd0d1?=
 =?utf-8?B?R2hGa2daREF4T3hEY3laNjFIK1p4eElzeUk4N3pxaWovNWp3RFN1OXhQaS9F?=
 =?utf-8?B?cTJNN2czc0JEK0IwM1gxYWhJak90TmJpeG0zOCtES1Rnc0NVdUJqK3RWSTc5?=
 =?utf-8?B?VzQrSUtieWVoam1oSlJJYVJxZWVZNTNoU1BDaDkvS2t2N2EzU2o5U1ZRMGkv?=
 =?utf-8?B?NzA4VnJuL1pKaXhyY2pkaWI3TE5jdlZ3WFZSNE9aUnZha1FubC85elFmRjVS?=
 =?utf-8?B?Mnd1cjB6TlZXN3BaOGZxQmpNeFlvVWZCdC9FaW1GQVlmdGZvNnp2WC9BV3lT?=
 =?utf-8?B?RCtiVlh2MEN2cTRLY3JOSTNMdU9RcEo3VE95cFoxUWs3NzI2ODIvTlV2d0d1?=
 =?utf-8?B?YTJCYmlyU21ObTFZNFZEMDJXZk5KOSszOVRLVXplQnVTYTczbnh3SVluUEZm?=
 =?utf-8?B?bmZoV1JWSDE0MlEvcm9Mb3pBMERDNWxpMnJiZDVaN2EwM1hNaTEwSVpIQ2hl?=
 =?utf-8?B?M2JwVTNFd2NYWDFYdTJiOGcweGRPWHltSWY3bTBVa29USi9YNUxmcUgzdFYw?=
 =?utf-8?B?czhzcVljeVNMZDlCRGROMU5aa29OTTJlQ0YxaHF0SDJQZ0M2SmswbHpob3d3?=
 =?utf-8?B?dmVpdWhwVmNiajFvd2pWNWNPSWh2cVdqTUJlRG5OVHMxZ3NzY0xmZE04NUNL?=
 =?utf-8?B?SUpmbFg1czVnNXV5R2laNlBBS3hBdnd2Ri9PblNFdENhWXM4SHA0OUtTYzMr?=
 =?utf-8?B?UnlsaGtNQVJDeG01UlFacDlYd3NYOE0xRGh4UE9RUncxRyt6ZVN4NEJWK2NV?=
 =?utf-8?B?dE5kaXFUQzJ2WUFOWXBnNW1CMGJ6b0tXb0VuemFQZERQemJKRk1TV3p6MVF3?=
 =?utf-8?B?MkMyYVFTZGJXd0ZHTnpvWGdCQlExZkJJMTRUYXY0UnZaQUt1cDRNYm9QcGFW?=
 =?utf-8?B?ajhIYUpQeHdtMEZEU3h5WnhRVkNrQmd2Y2lXdGtWeHBkczNPNWxFbVFxd2lw?=
 =?utf-8?B?SjlqWHo3TUxlUHJGNFRXYm9sMlNNTEwxTDlkYmNkOEVWQ00zV04yOG9GYkJ0?=
 =?utf-8?Q?Vop6BDNQ/GC4DYtLid/wuK94P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125caf6a-8b3b-4c13-a5c2-08dab7e26b8e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:13:52.3848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ps/CfkWuPtnVmbvKvzj9L7LXHHTbPmUvCcn4QIswJV1ZuD0fXcjBQnMwRTnwb5AT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5305
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.10.22 um 00:46 schrieb Dmitry Osipenko:
> The dma_buf_detach() locks attach->dmabuf->resv and then unlocks
> dmabuf->resv, which could be a two different locks from a static
> code checker perspective. In particular this triggers Smatch to
> report the "double unlock" error. Make the locking pointers consistent.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Link: https://lore.kernel.org/dri-devel/Y1fLfsccW3AS%2Fo+%2F@kili/
> Fixes: 809d9c72c2f8 ("dma-buf: Move dma_buf_attach() to dynamic locking specification")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

It would be even cleaner if we completely drop the dmabuf parameter for 
the function and just use the inside the attachment.

Anyway patch is Reviewed-by: Christian König <christian.koenig@amd.com> 
for now, wider cleanups can come later on.

Regards,
Christian.

> ---
>   drivers/dma-buf/dma-buf.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index c40d72d318fd..6e33ef4fde34 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -998,9 +998,10 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   	if (WARN_ON(!dmabuf || !attach))
>   		return;
>   
> -	dma_resv_lock(attach->dmabuf->resv, NULL);
> +	dma_resv_lock(dmabuf->resv, NULL);
>   
>   	if (attach->sgt) {
> +		WARN_ON(dmabuf != attach->dmabuf);
>   
>   		__unmap_dma_buf(attach, attach->sgt, attach->dir);
>   

