Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B69C23EF01
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 16:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006AB6E9EF;
	Fri,  7 Aug 2020 14:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C066E9DA;
 Fri,  7 Aug 2020 14:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjGO0DoEp+J2wBjdS6PyJf6HI/M+UqlrVNlXD7uqKy3YkaTJu1g8BwF04Tbr2B4Rb16ZGkoLuHAOrDbLeyMHvxvFzPmdlpMfq5sOacJpt/0tasNILyR2CIe+CDzTkGawRMUJSn0Jeo2rjEUT/6ezM14xUFRpvgZaycAuYIWlb6YQGVH38dI0b+LMj9fiKVSpluQuM47QCihyvB/lfVZDL+NlNaar59LHQrNGAJ680bzaI9HzrPsk75dda3wZ/Xja+REki+39tUI5Vmk+WCOVm1S2rQEAuM/nPRKT3bf6F88OgErrQ4p/vkoIwJhBjyeV8TqDdC3+UInatySXtYwFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqFS15gdHx2jjHC0BhkkA/3jhvNzI9MAORtYms3VN8I=;
 b=V+kmudYk5cpEcgo1dvDM/8SrqTMvXgo5RUDMCZM+HbmmCi2xdk1ht8hSNHNl88TYSj2Kwd3SbvDnuiYG7Vr/u7Zv0Wo1ckCzocA1H2IwKMJ7tcMuWZU/rtgo2JhTdY6lbrxmEnbxWHA5eLJJlNDOw2TXrSAXBMkMopquEuBLqqKxrjguoOPyJP3oegB8y1OcVUVx0q/YQiW/DgpsGVuFgLjZmzlxJSV6Ongf9JPkXSKVEic7AxNOsRjkURLCNHMxsUz9WlzyuxjQ3vOShCUdEmn9Xi4u9Xne37tMhvvF8Mus+/YLpWZ7u5a9om8HUEJUr4mIzT31WnwmTKpE0ZlTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqFS15gdHx2jjHC0BhkkA/3jhvNzI9MAORtYms3VN8I=;
 b=juQ3+Bue2zoT78JuhI01D0uHzhkY/FwbtVjoJJUdP+hh+FOHqCrqsKFqhQTU//MMBIddm2THeqv8atILxpCuUWVUjR1hWjva1bWP/5ayG04rGH3oEt9Q5aXlmzXepDrWvg6pKY7GrAcyB+oMBotVdfR7m1ru6BYUeodDABD/6L8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3285.namprd12.prod.outlook.com (2603:10b6:a03:134::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 14:26:58 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1%7]) with mapi id 15.20.3239.024; Fri, 7 Aug 2020
 14:26:57 +0000
Subject: Re: [PATCH 5/7] drm/amd/display: Reset plane for anything that's not
 a FAST update
To: daniel@ffwll.ch
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-6-nicholas.kazlauskas@amd.com>
 <20200807083424.GM6419@phenom.ffwll.local>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <6790c248-d46c-d3e0-b87d-c73823556888@amd.com>
