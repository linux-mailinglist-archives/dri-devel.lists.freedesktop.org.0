Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E96A4994
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 19:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8156410E442;
	Mon, 27 Feb 2023 18:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558EF10E2D4;
 Mon, 27 Feb 2023 18:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ5vC+ALnXowIm887tJzWZVPJoaUaUB0aZMEgdeGKnv7lgSn/fYk9bsH8hhy5yD0yzvMrTfLa+O2hPXZLF+NB2gdYgveLgWhyQrsvIo3fGZQ/t9gWkbTABp21ikiHk1LqAK2JOEFwWKEi58XqEXyymFfG8AhwKLyTGY66xCBB6odDniorzWx4uRTKshg4UeYqFqb+WU/AcAcNM+YDRKH5/uDPK+xoAz5j0+G+VUwk8+q/zeb1WIzt7+O4oCgjtQvXEu2Uu+wEAbjONGFAmpB3Rf2sufCT+UGPJZumoBXsU9NSZdUkI39w4ciIOUiuyrVlTFYuI55rjUPyJMNjIZQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DsS1VDq1fGpwNQMDhQx4xlptqwQLvhaL9yXlS3oY3Q=;
 b=P8UKon5fQi6MdE2arWZx1jLMzjPvc/KvgBzWiWyoS4ey8kmpr1T326iNXPo6EgJALi+31fzEQCQt7mzUPCb80dquu5tOCimd2WMJv9utrr1v4+Tnu3YpDbyzQaBpl54x6gyoMZmlAu0qUzyq77IuvoaD7IMEit46Ktsfcdz3ZcmPGqBL2Wlo+O5jOs52ICnrKwC+SJc3tEqKf/bg0Kwc4EBoo37DFmjJggjYURSsccdkv63Fbx2KbrHaM3z/7E2Fq0drGyfYwVntQc7VdUrmPM0TP21/c7gsqCm0idU4zO99NSvCGdfQlMsFUEgESGd6WqT1rcSRNbOCrZrNfy3pYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DsS1VDq1fGpwNQMDhQx4xlptqwQLvhaL9yXlS3oY3Q=;
 b=yNmTNswS4+4Afy8SYtk8NB3QYKAEDykNsJoI2FAmVpem6x/jOnncBhx01iR1HJrHTqECGZaOYDANPRneo3DIhFt+nnvdlZ3fS7fiN2EuzpBx8TU803J3BYDhSWj1OO0eH9SVtOJYEwlVqSb17ySzy96TtOBFTgjnbYJNo1oThLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 18:22:55 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%8]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 18:22:54 +0000
