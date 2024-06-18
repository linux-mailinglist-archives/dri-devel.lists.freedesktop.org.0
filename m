Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8590DE00
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 23:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C6110E7D2;
	Tue, 18 Jun 2024 21:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WRpEeehf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA0B10E7CD;
 Tue, 18 Jun 2024 21:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvqGoROsRSU5bV17hICyRu+xh89Zmb9t7a/b5/EubtI9IagbRr1eXKunIlV71s87QWZHNSZB6QKe//ATR3ZoitnN/wnFmgaePJwGJwviVsuHqKo4R1h6nzjmd+hEtXCE73jWe/KN7m0I5Mik+CFT2QRiwb6vMV6sJ/FHRtkcGpAjku22M+MVBH6e4zmmx6nuu0S7uMYBeMVeMl7MDhgN8XXykcvydAbklgYVyfQCO7Ko5eorIrLlzt/5Cv/EaZlOLfE1KJFHaV4a3/o8mnDW1Dlh+avVRt6NVK94A/mKbOABupaQVj6PYslo73z6irBP/iOkeDFPFY0vziSddoUttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIerQQF71UlEJD8g8RZlzTv+IsxliT9MNxEEUtmfHtI=;
 b=ZvKMAcU7v0KbJNb1RNub6fUl9zsfvAWSeMkO3t0POMSIKjb0j2xwAIiSPD5/KbwtouSjk9lCrySpG4mGXKqwFb6sV4IjG9XuQ5SBwTneVz9LO1IIQCF/95BCT4/glfP2Q9NI8IjrodfENvo/r9Q5ZARFeZ6kMxW1vFd4gzBzJ5RDCqi+MtuxReF74Mkq3Hsk6k9TiekxvzvAFkkQudCwVwhkCetuwREr9UT6LREtv0LKMS7njz9qG4G5fYEJgxaNJFh1xsqBuvtyjz5DF7Q0p9BhNcE6c4YjKSpXCP9mP/c0aHQSbZ0dZUhhQNwTiR/+YX+wFwGeu+XajFfGYsRO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIerQQF71UlEJD8g8RZlzTv+IsxliT9MNxEEUtmfHtI=;
 b=WRpEeehf8eo0QyJHKi27jv3p4gctIFZJswZDAWVqfcSIdu1sHlaE/+ZvwEaOMI4l3vcO91BxLmN0mejdNwnd66Y7R1vgcavq4WeDXh+un9kYb7GKTrF/ug8Cvg4Pqjl8RDmtXdRk1HQmZUen9Xqu7miHIJlUbrHqPdPdWfmhvXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 21:07:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 21:07:32 +0000
Message-ID: <92495eac-3699-4a26-b03d-98da762be2c7@amd.com>
Date: Tue, 18 Jun 2024 16:07:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tests/amdgpu/amd_psr: Add support for `power
 saving policy` property
