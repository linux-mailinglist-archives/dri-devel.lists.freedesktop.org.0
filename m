Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B219B7FF451
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1D610E72C;
	Thu, 30 Nov 2023 16:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2133.outbound.protection.outlook.com [40.107.13.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2758810E72C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSrTElQoz4YNZ5S7/JQo7WZRdH3UNX2+OnRUCKn/0p9E56oCwCjZBR8EeYaqURH8enBTVzXgtc7H+xVAzCadToYMVcD1Fdm7v8933Nq228R7ER9ErIbDQLzaGQG1JnufQWEZ2FbAYkeiwjk1lTaWLJFWNTHTacupt4pF76nCVnGTaBOekK9fc3yd/SFGHM/yJvT6lwum1muWrIsg91aO1bwjdV3243utAf0I/WFlE2XqbgtV8jbat92a5gAniboMIqbjE9G/vWNaKCdYDrNx89R6NWQDDSL9N+XH3NRRLfKycK0scP3lC1IIXjvQTAAG4KuHypzwkp489cmFlBrBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlWNPMn7JctfZ5W6u8QRDPJrVRkipik0W7OmrOs3C/4=;
 b=FS5+m64GUo5ZAh8aiK0hiz2lCNpKjjwb/SY/HGN8XhmMXpC5oinTAwo5g/ZWJ5kz6tPuF2PHXc9f6qd60n+p1McPRW2Q4sv6NHo+Gfp649Yi0FC95NAyADR+KWWIGACHU0oUnF6BXe1ry8v8CadoTSPU3dUmUQoDvSWqt+2AYhnuQZEfWcAVMXugm1yqgVoTaadSyR2rumdSbPYrSrCB5iE2+EdDu2ZHvB5PVJ8iGYn42QcMeH7F9d/Gm8VOP9Xj1G4XtaJKMq45WO+DkxyuYkPAn3Z6uJrYO9rIDGTvMeN3SikRqGZxeQr9yUei9jc0zpsL6vn9CXfpyD8Mb1sQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlWNPMn7JctfZ5W6u8QRDPJrVRkipik0W7OmrOs3C/4=;
 b=CZ0Ws4ORAvNtCk9jfinpIJDR6xdKwCM4QjmaFasjQbJzcMUNxEZSNQ7/yUzm2FEri9l1QFw6bYYiOaD463wbeoBnV41f36lmX9AycPO0Spt5bTnd/QSsJCWDo4Pjnz6MtRNzCqZKXipV57SMxW/2xIn/5fqtZtBbRYNyFIIEsE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB7088.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ec::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 16:03:03 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d%5]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 16:03:03 +0000
Message-ID: <31945549-19ce-4594-b3a9-eba78bae490a@kontron.de>
Date: Thu, 30 Nov 2023 17:03:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: bridge: adv7511: fix reading edid segments
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lars-Peter Clausen <lars@metafoo.de>
References: <20231027122214.599067-1-emas@bang-olufsen.dk>
 <4e727bac-3a48-4784-9deb-136d61ae431b@kontron.de>
