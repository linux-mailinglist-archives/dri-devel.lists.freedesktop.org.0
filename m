Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3803C6045
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 18:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870DA89CCE;
	Mon, 12 Jul 2021 16:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD78189CCE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 16:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ+86Z/uet6rdET5FdPiVnF58WhlNaSejfZKnzrE9nt9H8Y5mg4P11VkgHHTfbhwnHBS2lKqjiZJl88LvpDYz28XZbjsTWb1G/YLm3KPh5W3zUMpjrB1VzdgjszIysDLoYo5CukBG+YfNUsdsZz33M1GKzA/ogBeI7TqWcQz8zQitCgF4uv29H+IjhJ3z+inBFeJKc1YhZjipaswerlP1Sqoflx4iIzz0TLa0WpeZ+alU2ALjpSf+Z4zmy0YY7j8X6daq0D6pJwa1N92t3JIla+eUPE1BgrjYr+SL/On+C+ZdyUvM0qp/MBeWJxDEVqu6eVLhDPvMb1pEP0Z48cmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdrHRdq/FygLq97li8mcpawILl3g2d+R0Kee7Oy+eUs=;
 b=hEotO5gx04CNCQJlAURw8O4TWIJeZvxVPqbR1vn5FGBFYdkEKEJjjSlUHEkW8W1nOXHgIjnON34QQdEsshjybNbQk5x7OMonu59+9P+cZ7DK08pGXchErrdHMtcMf496ecm2hpI3LKLbgbuuYQur92ANNIM8sTXs4roSq5yNiGhe4jpNr8dX1J20hXgq3CQRLnyVCpmuibTTiCpMAolJmgaCd0Ey+Nr0xSex+IDfu/x2kEopIzb2drzaLlUXzz4OiN8NGrEgK9qSzuAlaxBVzGISrduwR6xqiSGQ6D8xnx07oBFtWugCXx241NIIoR0EOCQB78RbxJVDyaOZy4Bqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdrHRdq/FygLq97li8mcpawILl3g2d+R0Kee7Oy+eUs=;
 b=C0zElAAOFX53FZyf1KdMG6XF/iNpgcVWeYamRBYew52+3T2Gtdhxq9hUSMUaZq7+IP7y3aWm104IbgxYUIVu7wmZE5Myp5cXNZm4sJQtyhEh+NNSdNiDZ1bYUXJ5tqqTYtb36d5vmUBreUrpYacKmfFTp0VVgZm/DmD/HyPDzKs=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Mon, 12 Jul
 2021 16:16:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19%4]) with mapi id 15.20.4308.027; Mon, 12 Jul 2021
 16:16:04 +0000
Subject: Re: [PATCH 1/2] drm: add crtc background color property
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
 <20210709110459.79ca406a@eldfell>
 <3c8331cf-fded-b6e6-3e25-666634f4b87a@foss.st.com>
 <20210712110310.540df27d@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <f8e7db99-a4e4-c4d7-5d6a-67950184701c@amd.com>