To: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@google.com>
References: <20240522220849.33343-1-mario.limonciello@amd.com>
 <20240522220849.33343-5-mario.limonciello@amd.com>
 <54e77cf4-4fdd-430d-8c9a-7fe7c2eefb3d@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <54e77cf4-4fdd-430d-8c9a-7fe7c2eefb3d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0083.namprd12.prod.outlook.com
 (2603:10b6:802:21::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bb9c85-25e7-4404-cd44-08dc8fdaab62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWRTc2J1U0FpQXV2Q2Vpdk5vNjVXVTBaM05nT2Zhd3BFeU1wRGdVN2c3ZWZz?=
 =?utf-8?B?M1FUVldTU0Z3QTR3TE9SVm1NVjNMdS9GSDlOTFVMQXIrTTdwNUNkZ3JNNnFl?=
 =?utf-8?B?aU4wak1VUmFEMjJROXhQTE50VldzcytXbEZwS2RNODIxTXFXd2ZZMlJwb3Bq?=
 =?utf-8?B?M1BNbnZKc1laQjF6dlJrSjFXUUhGUEpUdGllNnJMTFVGU1pSNlNOWDVWUlh0?=
 =?utf-8?B?TE16NWpHUlhoNmt6bDZVTktZNmZnNFZ3L2ErUFNtd2s2Q0JSNlJ5cHZaSGRZ?=
 =?utf-8?B?ZStsWGF0ZVd0cFArM2Y4Rm9VSTJ5aGZVMzNEZmRIZU44TXNxd3lBbk1lOEhE?=
 =?utf-8?B?MXRLNWVxK0VCWDIvN1NXWHB1NmJKWFFsNjVmaDd6aEpZVENpSmZjL2sxVG5F?=
 =?utf-8?B?Yk16aDFaV0EvTFNKcEZzVHBsQ1lMSzRCOGtERHliQjQ1ZXN0VjUvOEdOeGZK?=
 =?utf-8?B?U0FNcjVQdmZjdjdBM2h3YWtLNm5EdExycEI2OW9pNmZvK0lmeGY4V3IxSWFw?=
 =?utf-8?B?WTU0YXZ5anU2WEcra2lab2dMNkk1cXBpOEZ5dzVZYWdoUEo2bm1vemd0YUN2?=
 =?utf-8?B?b0VMcTNoU0pPNUJhTkwzSXVuM0o5VHh1TnUwbFBoaDdMS2pGMmdZMkdjNEFi?=
 =?utf-8?B?QnBEUTU1MDRGc0NiYnhPR1J5SERTZTRCbVViUzg2YUFJTy9KekpPdnJiWmxJ?=
 =?utf-8?B?ODNDaWpBRlhOc1VGaHlxWjdSSi9VWWZMOStMSS95ZVF2Q0F6VU95aGZNU1BC?=
 =?utf-8?B?emZqTTY3SmNpcFowV3ppaUlmUXpDanEwMWdzQnhxZytCa3FSQkdNNWxmZUJM?=
 =?utf-8?B?NTliUDIrN0JOaTlnWmpDWEtoRmJYQ3Q2Um9RZnpwVXBzMlltc25ZWS9TL2wx?=
 =?utf-8?B?Uk8zTjVaQTl3MFBhMXhXczRFVVk5Smg1NDVZaXNyMnZpZm5NblpycjVFai9B?=
 =?utf-8?B?eFAyb2dtdWJLeStvV2N6L2lwcnIvSHJnVTc5UmxOeTVsYmpVS2JXOHhtajRu?=
 =?utf-8?B?MVdyZC9EYjhuM2NXREZOby9mWjJoQWUvaFcrdUxLeEFManhoOXd4T0pzL2Vo?=
 =?utf-8?B?MityQWRHTzJNUFNRTHhSZ0o2Q085bVErM2UxQWRZRW9EeUtUbXdVRzZlZTlV?=
 =?utf-8?B?b1ZzbDVkOFVFQ3A3VmRsL3JIb0pFRzd1OWp3S2FIZWUwdUJHRDRDUnE1MjNQ?=
 =?utf-8?B?aEF0RFkwQ00yUnFEQk1RR1FsRzRMR2JyZXRINUc2eEl2RFpQSEFwK1hzT01u?=
 =?utf-8?B?dVZ5MzgyM0g0NDNTSEU1WnlZcURXaGwzM2Q2S2RjdlZwNE12UjRvcGZxeEtu?=
 =?utf-8?B?VVlURWpiaDVlcDIzYUpXWW1UbGxQdEl4bElPMkZzSmszY0xhbWhzVElDcC9S?=
 =?utf-8?B?Z2hPVTRxMmE4SjNwVjlKS1Npc1B5bkwwamxKenZ3UlZUN2t2azRlZVdvWVZn?=
 =?utf-8?B?dGVYZkltLzk4OCtGYU9CcEVwUWdpUU5sWUF3eXJndlkxT3FrSk5VaEFRYzhV?=
 =?utf-8?B?TTB6NjJUMStDemVBMzhJMHJnMzhWV2huTi9qRHplaUNVWXBRQ25TTjdVY3JG?=
 =?utf-8?B?K1g5S0hOVy9NVHY3ZEI3N2dMU1Y5M1pYTGRnTkdieVdjSWdDMGpxSFN0cUdY?=
 =?utf-8?B?cDdaS0dGNDZKR3hMeCtJN2VOSHJZNlFyMkZXb0pLWXBYRCtEa3VHQy90bzUw?=
 =?utf-8?B?bkgxS3RxUzRldG8yYUVxMjR2R0RnOG16VnI4YlI3RDZwNXF6YkpoMThEN1Nj?=
 =?utf-8?Q?2sDoy/urRfS2GamwFBeR5NyJOaYd7uXaJmNOQHg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlhIYUxnVUk4UE5tTXBjZEI4UnlkVWg2cU1DbnFjeXFPRHdIQjJGRFJpL2Iv?=
 =?utf-8?B?blhUODFiMkFMV25XSzBBSVFRQlE3b1dHYWFHZnZXMUJwdGx3bVo5Z3F4TmI2?=
 =?utf-8?B?RjdXMHdoMHU3N2xteWN4OXVEWjYzNFgvaFVuaUtxNmNBV0FlL0FZa2FkUlls?=
 =?utf-8?B?ZCtYMDRreFpUSFV5MDN1aUI1azZPa3RNL3RmMlg4bGlnMkRXOFkvZDdSL2sr?=
 =?utf-8?B?MExNQWMwb1dmV1YwRXZvL0VqREh4cHZuNHlUVEdZczh3UjBqNWdmN0dNUjF5?=
 =?utf-8?B?OHI3SUF1R2ozWWFIZEhGVFg1NkVjRjVJejdQMHRJYjlWSjlIV2Q2aDhRQmd1?=
 =?utf-8?B?clArMUZnT2lXUzBYdFRocStZRGRNQkxqZzg5N0FDR0ZSMjNXOEUreU1xakU2?=
 =?utf-8?B?dVdoRjR5T0orL2ZRZDZXRHhjcXovRkZvODNQYUZIc1RyR3ZmYXFkcjV1RWNz?=
 =?utf-8?B?MCtKOUhOdmd0NmgyZ0hyc3BMM0thei9HZTlIbDZwckZzV3hmYnMza1ZmYkNh?=
 =?utf-8?B?ZE01c01hUXdJQjVBZThiRXU4SUUwUjFEWTE1NG84ZGNwNFVUY3pKQmFyRERL?=
 =?utf-8?B?ZlRDL0d6NVI3R2owQmc1YXVnQzNpcmNMRTNHWk80VTlidHNidFNJWjlVRzdk?=
 =?utf-8?B?dmhDUXp1ZWg5eStYYU1VNUFaWTZTRXE5Z2hYWUQ0cE5LQTVwNFQvSmV2c1V3?=
 =?utf-8?B?b2NnZE9kRmNBTDE0TDRyNURueHF5aTVuSndibVdNQ2tNWjJuckpsWDNTNFVK?=
 =?utf-8?B?azB1Q1cxWWRlWDV3OWhCc3VEdnNSRXFGSXVrbnpySjYzS1dLZnU3ZFNlTjFN?=
 =?utf-8?B?cDFsUE5qbzU2TER4YzBCVDZXaTVqQVJHNlBiS3Nub1Jvc3dFdlhaUjRaZXFt?=
 =?utf-8?B?bldCNlQ2SUFlNnIrdmV3cWdocUhIdEpKZHd0QkkzS0tMOHBVZG9hMy9iOFJn?=
 =?utf-8?B?NFVhN0xqVzB0NmxkV2JKdlJLTDEzSkY4SUlQVGF1U0cxS2lQWlhLL2tyNFpD?=
 =?utf-8?B?c3pPVERmbGplNUlkOEdWY2hJR1lZOG9kd2VuZG5yYUp2cUxsclpEV1p1MVNO?=
 =?utf-8?B?VmgzVExudHpETlk5WFArZEpZTldUNVJDYTFYQ2I2WnRzVnVwYjk4UDFZK2V3?=
 =?utf-8?B?bDRVbVkxN3drQzhZRnJVZFBadlJwd2dDdVlXc3FISFJUYjVwVWVxeXBJeTg2?=
 =?utf-8?B?MHY5Ty9zbVJoanNNQkNiak1KaEN4UHc2WWFMWHAyaHVjakFvb3RMTUJkN3Z5?=
 =?utf-8?B?aUM5OGpFZG5pSk4zVG9jSU9KeW4yWFpib29ySnYrZ2JLdFZjaUNRYytrcVdX?=
 =?utf-8?B?VUFNMW82TmtvK2lwNXhESjR1ZDlrdCtMU29TZjRGSmI1a09VcnBCZ3BLanlm?=
 =?utf-8?B?UHhoSnpBb3kvMU1zRDhiWURXcjVUMThoU2FjenJpWkhrb1RSbzUwOVVjZWh5?=
 =?utf-8?B?L0JIcFZCTGlDVkJrNE0vaHV1Und5ZkhMcWJ0c1U1NkFuenJwV3IzLzQva0l0?=
 =?utf-8?B?U1dkb0NidlVWMXR0OTR1VnlSMlZBZWY5NkQ2Mk5LemdJUnIxS0ZHSmhSOVNG?=
 =?utf-8?B?cHd6ckIvV1J6YTBQcjNHWEQ4N1pLUXZBc1R4QlVLOWx2KzBPVk5uY2FiRVhz?=
 =?utf-8?B?eloyOXRXSzQ2SjR1bk9hVk1URWRJSE5OaHBza1ZjWlZHSndDT3g0dE1Ka0Nh?=
 =?utf-8?B?L21POXN4VmpOQ0JEOWt6cTNLUmpISlFYSS9JbzVtOFdVaStpeTU5RTFMVU56?=
 =?utf-8?B?ZFhTOG9IUDkrdngzMGsvSUpNcDVJd2NqSUlLeGh2ckczZnpHRnZRREErUHRO?=
 =?utf-8?B?cVF2dDIxeFpXVXQ5RjNPaFN3T1A0SUxwbWJncGdTd1lMcVllcER4akpaY0RN?=
 =?utf-8?B?RlZja3dTVjU0ZTNreHZOKzhoVHUzVE80dzBqSVZPM05XbUR6NzBvWHRHS3M0?=
 =?utf-8?B?K29JRXZYSC9yRU9XNGx2Z3YxRWNINlNGMnFvanMwS3g2WDdSMXRDc2FtdFVB?=
 =?utf-8?B?ZXhyMEtIVFppb1FSN2F3US9pbGZKLzRJWGkyWlltZkl6eW54SEFHQ1JUZG93?=
 =?utf-8?B?U0oyT0RVL1VpZ3NDc0I3QWhienFSM3BBMnRBd2hQeHYza2FKelp6R29Zb1kx?=
 =?utf-8?Q?MY4fwqha0Gh85E2CMwX80K98C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bb9c85-25e7-4404-cd44-08dc8fdaab62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 21:07:32.2058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ckEMwjF3ajpHhoeSolezVIPOp3CpZJKP/W74JCVCF8dD91//vGHxql/UxduzedhlUCPGOwF7MqUwnmba+SmEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/18/2024 15:20, Leo Li wrote:
> 
> 
> On 2024-05-22 18:08, Mario Limonciello wrote:
>> Verify that the property has disabled PSR
>> ---
>>   tests/amdgpu/amd_psr.c | 74 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 74 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
>> index 9da161a09..a9f4a6aa5 100644
>> --- a/tests/amdgpu/amd_psr.c
>> +++ b/tests/amdgpu/amd_psr.c
>> @@ -338,6 +338,78 @@ static void run_check_psr(data_t *data, bool 
>> test_null_crtc) {
>>       test_fini(data);
>>   }
>> +static void psr_forbidden(data_t *data)
>> +{
>> +    int edp_idx, ret, i, psr_state;
>> +    igt_fb_t ref_fb, ref_fb2;
>> +    igt_fb_t *flip_fb;
>> +    igt_output_t *output;
>> +
>> +    test_init(data);
>> +
>> +    edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
>> +    igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
>> +
>> +    /* check if eDP support PSR1, PSR-SU.
>> +     */
>> +    igt_skip_on(!psr_mode_supported(data, PSR_MODE_1) && 
>> !psr_mode_supported(data, PSR_MODE_2));
>> +    for_each_connected_output(&data->display, output) {
>> +
>> +        if (output->config.connector->connector_type != 
>> DRM_MODE_CONNECTOR_eDP)
>> +            continue;
>> +        ret = clear_power_saving_policy(data->fd, output);
>> +        if (ret == -ENODEV) {
>> +            igt_skip("No power saving policy prop\n");
>> +            return;
>> +        }
>> +        igt_require(ret == 0);
>> +
>> +        /* try to engage PSR */
>> +        ret = set_panel_power_saving_policy(data->fd, output, 
>> DRM_MODE_REQUIRE_LOW_LATENCY);
>> +        igt_assert_eq(ret, 0);
>> +
>> +        igt_create_color_fb(data->fd, data->mode->hdisplay,
>> +                    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 1.0,
>> +                    0.0, 0.0, &ref_fb);
>> +        igt_create_color_fb(data->fd, data->mode->hdisplay,
>> +                    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0,
>> +                    1.0, 0.0, &ref_fb2);
>> +
>> +        igt_plane_set_fb(data->primary, &ref_fb);
>> +
>> +        igt_display_commit_atomic(&data->display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>> +
>> +        for (i = 0; i < N_FLIPS; i++) {
>> +            if (i % 2 == 0)
>> +                flip_fb = &ref_fb2;
>> +            else
>> +                flip_fb = &ref_fb;
>> +
>> +            ret = drmModePageFlip(data->fd, 
>> output->config.crtc->crtc_id,
>> +                          flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, 
>> NULL);
>> +            igt_require(ret == 0);
>> +            kmstest_wait_for_pageflip(data->fd);
>> +        }
>> +
>> +        /* PSR state takes some time to settle its value on static 
>> screen */
>> +        sleep(PSR_SETTLE_DELAY);
>> +
>> +        psr_state =  igt_amd_read_psr_state(data->fd, output->name);
>> +        igt_require(psr_state == PSR_STATE3);
> 
> igt_fail_on* or igt_assert* should be used here, igt_require simply 
> 'skips' the
> test if the condition evaluates to false.
> 

Got it; thanks.

> Should we be instead asserting psr_state == PSR_STATE0 here for 
> disabled, since
> we've set REQUIRE_LOW_LATENCY?

Yeah I think you're right.

> 
> I think as part of this test, we can also check that PSR re-enables after
> clearing the power saving policy. Something like
> 
> ret = clear_power_saving_policy(data->fd, output);
> ... do some flipping ...
> sleep(PSR_SETTLE_DELAY);
> psr_state = igt_amd_read_psr_state(data->fd, output->name);
> igt_assert_f(psr_state == PSR_STATE3,
>               "Panel not in PSR after clearing power saving policy\n");
> 

Agree, thanks.

> Thanks,
> Leo
> 
>> +
>> +        igt_remove_fb(data->fd, &ref_fb);
>> +        igt_remove_fb(data->fd, &ref_fb2);
>> +
>> +        ret = clear_power_saving_policy(data->fd, output);
>> +        if (ret == -ENODEV) {
>> +            igt_skip("No power saving policy prop\n");
>> +            return;
>> +        }
>> +        igt_require(ret == 0);
>> +
>> +    }
>> +}
>> +
>>   static void run_check_psr_su_mpo(data_t *data, bool scaling, float 
>> scaling_ratio)
>>   {
>>       int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
>> @@ -756,6 +828,8 @@ igt_main_args("", long_options, help_str, 
>> opt_handler, NULL)
>>       igt_describe("Test to validate PSR SU enablement with Visual 
>> Confirm "
>>                "and to validate PSR SU disable/re-enable w/ primary 
>> scaling ratio 0.75");
>>       igt_subtest("psr_su_mpo_scaling_0_75") 
>> run_check_psr_su_mpo(&data, true, .75);
>> +    igt_describe("Test whether PSR can be forbidden");
>> +    igt_subtest("psr_forbidden") psr_forbidden(&data);
>>       igt_fixture
>>       {

