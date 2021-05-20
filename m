Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CEB38A995
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 13:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78636E0A5;
	Thu, 20 May 2021 11:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1061 seconds by postgrey-1.36 at gabe;
 Thu, 20 May 2021 11:04:28 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450746E0A5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 11:04:27 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KAhtQu002695; Thu, 20 May 2021 03:46:37 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0064b401.pphosted.com with ESMTP id 38ngvn06s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 03:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzHrQeq9DPz+9oiey6KXOuAbtKA6iL5CBWHgl+oqIGFXqGh3TLHdVLZugo8YMgBnydDlNX+plCi62y++kUyuRmC6bIuPr/6bYNqCZhL6TlQLkXxMyNGPEfeKnD1Jx23w93Pwv18d6CWaHY2NGIKbY3iUbAVJc/G3r4QVNu4fqzoqGr3TJlRGmrj9Bb9E0mf374On1ikiwDr4yDlcSZwZwq12lTMjih1NSEoO28JjyRDLARZzc9SgKejqwbxS8//2UMfq+qWxfxn9in6pLqnJU6wuXcFABG44uKpyZgD0drBlufhDZdKxLwkRd72tlXVz1PL0dwpmeDwZrZ5YLJnGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/q6yN4/pFgmR+xqTWJX7Ug2CJ4cPhUpFNGFsHdM5O8=;
 b=DdjwnMHEdBo6XH34vaCGHjAtdjI3X91FPdLxk2sE/T6e0rXqDy9/2E25fXD+US7v/6vJA7kVYKtdppglzPwro6BNXoKuYrnV4eWz6KGgR1AcFJtwgT4HWKb/IXL92FQIF7yJEnbWG46rZCT43hm0A1BEjR7ftfGE72X/Yb3m9u20gCnSB2r4/OQ1DjZgIUyNZL5QJnW/4AeAKLw3cdq5w41rWf8KTAz7XYX5y6q4fQE+JfI5BQwvqsaDsOiu/OFeGCFz3noX7Q703ujIUUInOGxXWpobzBKWEbMjWNTAZ3vdslxC79VzMIEtv3j3kdH0esN8qESJezQBnrt0G0q+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/q6yN4/pFgmR+xqTWJX7Ug2CJ4cPhUpFNGFsHdM5O8=;
 b=AlEbyE20jxa+WUHQ0iKoygCHGWX4DtZ3+vPHhVVSV2hmTF3HyLd34x973CI0eVA5BbIx9zyVAZ/OBjeOFJmwh/rPAYCdtZMq97zmA0qN6cT3DgOvN4+qsMsdnlKlwcrLw51Tg6n0bqXceYOrqq5m8Nk0X4g02wC9+0+4Pu1GNzY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR1101MB2152.namprd11.prod.outlook.com (2603:10b6:910:23::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 10:46:35 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::cccf:6e19:b547:da8b]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::cccf:6e19:b547:da8b%6]) with mapi id 15.20.4129.032; Thu, 20 May 2021
 10:46:35 +0000
Subject: Re: [V2][PATCH 2/2] drm: xlnx: consolidate the functions which
 programming AUDIO_VIDEO_SELECT register
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210518095019.3855369-1-quanyang.wang@windriver.com>
 <20210518095019.3855369-3-quanyang.wang@windriver.com>
 <YKYyUof3HPEFXQYc@pendragon.ideasonboard.com>
