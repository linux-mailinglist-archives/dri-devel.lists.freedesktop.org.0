Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589AA35AFFF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 21:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC546EC97;
	Sat, 10 Apr 2021 19:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F073E6EC97
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 19:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J308vFOB+htRbYTGmS8TgmCzixlPetNMm6dM/ElYoBNEaiNfwvt5OalwmTQy8d9cM/L8zKnSR4hB1n9tmCiWom+PekX9m2Yq3eUOQdJAgCmfKgaiUP2o0kiqVELR7+4fUx2vjCEFE5NujRD6S/GQQEIB3TCa9FKJ6g+L64pHBCqXyfQk4T0OslEYFl4nPnCGdsJxlcVXkaixt40bPeNwPZpJ+4O39T8vTGZ6w6UxJo3x71ytT7Prov1zXNRcxNs5hfCDKeB7JvofkFzU5UbX2jspGqb9nOe6A0JIAzKriri1n7hvbNWFfiP4sBCE8ejFmogHvprpXSs7V51eO65BdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGP2ZyRIUaEjw71ENgrEi3ExEyqm0Ljn2pMVgkFy9XU=;
 b=XQeVF7az5svIA9V+U0yOxjhR74Nt8sKpezyjhmk1o6i1q6sKyKYPThqMRBA6q85f+0KKrBdhHVxz9cwgYDN7V/mMzGryKGtHKJVAyQfxxg3MDyqN0+YzauPSA8ihSjEWnKw58CT2kYn+F9JTd5VtpWNu+vtrhusRUkv1nEtSVVeVrcGJin5dlsNiL3q8zF0eVIg1BaLg7AGEnGZmK4nOLsb7cVJ4kmeJBZlDblNbQkMtGcdJEWoEbyeBfNVkQJrAOYfmD6531vgSwVkf30Z9nJ+tUXzvGcrDCt3F0xdDlrm5vdj0rwlRmb5ciTjQntVTgAyoPjH5GKInJCgmalAkbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGP2ZyRIUaEjw71ENgrEi3ExEyqm0Ljn2pMVgkFy9XU=;
 b=sRwdMjmMaM83vLUQmjxYJbIt3y55CrY+yVl5DInXbyBNRXshmiV5I1BkdRQgpfT2AoitXcuavlo8USpPRBBOuJ4+icY/J0PFpLr/i6QB6Z1HUX5EKA49rQeEVs3cIRwa085ke3MTbEdcsdc7UeTZelE0uj8J2QOAsNrnVnH/RFQ=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6365.namprd05.prod.outlook.com (2603:10b6:208:dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8; Sat, 10 Apr
 2021 19:02:51 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4042.009; Sat, 10 Apr 2021
 19:02:51 +0000
Subject: Re: [PATCH 2/2] drm/vmwgfx: Make sure unpinning handles reservations
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210408172245.673785-1-zackr@vmware.com>
 <20210408172245.673785-2-zackr@vmware.com>
 <YHAE4nTC9Bi/s/s9@phenom.ffwll.local>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <7ac0aafc-fb41-ae06-127e-66d3180a6a56@vmware.com>
Date: Sat, 10 Apr 2021 15:02:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YHAE4nTC9Bi/s/s9@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: MN2PR15CA0047.namprd15.prod.outlook.com
 (2603:10b6:208:237::16) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 MN2PR15CA0047.namprd15.prod.outlook.com (2603:10b6:208:237::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Sat, 10 Apr 2021 19:02:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6984453-8b5c-48f8-30d7-08d8fc533cf7
X-MS-TrafficTypeDiagnostic: MN2PR05MB6365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB6365119D0F4940D3C63B3ABCCE729@MN2PR05MB6365.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zlTya0GvNy/PYnzZGb3KByrpz0EFWC9MLu9aWbOwoSDRIqqArz0a2LjO8ja7tWP6o5QzVkywU0kUD4DrXc76XeLQo0PLiH2JWMsH7QW0WeRk5XNYvdijQjhJWu6OEQcqKBdRO9Wmj9ApeqXVFxjNyotKFrvBTtEI42SZ1ceUxbXE2/7AatM516XcaoPn2hNcnsE+6VdsQWeyjUdcimP9RW53lhw5g6mDpE+lgyWpWS5uBo5MKZ8db3leqqIIlT61VD/IKqOsLLzUfbUVFIBhrNRVRw6BJYXXbG3lXyJpGnenA0zTKLEM7G/grjfvv81A7rLyR6dH9gnczVVfSftTXcSDwth7zNFmhHK0TnupmE49KBJKzyjMeMTLqnjKEfrr3TTTXiT8nxnSZ4UNpnsFc0SbY8ERorIhMtuFlGCKUy7rZ9m2oes6HUEFwIs4TSQNZ8kmMtfK17m+aXXMavhfpIIKHS6sVyKi+VGhaDaf8/1qNo92CP8mynOfOrccl0nodGq7xo4qEQgv44a03KL5f0HWdGh91CmL2awygL3Y7vfSGxUJp0jAGyfYPO1dkkDULjTL7XArdrsCvKGkAzW0TbDP7dQXG/xlsWAeVy2yCVRrnKnLWwonZ66hKO5inSjQOooPk7oze9ig+KsQEKRZbowmcLPf6Q83DtRr7MvJrJ+isGjWSvCbfNcYbdjYtkWW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(36756003)(66556008)(6916009)(8936002)(83380400001)(66946007)(38100700002)(478600001)(66476007)(5660300002)(31686004)(16526019)(86362001)(54906003)(956004)(4326008)(16576012)(8676002)(31696002)(2906002)(2616005)(316002)(53546011)(6486002)(107886003)(26005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TjZLaHFEMkxpaGpFMDRnREZOT2x1YzJUSVdmd0FTd2RWN1U0djRocTlSQ1JX?=
 =?utf-8?B?eUNlaFU1bmtSSFljbWUzUExzMlNTYml5cnVEdU5VcDZJejFFU2dLbFpWSHBS?=
 =?utf-8?B?WThnR0RjRWdkM25naXhYeTlyZHUybXBMdXB6QUZoZytXNTNxbm5kTnlmbnJm?=
 =?utf-8?B?Sjg2bzlnMnY3MS9yTzRQT3Q3bUMxT3lDL1h5STdVbWhRVVJUWXhac0lPZEU2?=
 =?utf-8?B?eERma1N1dXB3Nlh0RkVSNE84U3B4ejhpRVpHeDRwaktEREVNVndiRmV5Wk9j?=
 =?utf-8?B?RGkwaTVZNElueGV2MjY5NVprbkRERWswTHF5aGs5Q2JiWXE5ajB6aHB5Y0sw?=
 =?utf-8?B?Rm1sQllVSXhCb0JVeHY1dHBmL0gvQlYwRW1hb3krejg3STlDYzJqb2xUNTRV?=
 =?utf-8?B?UG8vTDFhVER4SGlpWXFlLzJ6dWpBOGExaUJrSEx2c0cvWVlBQ1VqVi9mOGx3?=
 =?utf-8?B?RklWbUtmTHlWQU1qT2NGMDdyNmhSaTVZR1FNY1YrVzE5OGFDcGEyWmxHYlhm?=
 =?utf-8?B?a2JVTWROd1Zxd0xnei80b2VEc3hJTGJXem42T2c0UXpNeEpoU0lvelZ3akFM?=
 =?utf-8?B?RFlQVGtoaDZmdzF3QlV6K2NrL005NXR4aXB0ZVNOV1FBZEtUdmh1MloyQ2hO?=
 =?utf-8?B?bkRZN2I0TCtDTE1QUFl4bXBPZWFNaTA3YUlodnczQm1DUVEzV3hnUXl0RzRi?=
 =?utf-8?B?UzhXZ0VDS0hlTzZkZDFmUC9ld1FKU2dKeWtITnp6MG1tZ3hNNU8wSHBzZ1Q2?=
 =?utf-8?B?amZGZnlOYmNGaUIvaWgrcm5mTkgyQTltaFBFR2RFMWlpYm1sMjZoZmhrQ1BH?=
 =?utf-8?B?NGZFM3Z3V1kyWFJpVGdtNmdVNDIwMk10Ry8xMm1QQU11Y3daOWttd1ZrTTQw?=
 =?utf-8?B?Vk9ObFZjQlVHWksxYXVSdE1uOUYyeWFLZmUrMm40bW45NTh1ajhKZC9wdExK?=
 =?utf-8?B?L2hldXdmZytwZmF3aFFBV0JLTjBHVWJOdnhpWWo3Y1dsVllnNXJ4U2NyWUtB?=
 =?utf-8?B?clplY1hueGI2R3FhV3JyOUV6WVV2TElYOEJ5Qk9GZTVwWFlXNVU5TzQzVTU4?=
 =?utf-8?B?bVJCUTV4aWVyeUJrSmFiOSt4REF3MGY5Nk1UQm1lbUpFeWphYm9yT1VWKzV1?=
 =?utf-8?B?WFBScXIwMmxNNTBUaHdRSEN4UndLMG5kcDJyVm5Sc1ZpN0tDL1Jia2x3eUNz?=
 =?utf-8?B?Z2hlMStMQzhjL1ZzTjFXd2EzS0o0b3VpYWI4aDJmMCtFZGFrcXZiZ095L0ZH?=
 =?utf-8?B?cnlyQjhYTG9WZ0Zjb2psVnJwbTdhaVhuQjlPYUJManZrNENnVVdGTXNlNlox?=
 =?utf-8?B?VjJSd08ybjY4V2ZHQUxsdnNDY2doWm1YMlpnd1BaSTQ3MTFoTGR6NnJhL0Ez?=
 =?utf-8?B?dVhpSkIvN3I3bGlvZU5yRlRXSTJTRlA2anVxU0IrRWQ4eGFaYzZaNGw2Q0ts?=
 =?utf-8?B?YzFUclhNaDFkQU1FS2lQQWVnRFd5NGJXdVBoWW1Yckx0LysyZTRjYlEwOWRQ?=
 =?utf-8?B?bEZGQXZ3UUEvM0E5MkR4cFFIT2x3cm00cmUrbThSNTZDaXYyOTdHOE96Vzlt?=
 =?utf-8?B?RVBMWDMxUGtoTkhaMWU0UGJyR0MweWdEWkx6Y0k5THBpclVqNzNxcFBPcHZQ?=
 =?utf-8?B?bEtxbnlKTEJWemRPL05rR3U1eGptSENEM3RUYnROSHZCc25mTVA5TTQrL0R5?=
 =?utf-8?B?NFNYT1FFZDljYWtFbGdFalNsZm9yd0JmT1NKM1cxbHVCOEdsemJ5ak1QRzVG?=
 =?utf-8?Q?7aL30C/xnFP5RErOt95ZwokEuXJDMTXwuF0U5un?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6984453-8b5c-48f8-30d7-08d8fc533cf7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2021 19:02:50.9962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOH/H8R7BrXTDU/XRso2Uv7rL0fl/+Ps1lmwklOWu86PUJLQjVRoCGPUp7JmdhkzTzWrFeUm+V/AizBaIw7qAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6365
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/9/21 3:40 AM, Daniel Vetter wrote:
> On Thu, Apr 08, 2021 at 01:22:45PM -0400, Zack Rusin wrote:
>> Quite often it's a little hard to tell if reservations are already held
>> in code paths that unpin bo's. While our pinning/unpinning code should
>> be more explicit that requires a substential amount of work so instead
>> we can avoid the issues by making sure we try to reserve before unpinning.
>> Because we unpin those bo's only on destruction/error paths just that check
>> tells us if we're already reserved or not and allows to cleanly unpin.
>>
>> Reviewed-by: Martin Krastev <krastevm@vmware.com>
>> Reviewed-by: Roland Scheidegger <sroland@vmware.com>
>> Fixes: d1a73c641afd ("drm/vmwgfx: Make sure we unpin no longer needed buffers")
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Zack Rusin <zackr@vmware.com>
>> ---
>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 17 ++++++++++++++++-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_mob.c |  8 ++++----
>>   2 files changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> index 8087a9013455..03bef9c17e56 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> @@ -1517,6 +1517,21 @@ static inline struct vmw_surface *vmw_surface_reference(struct vmw_surface *srf)
>>   	return srf;
>>   }
>>   
>> +/*
>> + * vmw_bo_unpin_safe - currently pinning requires a reservation to be held
>> + * but sometimes it's hard to tell if we're in a callback whose parent
>> + * is already holding a reservation, to avoid deadloacks we have to try
>> + * to get a reservation explicitly to also try to avoid messing up the
>> + * internal ttm lru bo list
>> + */
>> +static inline void vmw_bo_unpin_safe(struct ttm_buffer_object *bo)
>> +{
>> +	bool locked = dma_resv_trylock(bo->base.resv);
>> +	ttm_bo_unpin(bo);
>> +	if (locked)
>> +		dma_resv_unlock(bo->base.resv);
>> +}
>> +
>>   static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
>>   {
>>   	struct vmw_buffer_object *tmp_buf = *buf;
>> @@ -1524,7 +1539,7 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
>>   	*buf = NULL;
>>   	if (tmp_buf != NULL) {
>>   		if (tmp_buf->base.pin_count > 0)
>> -			ttm_bo_unpin(&tmp_buf->base);
>> +			vmw_bo_unpin_safe(&tmp_buf->base);
> 
> So in the unreference callback I understand it might be tricky and you
> need this, but do all the others below really don't know whether the bo is
> locked or not?

TBH, I just liked having all those paths going through the same 
functions. I agree that it wasn't really correct or particularly graceful.

> Also _trylock is a bit much yolo locking here, I'd minimally put a comment
> there that we don't actually care about races, it's just to shut up ttm
> locking checks. Whether that's true or not is another question I think.
> 
> And if it's just this case here, maybe inline the trylock, and for the
> others do a vmw_bo_unpin_unlocked which unconditionally grabs the lock?

Fair enough, I think that's a good suggestion, so I went ahead and did 
just that.

z
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