Message-ID: <a1272944-c090-3670-bccc-339a853e4441@amd.com>
Date: Mon, 27 Feb 2023 13:22:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] drm/edid: parse DRM VESA dsc bpp target
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Yaroslav Bolyukin <iam@lach.pw>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230226141051.21767-1-iam@lach.pw>
 <20230226141051.21767-2-iam@lach.pw>
 <bed5e04a-a0e3-fb80-d75e-cdcd85efe7ab@amd.com> <87356r117t.fsf@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <87356r117t.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0230.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a7cb4b-848d-4e29-df1e-08db18efa4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o17aIux+hQMfcP8Fnog60pH8rj1/M3pS+ilgV/ZBfrjTYmHP7ypkgJ2+kFwjWBL/shgG52RfkkPGzyBwccheLxi4Wuf8+S97aknDeclnGKlzQauDzocBKlsZHlWZJfN/5tGaIzhdrbdaZZ1WkyI+v4PvdjC3mZXMvtUT9PULs9NgVgPRbCsICmFFFmrHimeHDZZxGiAYSHedXrYRhnhvGdPwJJ5BgeqF8JiKpMPmzoFRAD1F6Qqqs3RNJCxt0emaqrvB944iiFG663Fr8eOcGF8rGayDfKYB24vPOr43J8aYq5iRPFatR+JS0pNwhmou+sR0jWODeaMIn/iodHR6vcPCe/Pybxg09HaNmMZ9PkTVkU630qzvcL0QT4xHynmHS9XmGg5TTy3O7zmZFEsYDUTXe9yJ6Bo7xnIkUs2XoZSaW3SW4JDUGhTmuA0TE3xIx1ZViQ2x62m2tiMbSRXIwZec9N62r3yS0SAYpZBWI2Owk8ZlHkwuhV1zJXyVvSuxUiZjG1ZH12nb8x+ct6fxG6mJ7AgmZ2USobSdX+Uir0jkx7DwFmBTLN7IC8FzVWVvkhRJTniXgYJfBJx2oFhfKOooUgdZWEqDFWOnz71hyJcQ3q1XyLpD6B6qwZQDPuAKzkHrSRlKuFHcx3hWZZPIndoiINWF0d3yjmzosHq5iIDSgOWwYasG3apkyLIkHYUR7Ft7FoTB3ADiALUNLs1PvN+qTAsBHjRWhJpfTdzxmhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199018)(186003)(38100700002)(83380400001)(8936002)(66476007)(4326008)(66946007)(41300700001)(2906002)(44832011)(5660300002)(7416002)(66556008)(6512007)(478600001)(53546011)(6506007)(6666004)(26005)(2616005)(316002)(110136005)(36756003)(8676002)(86362001)(31696002)(31686004)(54906003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3pucnk2cHdhaHhQYnI0MXhRWFk5N0JOd3p2U0VOaC80dThZZnd3RnVsNFdI?=
 =?utf-8?B?b3Nqc2NQZk5uczdrTS9nTmpZUDJ4bTlXSXFxSjBOWlJIQmp0SkdjaFRvcE1F?=
 =?utf-8?B?K2lyTFArbzUreGtrS1A3RWhhUVhUN1lTTWtGajV5bi9pMExuVEtFU3lmMWxY?=
 =?utf-8?B?RktyZ2JGUGxBSnlxWW1iS1RUcE56QTYwMW1YVEJlTGRZaVBtM0hWU2dRZ00w?=
 =?utf-8?B?MkhVc2g5TCs0d2VoR3IzTjdSdE1ObHVJZW12TkcvSGh4dkU4Mk1Kek1FVWxY?=
 =?utf-8?B?THdzV1JtOFRjVTV0T0N1eHN0dy9TcE02d1Jvc21uL2F0czRBMlMreENlNS96?=
 =?utf-8?B?US9wUnBsRnpvY2ZOcjI0T0VuS1Q5MTNpcmdvZUxVdjYyYWsvRXV2QnFMZEpx?=
 =?utf-8?B?UWZ3bU9TcXVoeGs5aUk3U3o1djZkWHpBaWQ4ZDlvT2dpdm9HTTVXN0lWRU1Q?=
 =?utf-8?B?M25VV0swUHpNWkNhRk5rVzlNaGxnMGFrcndCTUVvYTJrSnh4ZktNeXA0RW9h?=
 =?utf-8?B?RVlUd0NoQXRJdkZIbjAyc28rZkdsSkRqZ1JJTUdrSlMwWGFiSmNpVlA3c21T?=
 =?utf-8?B?aW1xRjB3dEttVzNjVkJONmE4OFNXL09vOHRieWVVSm1LeTFVUmhnN3FsZG5Y?=
 =?utf-8?B?UEMrWVBXNVozQWQ0c2QyZ2RRbXlxR2s2Q3BLb2pTUHcxc1ZjbkNiaUhIcVdE?=
 =?utf-8?B?WDE0dzd5eVU3Q09PbEZ5TTJqcksyQjNSNGh4RnNxcTc1NzZIK3k2Z0U0Y21y?=
 =?utf-8?B?Q0dSRE45b2dldFpuNEcvOWpUQTNFM2pydzArQ2kvVllKelhDd0wyTWNQaHFR?=
 =?utf-8?B?Y2o3MGVjc1hzUGRYRUZ5WUtnbHljZTlTL01nQy9QZ1BkMEJWYjEzZmtya01S?=
 =?utf-8?B?T3IySmVNNHFrUVBiMmlaTVR6NUFpdUYvcVNZQjBSRXEwdG1Da09LOXA2RTRu?=
 =?utf-8?B?bXppb3Q1NVovVE5RRzhsUVJva1QrbjAwVW5EVEtIOW9OU00vUDFoLzdwSVd1?=
 =?utf-8?B?U29NUEFhNStUMEN2OUZSQ0xHSFJzMUF5dWlEeDNIYXBjTDZ6L0JCZGJSWkwz?=
 =?utf-8?B?ZUpleHY2eEY2Q29CQ3Y5RWpqWWJZVlJLclhtZmcyT1EyOGptMmd0TGFkM0Iv?=
 =?utf-8?B?Q3FLa3YvTUJVRlZtbDVXMlBoYTd5QkY1WVczeXlOMzROemw4MDkxNnI5L0tz?=
 =?utf-8?B?MGhHbW5uMC94T3VNalRpb3dYbWlyckxBcWhuVVFDYVRuejdOdVI4YjB3akx2?=
 =?utf-8?B?MHZwNmI3TXJRd2xJK3hNcVNKMy9HbEVqSW9acVlleG1FaEs2K2tWdG1aa09B?=
 =?utf-8?B?b0g3UDNCOUJaTmJQb1dQcWcxVWdmVUNES0EvSUhPdjl2Q21oeXdLcWQvbjE0?=
 =?utf-8?B?KzArNjNPN1BHajN0RTZGMEJRYTZiRUFNU2JHMGJUT09JSm9XbW80bG04Q0ZH?=
 =?utf-8?B?QTlxbDhhN09yMVZRZEh2UUxMNE1RZ0VRUnozcG5Ka1lxTCs5QjFEcE1XSXR6?=
 =?utf-8?B?MksrRmN2enJQUDEyelZtSTUyZ2dLejlnbXU3dWg4YituZXRsZmt1cUE1TXZr?=
 =?utf-8?B?TlI1Wjk2SHJNYW8zU2Mza2RRQW85bEhzdWdKY29LT3l6WUUxZ1FQM0xNNkVy?=
 =?utf-8?B?WWIrak5tUkN2eFRYczFncElIRFlWUDFEdkdEeHdnQmVnK09kUktnV2I1dDdJ?=
 =?utf-8?B?Mi8yWmxEak0zUUpaTTBXeEJENFRrSzNYSG9EZTBwNlFCOTc0Y3dLRGFQRkR3?=
 =?utf-8?B?SHJHbldWQUFXN3Ayb3hYb284eGpKdVhXVUZPOCt1b2N5UGgwQUE3N200UG94?=
 =?utf-8?B?UE5mODNFaW82SFZkWFV2M2crcUI4VkdpQjlzbzhVbjNyRGdlRzhYckYxdktH?=
 =?utf-8?B?SFUxVW1VS0RJTE02Y3FGdEhjazhOYkk5MnErdFQwTDR1QTNuRy93M2NvQm5r?=
 =?utf-8?B?c003Tnp1RWpPWmlWYkhYUTZTZldNSkE2OEdJVlRvSmt1elVKU2I5WnBCc0dS?=
 =?utf-8?B?UFFWUTNySnlxOHNDRFR6enF6RG5aNlpQSDdiWFIrcEoxNDFxUUlqOVB0YmhW?=
 =?utf-8?B?eUtRRWJGVktzZVp6cUpwT2lHRHhLOFBURkJMV2N5bFh0NndHQ0ordFNjcDVq?=
 =?utf-8?Q?6qMhqzDxq+ELpx3Z8T8Nfkpq5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a7cb4b-848d-4e29-df1e-08db18efa4eb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 18:22:54.8518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y67L9ThDSU4zcme1jdYK5oUZ3bZfWYhJYwvjkbcBjs0LMToy2wBQ+8+M9rg0gxrTe17nIsd8oZJPy/lW8H60Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "Liu, Wenjing" <Wenjing.Liu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/27/23 12:12, Jani Nikula wrote:
> On Mon, 27 Feb 2023, Harry Wentland <harry.wentland@amd.com> wrote:
>> On 2/26/23 09:10, Yaroslav Bolyukin wrote:
>>> As per DisplayID v2.0 Errata E9 spec "DSC pass-through timing support"
>>> VESA vendor-specific data block may contain target DSC bits per pixel
>>> fields
>>>
>>
>> According to the errata this should only apply to VII timings. The way
>> it is currently implemented will make it apply to everything which is
>> not what we want.
>>
>> Can we add this field to drm_mode_info instead of drm_display_info and
>> set it inside drm_mode_displayid_detailed when parsing a type_7 timing?
> 
> That's actually difficult to do nicely. I think the patch at hand is
> fine, and it's fine to add the information to drm_display_info. It's a
> dependency to parsing the modes.
> 
> How the info will actually be used is a different matter, and obviously
> needs to follow the spec. As it is, *this* patch doesn't say anything
> about that. But whether it's handled in VII timings parsing or
> elsewhere, I still think this part is fine.
> 

This patch itself is okay but without further work can't be used by
drivers since they don't currently have an indication whether a mode
is based on a VII timing.

Harry

> 
> BR,
> Jani.
> 
>>
>> Harry
>>
>>
>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>> ---
>>>  drivers/gpu/drm/drm_edid.c  | 38 +++++++++++++++++++++++++------------
>>>  include/drm/drm_connector.h |  6 ++++++
>>>  include/drm/drm_displayid.h |  4 ++++
>>>  3 files changed, 36 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>> index 3d0a4da661bc..aa88ac82cbe0 100644
>>> --- a/drivers/gpu/drm/drm_edid.c
>>> +++ b/drivers/gpu/drm/drm_edid.c
>>> @@ -6338,7 +6338,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>>>  	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>>>  		return;
>>>  
>>> -	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
>>> +	if (block->num_bytes < 5) {
>>>  		drm_dbg_kms(connector->dev,
>>>  			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
>>>  			    connector->base.id, connector->name);
>>> @@ -6361,24 +6361,37 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>>>  		break;
>>>  	}
>>>  
>>> -	if (!info->mso_stream_count) {
>>> -		info->mso_pixel_overlap = 0;
>>> -		return;
>>> -	}
>>> +	info->mso_pixel_overlap = 0;
>>> +
>>> +	if (info->mso_stream_count) {
>>> +		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
>>> +
>>> +		if (info->mso_pixel_overlap > 8) {
>>> +			drm_dbg_kms(connector->dev,
>>> +				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
>>> +				    connector->base.id, connector->name,
>>> +				    info->mso_pixel_overlap);
>>> +			info->mso_pixel_overlap = 8;
>>> +		}
>>>  
>>> -	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
>>> -	if (info->mso_pixel_overlap > 8) {
>>>  		drm_dbg_kms(connector->dev,
>>> -			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
>>> +			    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>>>  			    connector->base.id, connector->name,
>>> -			    info->mso_pixel_overlap);
>>> -		info->mso_pixel_overlap = 8;
>>> +			    info->mso_stream_count, info->mso_pixel_overlap);
>>> +	}
>>> +
>>> +	if (block->num_bytes < 7) {
>>> +		/* DSC bpp is optional */
>>> +		return;
>>>  	}
>>>  
>>> +	info->dp_dsc_bpp = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) * 16
>>> +		+ FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
>>> +
>>>  	drm_dbg_kms(connector->dev,
>>> -		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>>> +		    "[CONNECTOR:%d:%s] DSC bits per pixel %u\n",
>>>  		    connector->base.id, connector->name,
>>> -		    info->mso_stream_count, info->mso_pixel_overlap);
>>> +		    info->dp_dsc_bpp);
>>>  }
>>>  
>>>  static void drm_update_mso(struct drm_connector *connector,
>>> @@ -6425,6 +6438,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
>>>  	info->mso_stream_count = 0;
>>>  	info->mso_pixel_overlap = 0;
>>>  	info->max_dsc_bpp = 0;
>>> +	info->dp_dsc_bpp = 0;
>>>  
>>>  	kfree(info->vics);
>>>  	info->vics = NULL;
>>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>>> index 7b5048516185..1d01e0146a7f 100644
>>> --- a/include/drm/drm_connector.h
>>> +++ b/include/drm/drm_connector.h
>>> @@ -719,6 +719,12 @@ struct drm_display_info {
>>>  	 */
>>>  	u32 max_dsc_bpp;
>>>  
>>> +	/**
>>> +	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
>>> +	 * DST bits per pixel in 6.4 fixed point format. 0 means undefined
>>> +	 */
>>> +	u16 dp_dsc_bpp;
>>> +
>>>  	/**
>>>  	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
>>>  	 */
>>> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
>>> index 49649eb8447e..0fc3afbd1675 100644
>>> --- a/include/drm/drm_displayid.h
>>> +++ b/include/drm/drm_displayid.h
>>> @@ -131,12 +131,16 @@ struct displayid_detailed_timing_block {
>>>  
>>>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>>>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
>>> +#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
>>> +#define DISPLAYID_VESA_DSC_BPP_FRACT	GENMASK(3, 0)
>>>  
>>>  struct displayid_vesa_vendor_specific_block {
>>>  	struct displayid_block base;
>>>  	u8 oui[3];
>>>  	u8 data_structure_type;
>>>  	u8 mso;
>>> +	u8 dsc_bpp_int;
>>> +	u8 dsc_bpp_fract;
>>>  } __packed;
>>>  
>>>  /* DisplayID iteration */
>>
> 