In-Reply-To: <4e727bac-3a48-4784-9deb-136d61ae431b@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0044.eurprd04.prod.outlook.com
 (2603:10a6:208:1::21) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS8PR10MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b400c3-9fd6-48dc-8b97-08dbf1bdd546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzToMRFVZSa9MtmuCTuDesU5Qsefu5vQlJq2zkaD8IgKIn4XMrHk1pi9m4OSUO5t5vxQ6v+TmJBVC8epEggiOEmmpnf0B9CcTp7kAyjEJS8vv+1tEXKo45B+tvNmG+37ctURKm1O6muWeufwWCo2U/3RLf8Hkp3DdS1grdvDex3moxGy9ROrLHt4c2ZGxl5kRIzYKSvGHXLckPeCyvvKbeyqoqi3egNj113qHiX9foWfrlFRfnPIQHcDarsXVRYw0LFhE8IKMCL+wr7254/KtlohmdiCFZ3wORDSIpJYUAVtwTJle5uwRFZS9dsSsLrtMTHvTVjg2T8n/P+unEr5RAU32pH+JclLWKuC/wBvBrEO3MfkcOnFB5jnc+PhGKVB/YTPATAFdVJ8/hYhramHmvIFlzNZAbiSDGhSFsKantmiTLsl7nHeNksufc+EyS8TkHu2o4o1da/1qDU2pdAUv9BRPKb3dCEq8aIK3Q2b9MMoCzOgFZSToos+8F6iIXBn5trg9ShCPVVUMkXh3VwJMc8ZfWi2WO34X3v+bOtMacHZHthGHQy6q2G8zTCkqla2KcT/OAaYFG1EtZCRLrzi9cqW3ZA50J0AA4b/+pDB/jMA/nYL3wcBU/8gw/4ZNTKg5NTgZUd5sJIDmwpPWPMV0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(110136005)(66556008)(316002)(921008)(6486002)(478600001)(966005)(66476007)(66946007)(41300700001)(36756003)(5660300002)(45080400002)(2906002)(7416002)(8676002)(4326008)(8936002)(86362001)(44832011)(31696002)(26005)(83380400001)(38100700002)(2616005)(31686004)(6506007)(53546011)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzkrZmNHcU5nNDVYbU9YWXN2VlR6VkxTVnREanhER3lPeWlnTzh4cVQ0WGxa?=
 =?utf-8?B?cWpxYUVRc09zdlg3K1BlOGYzTEYyNFRLdnpKTWlWOXZGcHVkOTZSWkdrSUM0?=
 =?utf-8?B?eHlkZ0lyMlJyenFzMFdJaEpCenVxSnNBZng3SGZMOWlwRkRBZjRRZFI5bGht?=
 =?utf-8?B?M0Nodllqb1A2VVZDODJwa1c3S25VVERqMlhiZlROSVZvWi9pK0szbVRqTmFJ?=
 =?utf-8?B?dUdQSG1qUldseTB0ZlVMY0RRbEtlZEY4ZDdiVXFzM3JJTy9uREZTWXlWcjlJ?=
 =?utf-8?B?WXV3Q1lDa1JsNENQNTY4aVlxQWFuUXB2ZVZGeXViQWpXMzdRenZ1R3ZXR3ll?=
 =?utf-8?B?aGpRZjVmODFRYVNHMGFVK2FObVJJZnhGenpWVkJpSk9uSForaTZMb3RKdjQ4?=
 =?utf-8?B?YUxQd2tVK3dMUzZVditSU0JqTXZKaytCZE45SWZ0a1paMkpFMFpUdWxHQ1Ns?=
 =?utf-8?B?T2Q4VDF3dU42UlRrOEFJNkY1UnhLb0FpQlo0L0NRUjdIRVVDbkRRcmtiaXhp?=
 =?utf-8?B?SU5MRWIvZW16cTBPYm9UYnM5ZFV0K3NKb2kzcFJKeWNza0RnK3dvZW9jeG5w?=
 =?utf-8?B?YmZienZoLzVCditTa1FMaFg3RFZHcGtoQ3VmYW9KaGlucTVva0lyaFJLelkx?=
 =?utf-8?B?ZUpDSmVHZ1NTNnZYdklKVlE1RitJdUxXZXdyYXFZZmdqci82VTdnNlBzWFVN?=
 =?utf-8?B?c3c1Q3pabjFyZ3BabkxkMGF5TEI1UWxIaVNGV256WkJmZFpxQm03eXYzUW9J?=
 =?utf-8?B?eER2Yko2cURaeUtDOCtVZzVJYTZ1SU4xMVoxenA1Rld3RW9FbG5JY3VZVWdH?=
 =?utf-8?B?NWFPS2xnR1NZYlpRMlE0cTdmYStrRkVBZzg3N01naENCeUZRTVYzNVMreWJX?=
 =?utf-8?B?YzNqM0JIcWVxYWMrd3BKc1hVVW5nWDJPTm11ZSt4a1l2RmxXTFJNd0F1RjBB?=
 =?utf-8?B?RW9EWGIyNEFwV1c0VUtscEVIbk1aWSsvQ2owZWNvZFpvRHNmWi9mRTdTa0tE?=
 =?utf-8?B?Y3ppeFo4VGhTOGYzaVNqZWhISG9rMG4rcU9Yb2huZFpLK2tlUmo4blhKODdI?=
 =?utf-8?B?T2pubzZGYnRmT3FrSG1BTk1UWFBwMlM2bGFCOWhBZWRZZ2hSdWI3ekJVNmxm?=
 =?utf-8?B?VFF6Q0NQMlU5QU8zV1djRE1jRGJYMWtyQ2pxTHNUUW9pL0RDWGx2clRHcWt2?=
 =?utf-8?B?aUlmVERRdVJsdVNIYXVzMGx1UkRtMXY1cVlBaVc5Nlg5MEY3UlVCOGV6RitO?=
 =?utf-8?B?UER1UVJ2V0lKd09BUEw5YUFoZlI4MUxYdGlDSm1hbzVBYktkdnNQM3lQOVJG?=
 =?utf-8?B?ZklnclZDSWllRXFoOUhPSVZqcjNuTm9RTlljVUpsMHE3MWZWUEpHVlJTOVJ5?=
 =?utf-8?B?Q2lzNGRLZmFIZnF2UWNiampSZnVZZ3VsUnlsZ29xeHF6Z28xVkRiWkQwU0hU?=
 =?utf-8?B?eW9zWitkdSsrUjVnbk52L2U1aXFEVkR1ZWs3M3lxMk1QTFVUdmFLQmRkRWYz?=
 =?utf-8?B?eDJRRmJ3V2M4VXkyVnd4WlFWeS8rZ3E5OXc5enBKaG1sZ1luejVpdTl6bkRG?=
 =?utf-8?B?KzErQWJyZkxDRGlRVktmTDlIaVlGOUdoVFYyd3V1MFExT0dScndVVU9ySlox?=
 =?utf-8?B?N3lwdmNaTWd0OFk0bk5JV3NNWkVTT0dpQUxhTG5HK1dvUHNkNTM2STAweklp?=
 =?utf-8?B?dDZnTkI4YWJzbjZ0U1Iva1M0ZHNFaUtRSGtxYnFLZ2pFM2Q4M0xpWE5IZElw?=
 =?utf-8?B?NHJ1K25qOHJHTC9TOHYwRVgzVnVWUVVQSHdlanJvekoxOHduOGpac1I3RitN?=
 =?utf-8?B?WXRvcGkyTHVXN1FnTnhxU2gxVzcwTFlLTFBxZnpxM3Y3NjlBb2FaSDJqT3dW?=
 =?utf-8?B?UVBVTGM2NlI1TnVRaFczb1VnekxraTQxVFVNWUJTUUZHdGkrQklSMVhzTWQv?=
 =?utf-8?B?S0xqS2NEUFJlNW83U1NCTE80UURDN0plOFJ4L29aY1d2MUtOcDMybkZkZjhS?=
 =?utf-8?B?MlhhRlVmVVRiMGkwY1JCSC9ObDBzRHpyRURMbHNMdTlpdWpVeElVbE9HTlhr?=
 =?utf-8?B?M3EvcEMxSWlHdHB2RU9jWFF1WE1JR0RZRGpwWGdBZDZra21uY09yMU80eXds?=
 =?utf-8?B?NThPeVFIcUdkYUFCZU9vejY5SWRTWlhVcVh0R3UwamxVQVYwVTFHS2lReG5q?=
 =?utf-8?B?dlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b400c3-9fd6-48dc-8b97-08dbf1bdd546
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:03:03.3691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pkRVsMyMkKe/kj1yvRp4wxn8BBOXCFvGFMP9Z5wIaHPEKtC4rUHE0RkMYfs8TE0XKCq0BpSYQa/4dVR9CZXfYnXdq0Ouu/yfmeEmO119MA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7088
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.11.23 16:57, Frieder Schrempf wrote:
> Hi Emil,
> 
> On 27.10.23 14:22, Emil Abildgaard Svendsen wrote:
>> [Sie erhalten nicht häufig E-Mails von emas@bang-olufsen.dk. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Currently reading EDID only works because usually only two EDID blocks
>> of 128 bytes is used. Where an EDID segment holds 256 bytes or two EDID
>> blocks. And the first EDID segment read works fine but E-EDID specifies
>> up to 128 segments.
>>
>> The logic is broken so change EDID segment index to multiple of 256
>> bytes and not 128 (block size).
>>
>> Fixes: 9c8af882bf12 ("drm: Add adv7511 encoder driver")
>>
>> Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
>> ---
>> v2:
>>  - Split into two patches.
>>  - Add Fixes tag.
>>
>> v1: https://lore.kernel.org/all/20231026113029.575846-1-emas@bang-olufsen.dk/
> 
> Unfortunately this v2 series breaks my setup in the same way as I
> reported for v1 [1].

To be more specific: It's actually patch 2/2 that breaks it. Patch 1/2
alone seems to work fine in my case.
