Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C9423E04C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 20:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B386E902;
	Thu,  6 Aug 2020 18:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4642B6E900;
 Thu,  6 Aug 2020 18:27:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJyreli7GlBcLD6XdUoY9Ns38KxcbkIrloKhcj+kn1jAY9EdreuPhmdHHtMf1vYkXP8nxBwQ8wXzhLRD1Cnkt1FxqLdViEFgR2h9PQkQu1L2fLTpraruXQvsJ/J585nA1S47JF/fjneulyLeiqJ2pkPpYoOwjO9SqwdC3zCO7fTFKISdKz3fmPTbEuhTgzNAm36yWfEH3NVF0J2iux94bPOlX+pvyVamA5PNJeEC1U9OzCTLs+3o+7WfWHHbxmfbb13Yq8YJLbAigB0nMbnjop4oIROPw16j66tprMME5sw3Hhxh8lDWT8p2KvbFbajt8b4NXCfwSS1X55V0Y2wTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21UPb44ttwpdQbCRt5mVA6kTu7oTVYcMuA8kEYykF/Y=;
 b=kJoZRFuY+DUiTz23r8H1TK+xeNyzxnUs5AyaIl4U2MLJDRmf5XMhyQuHXIdbguhj4fpLXWdmTeiV++DfNV/KYxSuQi/d5DYdcdQhJr1OfHgKEvNRJtBA1tMsdZHjy0xIqSoADASCin8wCE6aQaO/FF/fJ31MdSKCBYA9fQ6e1VZZ9e9L6jaC1Z6rtHEO6X9Gy6zYGJA4lP65u6X79joM8ijhJrmGko7l56EcS6o+M+nVyVCgf322GC7ZHicXbn3QmrqO+JynhqaR1HwQisgCVPVn2mwLMSRzZojHajF4P8UoHJpkg5OzaXqMXHSed9AQyakFa5pDnMD8jTWWjDZ7TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21UPb44ttwpdQbCRt5mVA6kTu7oTVYcMuA8kEYykF/Y=;
 b=I5C224hH1awAcpSzM7+7rYwy0VmfBDMyhddgroIx4sEQ2bqstYK/sdY7oNV6II48JT2wu0VldiE0A+L6FXhGgsQ/RsHEmoyjVpQJWSniki+8h5SAdQmrW+Vucq6K6CdEd+hZrrL4Xvn4fCdxwElciXIG5e9IFFuGrpy4LzAKDnM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3561.namprd12.prod.outlook.com (2603:10b6:5:3e::26) by
 DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Thu, 6 Aug 2020 18:27:30 +0000
Received: from DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6df0:61cb:d37:2a0b]) by DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6df0:61cb:d37:2a0b%6]) with mapi id 15.20.3239.022; Thu, 6 Aug 2020
 18:27:30 +0000
Subject: Re: [PATCH 5/7] drm/amd/display: Reset plane for anything that's not
 a FAST update
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-6-nicholas.kazlauskas@amd.com>
 <20200805204557.slkhfawjexrqzawu@outlook.office365.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <fbd81eb9-0fec-6b5f-190e-49c3d4b40600@amd.com>
Date: Thu, 6 Aug 2020 14:27:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200805204557.slkhfawjexrqzawu@outlook.office365.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::33) To DM6PR12MB3561.namprd12.prod.outlook.com
 (2603:10b6:5:3e::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0124.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 18:27:29 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0348631-6496-4bc5-fcde-08d83a3660af
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3897BD1184D980B691457F50EC480@DM6PR12MB3897.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lzoGDAjhkLl0HZ+1rOuc9FSYhfHefduiyhfz4uCDMRIYir3xXU1uJSQhroGYD8Hsk37Ft5dvviweXLHC6QPTD7P2phLu2fE/CL7x00DRk9bMOPNIROtpemL9LxCJo9ZwZjT9btjdxUp1xNsZAtKIn9VOvQyG5zFbbMgukawLuBLV5gAjRoc8AEq2M7/LMbNK7N6FvxWuSG7rWnK73ear6Czobfdma5dsz7mAfg91Hy5ENIEhLBlqo0An/PKymoug7K2YKNd3BDhPzp1aJYHlsP945VVufaNq6pEGrqMpTO36Okwyx8KeXh9uPT6j9Va6MixJKEXYeRZuXKLfGRzzcNcPi+ldI8uKPBbiFFb0WFCMupxW/5xBJ/c+Ee3XlwmWzqd1MmGsXFYFtusOIwfJLGy6H7D69paEOOVrrAwBwJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3561.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(5660300002)(6862004)(6486002)(15650500001)(52116002)(450100002)(2906002)(16576012)(31686004)(4326008)(54906003)(45080400002)(6666004)(956004)(26005)(2616005)(83380400001)(53546011)(37006003)(966005)(66556008)(66476007)(66946007)(6636002)(8936002)(316002)(36756003)(86362001)(31696002)(16526019)(186003)(8676002)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KAmc9X8sNOSnHqMMg7ES9lghFrONDk5BLwLPP8MGRIiXBQDj564++R78YoASkFMrVSwWnvPIOIg6sS0DITboGND/M0WQAuL6SEE8Ko7FbnwAakPe2a0YZCTRR95rcPS3SXYztFF2oeerfCalqAG/ObM7jFfezddLOXwWG6tr3ot0nW84U4W1I6IMaTJSHzitWFS1HL635IEfi8edwmj9tgRYKaUBCCcyN5Ln4/vhtrvCR8o8OQxq7ir+x5IVlHmSTPk0taPoej5l+bXvvna70HgMapiIKsFLF+41uBd99Pl1LZNGcDublOC+53QyOgpC2eAiO5OxXw/rzyT1nc9BIX2upvjFm6EWxpgdEpDmRZNyVllST8sD6X7hYTegpVlMZzEOYn7aDOp48uBYaZFpfw/5OJECKi4DFchiEJo1BzqKJJYLmDITIYWxzQ1FfqDAP4kSjZmP4Q8irKtQefWfvLbk+JGCraDwj8QT0+8HSzGU9kX8Ih098GZ2i3A2vQJULdf8esmA0TlZjYLsRrGSy0Jw3yfr8vJHJu7R+ZxC5XcwUWOfVtOlkgHYcdfZ7I41xxBiUypMcJakpXsqnhMxGKz/PubqtTaiKkmpuLI/rTQBW+j1iwSjkZtxlZGQzK0KLxhe82ogGXX6xYC/33BmkQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0348631-6496-4bc5-fcde-08d83a3660af
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3561.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 18:27:29.9615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+wj2d0s/MXDnDLJqICHHNlRLR0iPIyoYIgFeNW5mIy+rGS97hpWBSM10uHDchyWVNVvZhjF4bKLcFA+No42MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3897
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

On 2020-08-05 4:45 p.m., Rodrigo Siqueira wrote:
> On 07/30, Nicholas Kazlauskas wrote:
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
>>
>> Optimization can come later so we don't reset DC planes at all for
>> MEDIUM udpates and avoid validation, but we might require some extra
>> checks in DM to achieve this.
> 
> How about adding this optimization description in our TODO list
> under-display folder?
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Sure, I'll make another patch to clean up some of the TODO items in the 
text file.

Regards,
Nicholas Kazlauskas

>   
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
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7CRodrigo.Siqueira%40amd.com%7Ccc095e7ce6164f529e2708d834c86d1b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637317382766607890&amp;sdata=omLC%2BizXVEjjGe6IylBpniZzyUGlzTATrgRoWEo6dHc%3D&amp;reserved=0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