Date: Mon, 12 Jul 2021 12:15:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712110310.540df27d@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 16:16:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8883aa4c-4baa-492a-86d0-08d945505921
X-MS-TrafficTypeDiagnostic: CO6PR12MB5473:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5473E5CB6E61BE6E4E57FCE88C159@CO6PR12MB5473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gcb+/blPOeCnOjca/cw7mPIGk4S0dW4GSk5CJzczyYUT7L6A0ZBGngJX0nYUCTomLkWlSY2NK3Gp+TC+FVIQ9VzaI+eafDlchbDNb+6NUucs+7C+s9CjfDA1uHbgJN4LOOGSr9v2prkCVDKHZ3OTsb1JPW7fXPXSjpuGosvMC/ODYiI6pR2ABTOLGjVaNy+XdBgVELaw2OCfMu2eqGeCR5x4A7AVxVQWMGNt6xkXhCX2qWCbjAAnjlldTWpxA8I2fL4ByWRKrb4QVTTHklZ3wJu189BKsD69ycbAldK1wwn0BNUTsZRyYpecGIFt2QeNVjCBAtfKhjWRPtUEEJRwD6OHG/S7bbpDc6l+DeaMiW8r9QK3AxIvazaaJohw3aHwpqvh/Lnh9UOBEzdQ1+Cf0QnmFjWk5veiTNCmlS3Ic0RYOAfpwZU8ao5mutEsupEhu03B1LCcAU9UPwkPaLOsvwM2k2GoLziwPzu0ZMuWVeBNNkB1GUAV0is3gm7HnHZIqar/BCRhkaDCIt8oIBZf/cQdkWa8Bve+svJvVvc2q5d3w9jsyINPpGTd51sW3qXyugxgw/nHD8iW7BwV5devxmo2drkncAciDOcSYT95zQPSf5rDLUuZvLA4tQnCYRa2mBa/89ecYTkiVE5o8jx195rtCTUPCrWsZu6xP8T2mEoOjxxAx71Mn4J9UsNFmtzco4CHbtPa2ufn0Zcn2ws1BcJWd4eIjH1K71DFhArkT6IMH/KnFCMBITiI8kii5CYd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(26005)(83380400001)(66946007)(7416002)(66476007)(6486002)(66556008)(30864003)(4326008)(86362001)(53546011)(2906002)(44832011)(31696002)(186003)(2616005)(5660300002)(956004)(8676002)(478600001)(110136005)(36756003)(31686004)(54906003)(8936002)(16576012)(38100700002)(316002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?iX5PsmxkPfS/izbjm5BwRi8iqJOaC4XrTyq0x88bhWBMsRwLJF3cqgK0?=
 =?Windows-1252?Q?FN6YaCaFjA6HB9vuEwoUrWiW1uRZIlP+6KID3g043kEJlbsUYKsenfKB?=
 =?Windows-1252?Q?asYa0Nw3RUqK2DRL+b8b/x8+V4P0tFjmULimdKrPH0T/NzPerik+Ttnk?=
 =?Windows-1252?Q?UNx7XEGHiSSgu6CbDh/9r9S2VrLoofoav1ptnf1LTcECe5Xyil4qR6dx?=
 =?Windows-1252?Q?e1JvN4Xvv67pU+OH3MTDHuod2zNwM2mmtlYth6e3G9szaeSS2I3HlN1N?=
 =?Windows-1252?Q?TCmKY2uWvJiv5Dx2GF/9Z1PK+9Js7YN9alyuGoUFR6TTUUyuZ2EaYY27?=
 =?Windows-1252?Q?p4NrcHeV/JuqSP1GmgfBhTj3mNY38d7StuvpIfDrzUSXnW/IMj9yRFc3?=
 =?Windows-1252?Q?ME42p5H3mPaTXRRCgJxNrL3zvIzW96gHOOrGlA9Jo/T7ZPSjn6s3DR1y?=
 =?Windows-1252?Q?n7i8K8IkZhKBxD4Y5Rn9AqcAgeXlL9YEwBSHn8tYx3sUKIWkaYgTbte1?=
 =?Windows-1252?Q?heTSi234Ux/Oq4Q4jgzr1oEtLv2c9ms6JeFZKuTdoUG1dC5800y6Swcs?=
 =?Windows-1252?Q?esPjf1dckoq/kh9IIA3RQO16eOq8K1jqwtCnUVffkpt47GFjkRtNnN+e?=
 =?Windows-1252?Q?iPgAPK/pMvrL+2LBaqffP5FMQp79vJpc+t3GX265uCfFV+q+EVsNcn5Z?=
 =?Windows-1252?Q?krfTf6my8wcJtOFJzUI2TjlNFkqKhHrA4WyCa7RIv56CecjlThN8GCCl?=
 =?Windows-1252?Q?fg5hoXGfspwm1cIOop0Of4/r/8m2bix9Bl+qe4HTgIkGo3vPuBISMM80?=
 =?Windows-1252?Q?M4ZBImssHuY4kwQhPiZd4uSLDjNn+eixxMI4Y4iUuijfIivXEZHDQ4e9?=
 =?Windows-1252?Q?8YTnnvSr2be1Ykur6oEK7YgMW1cG8wMcK61WXxHGrj7y7w8OUIaHCwMc?=
 =?Windows-1252?Q?itRjo8KeLSIYMC7TpyNzfmgPyzxyJ6pIMNdeOpBe2JO4NRalnYPeBiqv?=
 =?Windows-1252?Q?J93UuT/mlz8sgkZ32JOtyWwiQ02Q0Dl3Ptsd3t5BeMUpCaJJufID31Tf?=
 =?Windows-1252?Q?6SUkEB/q9JBWUqhuewQn4qr0He/OBEZsMIapJfSX45xsFWy/kQ0EibLJ?=
 =?Windows-1252?Q?E7nVIcyxp/1dsCYzHOIISrqsXeDeETVAdT9BSStA2pUfPhokPrCpsXYG?=
 =?Windows-1252?Q?ERORlZxr1vc3E0yC0Zvl5ajKUOaGWfiD9b/IfV5cIzdTDD4aZcGeAqXd?=
 =?Windows-1252?Q?qKyzkW9TZmR0a8i93BIxvyOZvIY7fDxJrWC1DfjD3ZNBnOom4ZBkHLFf?=
 =?Windows-1252?Q?vqRcUbOmWLdWnE3qAsbEGNhEyo8/5yUEZ3RSnJQSa97tumsGw0BMROW+?=
 =?Windows-1252?Q?8c4ist23c0XE2KQJmHbtiRTDFuX1iUFB/H8Lt70NCwXrBTVpOcBRfLHX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8883aa4c-4baa-492a-86d0-08d945505921
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 16:16:04.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zECB5khLxO7hQup7z4n2j3WVCJiqGG49oELxSlfPFJnQ+bj1D02vMEWhMWK2mxC4EOJI1R+vDYFc1+M9gq85EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-07-12 4:03 a.m., Pekka Paalanen wrote:
> On Fri, 9 Jul 2021 18:23:26 +0200
> Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com> wrote:
> 
>> On 7/9/21 10:04 AM, Pekka Paalanen wrote:
>>> On Wed, 7 Jul 2021 08:48:47 +0000
>>> Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:
>>>  
>>>> Some display controllers can be programmed to present non-black colors
>>>> for pixels not covered by any plane (or pixels covered by the
>>>> transparent regions of higher planes).  Compositors that want a UI with
>>>> a solid color background can potentially save memory bandwidth by
>>>> setting the CRTC background property and using smaller planes to display
>>>> the rest of the content.
>>>>
>>>> To avoid confusion between different ways of encoding RGB data, we
>>>> define a standard 64-bit format that should be used for this property's
>>>> value.  Helper functions and macros are provided to generate and dissect
>>>> values in this standard format with varying component precision values.
>>>>
>>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
>>>>   drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++++++--
>>>>   drivers/gpu/drm/drm_mode_config.c         |  6 ++++
>>>>   include/drm/drm_blend.h                   |  1 +
>>>>   include/drm/drm_crtc.h                    | 12 ++++++++
>>>>   include/drm/drm_mode_config.h             |  5 ++++
>>>>   include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++++
>>>>   8 files changed, 89 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> index ddcf5c2c8e6a..1b95a4ecdb2b 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> @@ -72,6 +72,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
>>>>   				     struct drm_crtc *crtc)
>>>>   {
>>>>   	crtc_state->crtc = crtc;
>>>> +	crtc_state->bgcolor = drm_argb(16, 0xffff, 0, 0, 0);
>>>>   }
>>>>   EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
>>>>   
>>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> index 438e9585b225..fea68f8f17f8 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> @@ -483,6 +483,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>>>>   		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>>>>   	} else if (property == crtc->scaling_filter_property) {
>>>>   		state->scaling_filter = val;
>>>> +	} else if (property == config->bgcolor_property) {
>>>> +		state->bgcolor = val;
>>>>   	} else if (crtc->funcs->atomic_set_property) {
>>>>   		return crtc->funcs->atomic_set_property(crtc, state, property, val);
>>>>   	} else {
>>>> @@ -520,6 +522,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>>>>   		*val = 0;
>>>>   	else if (property == crtc->scaling_filter_property)
>>>>   		*val = state->scaling_filter;
>>>> +	else if (property == config->bgcolor_property)
>>>> +		*val = state->bgcolor;
>>>>   	else if (crtc->funcs->atomic_get_property)
>>>>   		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>>>>   	else
>>>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>>>> index ec37cbfabb50..6692d6a6db22 100644
>>>> --- a/drivers/gpu/drm/drm_blend.c
>>>> +++ b/drivers/gpu/drm/drm_blend.c
>>>> @@ -186,8 +186,7 @@
>>>>    *		 assumed to be 1.0
>>>>    *
>>>>    * Note that all the property extensions described here apply either to the
>>>> - * plane or the CRTC (e.g. for the background color, which currently is not
>>>> - * exposed and assumed to be black).
>>>> + * plane or the CRTC.
>>>>    *
>>>>    * SCALING_FILTER:
>>>>    *     Indicates scaling filter to be used for plane scaler
>>>> @@ -201,6 +200,21 @@
>>>>    *
>>>>    * Drivers can set up this property for a plane by calling
>>>>    * drm_plane_create_scaling_filter_property
>>>> + *  
>>> Hi,  
>>
>>
>> Hi Pekka,
>>
>>
>> Many thanks for your feedback, your comments are taken into account for 
>> a v2.
>>
>>
>>>
>>> I assume the below block is the UAPI documentation of this new property
>>> and that it would appear with the other UAPI docs.
>>>  
>>>> + * BACKGROUND_COLOR:
>>>> + *	Defines the ARGB color of a full-screen layer that exists below all
>>>> + *	planes.  This color will be used for pixels not covered by any plane
>>>> + *	and may also be blended with plane contents as allowed by a plane's
>>>> + *	alpha values.  The background color defaults to black, and is assumed
>>>> + *	to be black for drivers that do not expose this property.  
>>> All good up to here.
>>>  
>>>>   Although
>>>> + *	background color isn't a plane, it is assumed that the color provided
>>>> + *	here undergoes the same pipe-level degamma/CSC/gamma transformations
>>>> + *	that planes undergo.  
>>> This sounds to me like it refers to the per-plane degamma/csc/gamma
>>> which are new properties in development. I believe you do not mean
>>> that, but you mean the CRTC degamma/csc/gamma and everything else which
>>> apply *after* the blending of planes. So the wording here would need
>>> clarification.  
>>
>>
>> Yes, I was not sure about this, but it is effectively the general CRTC 
>> color correction which is applicable to the background color.
>>
>>>  
>>>>   Note that the color value provided here includes
>>>> + *	an alpha channel...non-opaque background color values are allowed,
>>>> + *	but are generally only honored in special cases (e.g., when a memory
>>>> + *	writeback connector is in use).  
>>> This could be read as: if you use a non-opaque color value, it will
>>> usually be completely ignored (and the background will be e.g. black
>>> instead). Is that your intention?
>>>
>>> I think a more useful definition would be that the alpha is used in
>>> blending as always, but because we do not yet have physically
>>> transparent monitors, the final alpha value may not reach the video
>>> sink or the video sink may ignore it.  
>>
>> In our case, the hardware does not support alpha channel (as you can see 
>> the DRM_ARGB_TO_LTDC_RGB24 macro in the second patch).
>>
>> For chip vendors who does support this feature, the video sink would get 
>> this transparency parameter. In the case where it is not, alpha channel 
>> would be ignored.
>>
>>
>>>> + *
>>>> + *	This property is setup with drm_crtc_add_bgcolor_property().  
>>> You forgot to document the value format of this property. The ARGB color
>>> format needs to be defined at least to the same detail as all pixel
>>> formats in drm_fourcc.h are. If there is a suitable DRM_FORMAT_*
>>> definition already, simply saying the color is in that format would be
>>> enough.  
>>
>>
>> Will do ! :)
>>
>> I was thinking about the FourCC AR4H format. Have you something else in 
>> mind ?
> 
> Hi,
> 
> if you mean DRM_FORMAT_ARGB16161616F then that is not what you are
> using right now. That is a floating-point format using 16-bit floats
> (half float). It has only 10 bits precision IIRC.
> 
> As C compilers do not(?) have built-in support for halfs, using this
> format would be inconvenient for userspace (and the kernel?). Since
> it's just for one pixel value, I think using a format that is
> convenient to craft would be good.
> 
> 
>>> Another thing to document is whether this color value is alpha
>>> pre-multiplied or not. Planes can have the property "pixel blend mode",
>>> but because the background color is not on a plane, that property
>>> cannot apply here.
>>>
>>> The difference it makes is that if background color is both non-opaque
>>> and pre-multiplied, then the question arises what pixel values will
>>> actually be transmitted to video sink for the background. Will the
>>> alpha pre-multiplication be undone?
>>>
>>> Btw. note that "pixel blend mode" property does not document the use of
>>> background alpha at all. So if the background color can have non-opaque
>>> alpha, then you need to document the behavior in "pixel blend mode". It
>>> also does not document what alpha value will result from blending, for
>>> blending the next plane.  
>>
>> Those are questions that did not crossed my mind at all.
>>
>> What would you suggest ? Instinctively I would say that in the case 
>> where there is a non-opaque background color,
>>
>> alpha pre-multiplication would not be taken into account, although it is 
>> maybe not the best solution.
>>
>> As I am not quite sure, I will lookup for this.
> 
> Right now, I would suggest to just dodge the whole question: define the
> background color to be opaque. Either drop the alpha channel, or
> specify that alpha must be 1.0 for now (fail ioctl if not).
> 
> Let the people who actually need alpha in the background color figure
> out all the details. They would know what they want, while we don't. We
> also can't come up with a proper userspace for non-opaque alpha to
> prove that the design works.
> 
> If you specify that alpha channel exists but must be 1.0, then someone
> else could later add another property that defines how the alpha would
> be used if it was less than 1.0. The existence of that other property
> would then tell userspace that non-1.0 alpha is supported and also
> define what it does. Userspace that does not understand that will just
> keep using alpha 1.0, meaning it doesn't matter what value the other
> new property has. So this seems quite future-proof to me.
> 
>>> The question about full vs. limited range seems unnecessary to me, as
>>> the background color will be used as-is in the blending stage, so
>>> userspace can just program the correct value that fits the pipeline it
>>> is setting up.
>>>
>>> One more question is, as HDR exists, could we need background colors
>>> with component values greater than 1.0?  
>>
>> AR4H color format should cover that case, isn't it ?
> 
> Yes, but with the inconvenience I mentioned.
> 
> This is a genuine question though, would anyone actually need
> background color values > 1.0. I don't know of any case yet where it
> would be required. It would imply that plane blending happens in a
> color space where >1.0 values are meaningful. I'm not even sure if any
> hardware supporting that exists.
> 
> Maybe it would be best to assume that only [0.0, 1.0] pixel value range
> is useful, and mention in the commit message that if someone really
> needs values outside of that, they should create another background
> color property. Then, you can pick a simple unsigned integer pixel
> format, too. (I didn't see any 16 bit-per-channel formats like that in
> drm_fourcc.h though.)
> 

I don't think we should artificially limit this to [0.0, 1.0]. As you
mentioned above when talking about full vs limited, the userspace
understands what's the correct value that fits the pipeline. If that
pipeline is FP16 with > 1.0 values then it would make sense that the
background color can be > 1.0.

Harry

> 
> Thanks,
> pq
> 