From: "quanyang.wang" <quanyang.wang@windriver.com>
Message-ID: <d028fb6c-6669-fedb-a4a0-fa570b1bf626@windriver.com>
Date: Thu, 20 May 2021 18:45:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YKYyUof3HPEFXQYc@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR05CA0186.namprd05.prod.outlook.com
 (2603:10b6:a03:330::11) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.199] (60.247.85.82) by
 SJ0PR05CA0186.namprd05.prod.outlook.com (2603:10b6:a03:330::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend
 Transport; Thu, 20 May 2021 10:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4639350d-175e-4c32-9da7-08d91b7c895b
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2152:
X-Microsoft-Antispam-PRVS: <CY4PR1101MB215259A66633BAD6AF2CFE64F02A9@CY4PR1101MB2152.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFEnJ1EDNrFp6YqPRiEab2oy0HuseD+HfFC+pmLZwoN4BMKTWOkSBE5ibzll/SWxt490i9HmUp9puzHanCENL4BW/LxNJJf/cPz71sU4EsyrT+V2ftmnFTSgbiy3V8HtS27lz/WZWodX0t3jqvF2TCRsBQukYe0mRgLtiJxID5derCecExEyqwWz670Cx+JBH3hkOvb6f+bIDNsy5Hm1vgcd+n9rkCCv9cKDi98nBUU/01X+12STZAEnt1C0HS9fDXdzX/hYom4KFlPTKe4N3eZnXtg4Pj+Gl6mfi3oRT20Zaq4rZCOlUmjeguLaT3KvYgH6qkQaEbj2k6lIe3lvBU0NHgRtN/NMWJ1vvUeHuzCSplglDAAX9Ql48MDw9byAIjq3J12Bsh2c27xUVCWbYvsuszATm2VSWpwIHwMppk0JXgA1au3p6FYkeN/Wm8gTWPHs1zbETTW2Qam4yUyMTRu4nwDFxPh26EGqLvQ4MvIU+kd2LPLVT86GPpqpJggFL+B1o9itVCOy4XT3PEGjz01CDQQpBLx6ZyUZBobZv/MRdfosrB1POztGD81tb+aQqkpQOf+JWXYjFWue6K+xhyyfLsTilKwCJ5JMCgFxaiwunpubDTNEexpC/Fv6RhV0iiv7a2UGjoGaL06dcEkdFlHu/98kvYM+u5COvb30OwCjGKLlfENHCjkEvUbRLaTTbYmowkRYAR6eDtAwwQpCeyV+3wY4XnMX5JiVsJM/ElkCphcmB1xbZfqCw6nIE9RC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(136003)(396003)(376002)(346002)(83380400001)(2616005)(478600001)(6706004)(66476007)(6666004)(2906002)(30864003)(86362001)(31696002)(54906003)(16576012)(53546011)(26005)(6916009)(66556008)(36756003)(66946007)(186003)(316002)(956004)(52116002)(38100700002)(38350700002)(8936002)(31686004)(6486002)(8676002)(5660300002)(4326008)(16526019)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXFYUkppMFZGWGExdGFvOTZnT3FYWGNpenk1RHNhSEx2NWljWnR4b3I5Tk1o?=
 =?utf-8?B?cWNodWZOVWw1ZE9QNElqWmU0d080dWNOUkkvbkpGdHpoTGlMd0tIMUFOU2ov?=
 =?utf-8?B?LzFjZUtmMDBvUG8wb2VPWThlaVRpdEI3V3FmNGRvdG1TM2dGbWQ3REdYWkEy?=
 =?utf-8?B?MEdpTFphOXpxQkVTbG5MM1gvUGw3SXR5QjFxSHEzMU9na1R6RjdjZTdzSmRM?=
 =?utf-8?B?NlBYTzZvWm9YVFkraEFta3R0YU1wSlRIc3ZTOXh1WlE3VExFNmRBV043cXor?=
 =?utf-8?B?Q1U5UnVvSTU0MVhVejZHaE1WdHNOa1NyZS9tVStRMkNvbzdJclp5ZTZON0RX?=
 =?utf-8?B?b3ZYeXg0aWJndUQ3WlZIMWdPUHBYeXVNTHpLSEFwTlpMSnd0Q0FPUmVXbEpr?=
 =?utf-8?B?ZlBESVlsZVlpYmZ5MW5hcHJIemRqSGc4RDFvZzc3SkQyUDE5R1VyelFmQ0lu?=
 =?utf-8?B?ZFN5TjNoRmlHNmVVUURab0RHTDltL3dpeFAwNWo2UlVBR2hhZW1vVnZpZ3A3?=
 =?utf-8?B?dXY3QzhQUmIvQUFOblZnSFZncGpQWE1QUHlCSDRuQzhreDhXQU5rRXhDZG0x?=
 =?utf-8?B?bzd5S1orNVVVM0NMU3dqb3BCdkkwbGpUbW1PaHo5QUxWZWQwbDkyT2owaUFr?=
 =?utf-8?B?T29KRGtZdHZ4bDNURG5WM2ZGdzVudVJRNDhVWTJUOUU1bGxZNHY5MXEzcGw2?=
 =?utf-8?B?cVVsdGtxYWxwMHdheFlBeHlmSmc5OTVQZmk2TDRiVmJWa0pYRzR3WE5HamMr?=
 =?utf-8?B?eUhIWHlVQTNEUnlaNW5zbnlBVlJwQ09veDl5RVhQbHRsQTRVbU1rQmdwMzNw?=
 =?utf-8?B?QzhmNzlFR2FxV0lxWjFLNDhDL2VEbTRsVWtUZTlmMGVBV2JSQm9HaFhzNk80?=
 =?utf-8?B?WFVaMmFneXVORkdPT3JsLzIwVTVLYTVseWpYUXh0UWs0VzNSRGVBM0RzalFG?=
 =?utf-8?B?VlkxbmprTGZGaHZBeUFhVUU0ZXBSZ0ZKRmlhMUl3YlBncVQ0Qm1rcExsT1VH?=
 =?utf-8?B?N1VuYUdwcVZPVWV6aU5HSXMxcEMvK2pYL2NtMlpQZGdMbjNhclBZNzRxaU9W?=
 =?utf-8?B?Vnl4MGZ3ZlVDanhWMCtRU21CMFJHMnJMeEpsZk93TTBpSnZ5SW0wVUJGM3Uv?=
 =?utf-8?B?ZEFuRC9OU2ZkaGFVeVpCTzFGS1pJa242c2tieFJXanI3WWRFTC9iVEFxem05?=
 =?utf-8?B?ekJUUGNlM1ZPUUs1SVZSZzRSSFIwVjdQaWhYWCtYT1RjTTkraVNYdnJWb2lS?=
 =?utf-8?B?WVprVXpPa0EvRzEyL1c3MmthdkRzY0JDdVV0SVRFMm1NQU9NK09MbExuWnlQ?=
 =?utf-8?B?TUNUVFN2ZURQandTSzlaU0tVRWcyVzNOc2J4b1FhREhaYmo4bTNOOS9DVzY0?=
 =?utf-8?B?NUZhc1JEZlFOcjhGd2cxeS96NzU4aUh3cFZtLys2V2xMMCt5eDJ5NE9BbHR1?=
 =?utf-8?B?ODNra2VmYWxaTk45L2MxTFBFYTZRd3E4TWg1cmQ1eGtjRExscVh0RXF0dno3?=
 =?utf-8?B?azM3UnowYXQ5enJZbm5MR3ZaZ1BvUVNWNUtvZmYwY1JkUEtBYU82am9sLzE2?=
 =?utf-8?B?cmVzV01WSXU1b2RoS1dXeE5wVmFmemU2NW9CRlRvRnJaNndIbUI3d3k0OXZW?=
 =?utf-8?B?cUQ1TDUzQm9iV3k3aWdnVlhvL0tER3pKOHNlTllEeVNkKzFJZFhnRDBxYms3?=
 =?utf-8?B?UFFML3JXVlhPclJoVFR4TlcxeUYzeVV3Vk03SUlkT1cwaW93S3VGOXM4SGQ2?=
 =?utf-8?Q?MsUufB3T6r/DMMLsLn7mmL6pGdmwcFPoKSvbNOf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4639350d-175e-4c32-9da7-08d91b7c895b
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 10:46:34.9400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: he4glwHtj4zHK10wxqVBb63zudzsLftBySL6mt57HxWkhGNDqxa0SWnMjg8AzAk/FjUG1CfufBiLS7GvUudRJeM2ah9Qm3I3Rx6kHFhlhZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2152
X-Proofpoint-ORIG-GUID: 4Lgvw8xKpM0y7glVCqyImBM9EVRnJ7XI
X-Proofpoint-GUID: 4Lgvw8xKpM0y7glVCqyImBM9EVRnJ7XI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_03:2021-05-20,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200081
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,
Thank you for your review.

On 5/20/21 5:56 PM, Laurent Pinchart wrote:
> Hi Quanyang,
> 
> Thank you for the patch.
> 
> On Tue, May 18, 2021 at 05:50:19PM +0800, quanyang.wang@windriver.com wrote:
>> From: Quanyang Wang <quanyang.wang@windriver.com>
>>
>> For now, the functions zynqmp_disp_avbuf_enable/disable_audio and
>> zynqmp_disp_avbuf_enable/disable_video are all programming the register
>> AV_BUF_OUTPUT_AUDIO_VIDEO_SELECT to select the output for audio or video.
>> And in the future, many drm properties (like video_tpg, audio_tpg,
>> audio_pl, etc) also need to access it. So let's introduce some variables
>> of enum type and consolidate the code to unify handling this.
>>
>> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_disp.c      | 168 ++++++++++++++----------
>>   drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |  23 +---
>>   2 files changed, 106 insertions(+), 85 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index eefb278e24c6..3672d2f5665b 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -102,12 +102,39 @@ enum zynqmp_disp_layer_id {
>>   
>>   /**
>>    * enum zynqmp_disp_layer_mode - Layer mode
>> - * @ZYNQMP_DISP_LAYER_NONLIVE: non-live (memory) mode
>> + * @ZYNQMP_DISP_LAYER_MEM: memory mode
>>    * @ZYNQMP_DISP_LAYER_LIVE: live (stream) mode
>> + * @ZYNQMP_DISP_LAYER_TPG: tpg mode (only for video layer)
>> + * @ZYNQMP_DISP_LAYER_DISABLE: disable mode
> 
> "Disable" isn't really a mode :-S
Yes, as per Register Reference for AV_BUF_OUTPUT_AUDIO_VIDEO_SELECT
VID_STREAM2_SEL	3:2	rw	0x2	STREAM2 Enable
				00: Disable graphics from memory/live
				01: Enable graphics from memory
				10: Enable graphics from live
				11: None
VID_STREAM1_SEL	1:0	rw	STREAM1 Select:
				0: Live Video
				1: Video from memory
				2: Pattern Generator
				3: None (black frames)

The NONE mode maybe better.
> 
>>    */
>>   enum zynqmp_disp_layer_mode {
>> -	ZYNQMP_DISP_LAYER_NONLIVE,
>> -	ZYNQMP_DISP_LAYER_LIVE
>> +	ZYNQMP_DISP_LAYER_MEM,
>> +	ZYNQMP_DISP_LAYER_LIVE,
>> +	ZYNQMP_DISP_LAYER_TPG,
>> +	ZYNQMP_DISP_LAYER_DISABLE
>> +};
>> +
>> +enum avbuf_vid_mode {
>> +	VID_MODE_LIVE,
>> +	VID_MODE_MEM,
>> +	VID_MODE_TPG,
>> +	VID_MODE_NONE
>> +};
> 
> I don't like this much. The enum here doesn't clearly show that the
> values correspond to hardware register values. I'd rather address this
> in drivers/gpu/drm/xlnx/zynqmp_disp_regs.h, see below for a proposal.
The value of LIVE/MEM/TPG is different from two layer.
In Video layer, 0 is live, 1 is mem, 2 is tpg and 3 is blackscreen.
But for gfx mode, 0 is disable, 1 is mem, 2 is live and 3 is blackscreen.
If we define ZYNQMP_DISP_AV_BUF_OUTPUT_LIVE is 0, it only works for 
video layer but not graphic layer. So I define one enumeration type to 
abstract the both layer mode and also define two enumeration for each 
layer in order to write enumeration vairables directly to register.
> 
>> +
>> +enum avbuf_gfx_mode {
>> +	GFX_MODE_DISABLE,
>> +	GFX_MODE_MEM,
>> +	GFX_MODE_LIVE,
>> +	GFX_MODE_NONE
>> +};
>> +
>> +enum avbuf_aud_mode {
>> +	AUD1_MODE_LIVE,
>> +	AUD1_MODE_MEM,
>> +	AUD1_MODE_TPG,
>> +	AUD1_MODE_DISABLE,
>> +	AUD2_MODE_DISABLE,
>> +	AUD2_MODE_ENABLE
> 
> Combining AUD1 and AUD2 in the same enum, with the
> " - AUD2_MODE_DISABLE" below, is really a hack. Let's keep
> hardware-related valeus in drivers/gpu/drm/xlnx/zynqmp_disp_regs.h.
OK, I will revert this part.
> 
> Overall I'm not really fond of this rework I'm afraid, I think the
> result is way less readable. Given that this isn't required yet as
> support for the TPG or the PL input isn't part of this series, unless it
> can be rewritten in a better way already, I'd prefer dropping this patch
> for now and including it in a series that enables TPG or PL input.
Yes, I agree. It's not a good time to add this patch now. I will rewrite 
it in a better way. Please drop this patch.

> 
> I also think it could be beneficial to split the patch in two, it seems
> to do a bit too much.
Would you please give some suggestions?
> 
>>   };
>>   
>>   /**
>> @@ -542,92 +569,102 @@ static void zynqmp_disp_avbuf_disable_channels(struct zynqmp_disp_avbuf *avbuf)
>>   }
>>   
>>   /**
>> - * zynqmp_disp_avbuf_enable_audio - Enable audio
>> + * zynqmp_disp_avbuf_output_select - Select the buffer manager outputs
>>    * @avbuf: Audio/video buffer manager
>> + * @layer: The layer
>> + * @mode: The mode for this layer
>>    *
>> - * Enable all audio buffers with a non-live (memory) source.
>> + * Select the buffer manager outputs for @layer.
>>    */
>> -static void zynqmp_disp_avbuf_enable_audio(struct zynqmp_disp_avbuf *avbuf)
>> +static void zynqmp_disp_avbuf_output_select(struct zynqmp_disp_avbuf *avbuf,
>> +					   struct zynqmp_disp_layer *layer,
>> +					   u32 mode)
>>   {
>> -	u32 val;
>> +	u32 reg;
>>   
>> -	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -	val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
>> -	val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM;
>> -	val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
>> -	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
>> +	reg = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> +
>> +	/* Select audio mode when the layer is NULL */
> 
> This is also a hack, I don't really like it. I'd much prefer keeping
> audio handling in separate functions.
OK, I will keep the audio functions.
Thanks,
Quanyang
> 
>> +	if (layer == NULL) {
>> +		if (mode >= AUD2_MODE_DISABLE) {
>> +			reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK;
>> +			reg |= FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK,
>> +					(mode - AUD2_MODE_DISABLE));
>> +		} else {
>> +			reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
>> +			reg |= FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK, mode);
>> +		}
>> +	} else if (is_layer_vid(layer)) {
>> +		reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>> +		reg |= FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK, mode);
>> +	} else {
>> +		reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
>> +		reg |= FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK, mode);
>> +	}
>> +
>> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, reg);
>>   }
>>   
>>   /**
>> - * zynqmp_disp_avbuf_disable_audio - Disable audio
>> + * zynqmp_disp_avbuf_enable_audio - Enable audio
>>    * @avbuf: Audio/video buffer manager
>>    *
>> - * Disable all audio buffers.
>> + * Enable all audio buffers.
>>    */
>> -static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
>> +static void zynqmp_disp_avbuf_enable_audio(struct zynqmp_disp_avbuf *avbuf)
>>   {
>> -	u32 val;
>> -
>> -	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -	val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
>> -	val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE;
>> -	val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
>> -	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
>> +	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD1_MODE_MEM);
>> +	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD2_MODE_ENABLE);
>>   }
>>   
>>   /**
>> - * zynqmp_disp_avbuf_enable_video - Enable a video layer
>> + * zynqmp_disp_avbuf_disable_audio - Disable audio
>>    * @avbuf: Audio/video buffer manager
>> - * @layer: The layer
>> - * @mode: Operating mode of layer
>>    *
>> - * Enable the video/graphics buffer for @layer.
>> + * Disable all audio buffers.
>>    */
>> -static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
>> -					   struct zynqmp_disp_layer *layer,
>> -					   enum zynqmp_disp_layer_mode mode)
>> +static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
>>   {
>> -	u32 val;
>> -
>> -	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -	if (is_layer_vid(layer)) {
>> -		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>> -		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
>> -			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
>> -		else
>> -			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE;
>> -	} else {
>> -		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
>> -		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
>> -		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
>> -			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
>> -		else
>> -			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE;
>> -	}
>> -	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
>> +	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD1_MODE_DISABLE);
>> +	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD2_MODE_DISABLE);
>>   }
>>   
>>   /**
>> - * zynqmp_disp_avbuf_disable_video - Disable a video layer
>> - * @avbuf: Audio/video buffer manager
>> + * zynqmp_disp_avbuf_set_layer_output - Set layer output
>>    * @layer: The layer
>> + * @mode: The layer mode
>>    *
>> - * Disable the video/graphics buffer for @layer.
>> + * Set output for @layer
>>    */
>> -static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf *avbuf,
>> -					    struct zynqmp_disp_layer *layer)
>> +static void zynqmp_disp_avbuf_set_layer_output(struct zynqmp_disp_layer *layer,
>> +					   enum zynqmp_disp_layer_mode mode)
>>   {
>> -	u32 val;
>> -
>> -	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -	if (is_layer_vid(layer)) {
>> -		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>> -		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
>> -	} else {
>> -		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
>> -		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE;
>> +	struct zynqmp_disp *disp = layer->disp;
>> +	int val;
>> +
>> +	switch (mode) {
>> +	case ZYNQMP_DISP_LAYER_LIVE:
>> +		val = is_layer_vid(layer) ? VID_MODE_LIVE : GFX_MODE_LIVE;
>> +		break;
>> +	case ZYNQMP_DISP_LAYER_MEM:
>> +		val = is_layer_vid(layer) ? VID_MODE_MEM : GFX_MODE_MEM;
>> +		break;
>> +	case ZYNQMP_DISP_LAYER_TPG:
>> +		if (!is_layer_vid(layer)) {
>> +			dev_err(disp->dev, "gfx layer has no tpg mode\n");
>> +			return;
>> +		}
>> +		val = VID_MODE_TPG;
>> +		break;
>> +	case ZYNQMP_DISP_LAYER_DISABLE:
>> +		val = is_layer_vid(layer) ? VID_MODE_NONE : GFX_MODE_DISABLE;
>> +		break;
>> +	default:
>> +		dev_err(disp->dev, "invalid layer mode\n");
>> +		return;
>>   	}
>> -	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
>> +
>> +	zynqmp_disp_avbuf_output_select(&disp->avbuf, layer, val);
>>   }
>>   
>>   /**
>> @@ -1030,11 +1067,10 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
>>    */
>>   static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
>>   {
>> -	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
>> -				       ZYNQMP_DISP_LAYER_NONLIVE);
>> +	zynqmp_disp_avbuf_set_layer_output(layer, ZYNQMP_DISP_LAYER_MEM);
>>   	zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
>>   
>> -	layer->mode = ZYNQMP_DISP_LAYER_NONLIVE;
>> +	layer->mode = ZYNQMP_DISP_LAYER_MEM;
>>   }
>>   
>>   /**
>> @@ -1051,7 +1087,7 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
>>   	for (i = 0; i < layer->drm_fmt->num_planes; i++)
>>   		dmaengine_terminate_sync(layer->dmas[i].chan);
>>   
>> -	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
>> +	zynqmp_disp_avbuf_set_layer_output(layer, ZYNQMP_DISP_LAYER_DISABLE);
>>   	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
>> index f92a006d5070..4316e324102d 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
>> @@ -118,25 +118,10 @@
>>   #define ZYNQMP_DISP_AV_BUF_STC_SNAPSHOT0		0x60
>>   #define ZYNQMP_DISP_AV_BUF_STC_SNAPSHOT1		0x64
>>   #define ZYNQMP_DISP_AV_BUF_OUTPUT			0x70
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_SHIFT		0
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK		(0x3 << 0)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE		(0 << 0)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM		(1 << 0)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_PATTERN		(2 << 0)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE		(3 << 0)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_SHIFT		2
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK		(0x3 << 2)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE		(0 << 2)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM		(1 << 2)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE		(2 << 2)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_NONE		(3 << 2)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_SHIFT		4
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK		(0x3 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PL		(0 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM		(1 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PATTERN		(2 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE		(3 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN		BIT(6)
>> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK		GENMASK(1, 0)
>> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK		GENMASK(3, 2)
>> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK		GENMASK(5, 4)
>> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK		BIT(6)
>>   #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT0		0x74
>>   #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT1		0x78
>>   #define ZYNQMP_DISP_AV_BUF_PATTERN_GEN_SELECT		0x100
> 
> Following my comment above, let's write this
> 
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_LIVE			0
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_MEM			1
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_PATTERN		2
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_NONE			3
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1(v)		((v) << 0)
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK		GENMASK(1, 0)
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2(v)		((v) << 2)
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK		GENMASK(3, 2)
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID3(v)		((v) << 4)
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID3_MASK		GENMASK(5, 4)
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID4(v)		((v) << 6)
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID4_MASK		GENMASK(7, 6)
> 
> Or possibly better,
> 
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_LIVE			0
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_MEM			1
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_PATTERN		2
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_NONE			3
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID(n, v)		((v) << ((n) * 2))
> #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID_MASK(n)		GENMASK((n)+1, (n))
> 