Date: Fri, 7 Aug 2020 10:26:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200807083424.GM6419@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::33) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Fri, 7 Aug 2020 14:26:56 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6211666d-1d4c-4e9a-0c5b-08d83addf09c
X-MS-TrafficTypeDiagnostic: BYAPR12MB3285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB328531200F036CBF9F87BA78EC490@BYAPR12MB3285.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ZfkGZxleKRtdiLP3JZv1FjJopx/RRoObgjBUVDbj8fdmlLqI5rXhh9j23noRCKN8KkIsMW4AfMAbg1UtEiQHRsbRiDzumxEzL5XNxHwk57ThWQBLOYGkDd6w3XT+EL1eEHp+kvMMIVUTvlQvpDBzGKhxomGP/HAirEoXbMzzaczdZptmvLoO4JvS2pwNPWsWMoUAmpJRp6fZtNTj2qhQvNAw7RaiR4FELAu2zKzQCkFWxsAOF9dyag5AqkQfZQjQxb/S0Vu86fRUysNRMu0VtLiqxWXjGNvP1Nc7DyCxmf20L7TVaHH9kbGUvSbD7V8l99xB4VrCOsjXORnJ6kVElrAReQ3k41m7h3c5XLN1gDv+cVaAGypP09ZbhcG5XP7yL5dEqWbLgq0Cy1ZODGhPSGD1oU3zBXfcLpj4HMbrYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(15650500001)(16576012)(8936002)(316002)(2906002)(66476007)(6666004)(5660300002)(66556008)(36756003)(66946007)(16526019)(186003)(52116002)(966005)(2616005)(54906003)(31696002)(6486002)(53546011)(26005)(83380400001)(86362001)(6916009)(478600001)(4326008)(8676002)(31686004)(956004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4YcVd3iX/QRCHjoKCPUqaVkcmY2GAMvtjYFGc4NZPVM88eLl33uwMnGTLWUeUeSmV3XQ+uor0cRV4KKsbxwJJlUflMGMdH1ncTkrQuOOubphzbdkNaW+p9eiLTTePMoWb+0br7WUU33jCZ1iVAi2tH5o4+1GkiDNpC0KZE4ysqNbUac6fy6UjhDrEqB5r5Q97A7/Xs45hQ5J5k1Yiw7rsvfgkgEAdoDpf5q6A5H0z3hJ68k2FUVPPcs16Df1Xfk1uINm4TXoTiMfQuqSikCvHUpJZWoI0mQWBcq0yFAgAd1+nsm9SKXmXDrxRb9XYFQYXK6cwNhLOVoxaYfOdKZSZjEycfSAKK0s/eHPNBvcYj8HJbVqQlbmRQwFY3F/7TrF34KvW2BM8QaIlsYOqSeiEe/SrwEWSfalvohaaT67PTDYM1Y1qVbPtRq4gZ4wP/1DmqS1PpW58pLjFex9wKtbd24orJxKkufm2z9GGE9vGytzatF9YfPkPmHaWR5ac1pXuT3yccs8MdT9uF7GNurCjB3rseYEcQesUN96fFADOXLq0YSflb0m0dSsbhWgCnLYlA4EkeLZdJLatnqKuDy8HIFr5YvWLYV2aYnVapFOvboxoVx+/xC8FDj8oYP9Eu7KqWkoKq/SZWMMr6pOKIvF9g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6211666d-1d4c-4e9a-0c5b-08d83addf09c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 14:26:57.7843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgPvJQbGkqwsKD3oN1wS/JknkYvaSGkBj+UehLq/s6EUtpABwCNp60jWY6r3v8/+V+osG0m0Llbw1tpa4+1ZMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3285
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-07 4:34 a.m., daniel@ffwll.ch wrote:
> On Thu, Jul 30, 2020 at 04:36:40PM -0400, Nicholas Kazlauskas wrote:
>> [Why]
>> MEDIUM or FULL updates can require global validation or affect
>> bandwidth. By treating these all simply as surface updates we aren't
>> actually passing this through DC global validation.
>>
>> [How]
>> There's currently no way to pass surface updates through DC global
>> validation, nor do I think it's a good idea to change the interface
>> to accept these.
>>
>> DC global validation itself is currently stateless, and we can move
>> our update type checking to be stateless as well by duplicating DC
>> surface checks in DM based on DRM properties.
>>
>> We wanted to rely on DC automatically determining this since DC knows
>> best, but DM is ultimately what fills in everything into DC plane
>> state so it does need to know as well.
>>
>> There are basically only three paths that we exercise in DM today:
>>
>> 1) Cursor (async update)
>> 2) Pageflip (fast update)
>> 3) Full pipe programming (medium/full updates)
>>
>> Which means that anything that's more than a pageflip really needs to
>> go down path #3.
>>
>> So this change duplicates all the surface update checks based on DRM
>> state instead inside of should_reset_plane().
>>
>> Next step is dropping dm_determine_update_type_for_commit and we no
>> longer require the old DC state at all for global validation.
> 
> I think we do something similar in i915, where we have a "nothing except
> base address changed" fast path, but for anything else we fully compute a
> new state. Obviously you should try to keep global state synchronization
> to a minimum for this step, so it's not entirely only 2 options.
> 
> Once we have the states, we compare them and figure out whether we can get
> away with a fast modeset operation (maybe what you guys call medium
> update). Anyway I think being slightly more aggressive with computing full
> state, and then falling back to more optimized update again is a good
> approach. Only risk is if we you have too much synchronization in your
> locking (e.g. modern compositors do like to change tiling and stuff,
> especially once you have modifiers enabled, so this shouldn't cause a sync
> across crtc except when absolutely needed).
> -Daniel

Sounds like the right approach then.

We can support tiling changes in the fast path, but the more optimized 
version of that last check is really linear <-> tiled. That requires 
global validation with DC to revalidate bandwidth and calculate 
requestor parameters for HW. So we'll have to stall for some of these 
changes unfortunately since we need the full HW state for validation.

Regards,
Nicholas Kazlauskas

> 
>>
>> Optimization can come later so we don't reset DC planes at all for
>> MEDIUM udpates and avoid validation, but we might require some extra
>> checks in DM to achieve this.
>>
>> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>> Cc: Hersen Wu <hersenxs.wu@amd.com>
>> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 25 +++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 0d5f45742bb5..2cbb29199e61 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -8336,6 +8336,31 @@ static bool should_reset_plane(struct drm_atomic_state *state,
>>   		if (old_other_state->crtc != new_other_state->crtc)
>>   			return true;
>>   
>> +		/* Src/dst size and scaling updates. */
>> +		if (old_other_state->src_w != new_other_state->src_w ||
>> +		    old_other_state->src_h != new_other_state->src_h ||
>> +		    old_other_state->crtc_w != new_other_state->crtc_w ||
>> +		    old_other_state->crtc_h != new_other_state->crtc_h)
>> +			return true;
>> +
>> +		/* Rotation / mirroring updates. */
>> +		if (old_other_state->rotation != new_other_state->rotation)
>> +			return true;
>> +
>> +		/* Blending updates. */
>> +		if (old_other_state->pixel_blend_mode !=
>> +		    new_other_state->pixel_blend_mode)
>> +			return true;
>> +
>> +		/* Alpha updates. */
>> +		if (old_other_state->alpha != new_other_state->alpha)
>> +			return true;
>> +
>> +		/* Colorspace changes. */
>> +		if (old_other_state->color_range != new_other_state->color_range ||
>> +		    old_other_state->color_encoding != new_other_state->color_encoding)
>> +			return true;
>> +
>>   		/* Framebuffer checks fall at the end. */
>>   		if (!old_other_state->fb || !new_other_state->fb)
>>   			continue;
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
