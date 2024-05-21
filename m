Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE38CB348
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 20:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD0E10ECDC;
	Tue, 21 May 2024 18:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sL2upchl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFCB10E076;
 Tue, 21 May 2024 18:03:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYE9DRtG5evMKMii0HcRQ57orDu6FgIK3QczIUz55thBv9cxe/ai41at3tQYcAr2lmB0T5w24O/i5QLq14cd9jqCQAFlKN4ArW+fdiE5jmU2W2UDrimJokDvRMRy5UefEBDnj0NppnrIZ1/VQgCazNkq3x63ocotjL2tG7ENNkZmJt1Rw8H/fyLh6fqfxzAq819gOm2bahan+qqBX3rM5EoghaW/rShMr5hA1STp71Ty05YkQYKVHgVU4kMzxY+gfacY8Z7tTZeJKzTOzC2MFKzMc8do83F8p0c6dC73rHt9BL3KaOkNOJlUYqAv7ML4ZIntrkYMQZKCXNWKfdqN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bAVjZaVvc7LvonC58wuC3XTl28hMEmnc6nXv7ki97w=;
 b=HXDYTT+rK4GXYcvR9rCzB1xYgaDNu2oEHOsZrwoMmrxqdvNJzXT27QURd3RKNPku5Zhg7J+cgqIw+lIy3aVcmM1sujDtFUHax4mwDqaKE9rKkKYgKVIjcdSyc/UoTi6HW1NxJU9lFWBvE4bPKYUuuQ+1RYQapQ+nwKC6hslWszzQJlL6bBBjKGmlkAWXI7ZxkA/npUueyKqITUyTKxY4Q/TRhwrIKhyC3gYPbeophcDtvXB4ZJE/UHrbQ9M+vAp0h/Jg9CLCKB7oBNuSWq8J/NQH32DP3iWOrXO+zBVDhWa0f3Cx/G6pZbfDIqB3c2uDnVQwqUFb1Ex4pJwWfBevuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bAVjZaVvc7LvonC58wuC3XTl28hMEmnc6nXv7ki97w=;
 b=sL2upchla1EAMksb9PJln/5vyvnXwC8+kmPR0hqUJ/2llBDWyetrMPXttO1NWdBJTxmHYfKhq1oIU1bljBgTlMda3G1xa+IQq4I80usqiQC6aWx8NJ09T7EfJh6kdnaTlG8eFUMm7jnUiD+GBundeuliJsJe2NbU45/p691jvtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 18:03:10 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::9846:7505:7b05:df62]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::9846:7505:7b05:df62%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 18:03:09 +0000
Message-ID: <327abb0c-14de-40a3-8765-b0653c7f82a9@amd.com>
Date: Tue, 21 May 2024 14:03:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Panel Power Savings property
To: Mario Limonciello <mario.limonciello@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, amd-gfx@lists.freedesktop.org,
 Harry.Wentland@amd.com, dri-devel@lists.freedesktop.org,
 "seanpaul@google.com" <seanpaul@google.com>
References: <20240519130610.7773-1-mario.limonciello@amd.com>
 <-KAO9zJq5vTiesgtw-PMO0lDkSH1tuV271WNqlVuh3ZSkMzKWB9JQJce68-X-GwhD57QilHIBnLxN9k03I3-CMeYQm30NJMLizfyUUxTqHA=@emersion.fr>
 <e3a4331a-307e-4377-a349-8699024f8459@amd.com>
 <CAFZQkGyupsydjSEfv6OgMqPmHm9kMy4HQs7aNvzn77omSN+ZhQ@mail.gmail.com>
 <a35f2f5b-024f-42ed-9d59-48efcf4516a8@amd.com>
 <55205499-293e-45cd-870c-1ccccd05145d@amd.com>
 <3dc3f386-9a6d-48ed-bf35-c445b1d0120d@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <3dc3f386-9a6d-48ed-bf35-c445b1d0120d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::13) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|MN2PR12MB4301:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c11b27-35da-4830-9192-08dc79c045cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWZWNlVKR1ZSVCtEQ2dtZVZGbXNDbEp0YnA5dTEvVE0xTUFGdTg0a0UvS1VW?=
 =?utf-8?B?M1I4NjRuV25SOUJXejAzRFNQL0NHWE82ek5YQktZdFVnUGZtWjJQRDBJK3Q5?=
 =?utf-8?B?eXlxZWpEVVUzbmxralBuYVNTZGE2QU1XZHcxTkJIOXR3U2RacW0wU3h5djkx?=
 =?utf-8?B?RVl1Z1FvYnFydGRTU250aEcxWDlJdWR4MG9PaGpnOHNQanFaU3hkSWxZOC96?=
 =?utf-8?B?VGtOZGZCNlByYS9GTVBLSUI4WHhwZkNnMjI2Sy8zTDFwYllGS1ZjM3d4aTNQ?=
 =?utf-8?B?WnJFbmdXOWlBc1ZNSGpSdzdBRUhmTTlvVTdiTExpZDZwdTVadVFyOE9ReDRW?=
 =?utf-8?B?WDEwR3cycVNYMW9Oc3JBSklURjZld1ZMdDNwNXloMW96RzBISmpmTTF5TW1O?=
 =?utf-8?B?Z2E0OFk4dU5IU0J1MkdoNEM3WkJndlU1aFJSakxOTmw0S0pERHUyNlhRanho?=
 =?utf-8?B?QWVBUFlWbUJHWk9icHJKU29vL0RuNmlLb3J2MDNONG1HOStSRjY0SmtQeWpX?=
 =?utf-8?B?dkk4WS9QZUhYeThabmwxd1NOeEhYSXoxc3lFaFBIdkNMRG5tR0pyT2ZUOTJl?=
 =?utf-8?B?ZDhIeEk2NHM5dGhOL211TU1ZZVZDSDEvNytLOHZWSE9HNzZ5b3I0ek1xaHRw?=
 =?utf-8?B?ZlZoME9QTElNL1lEdWZnMGJRVmIwTjJnM1dKZ3RMOUhubzI2MDFQTU9paERk?=
 =?utf-8?B?ckdtRm0xQlprL2d3YlBCbkJTMnBnMmtvLzErN2VIUzI0SFYzLzVzSjV6UnIw?=
 =?utf-8?B?UnlJcTVmdmhFOGZnY0h6emIvNWVsbGYwdlVBT0s2TXN0NWhkTG1MNEZYcmlw?=
 =?utf-8?B?aU9jTDZxdm0xcTdUSVYrM2xOZEt0RmFCZGd3OWk3WWJhejFKdjBJZFdqL0hh?=
 =?utf-8?B?N0ZHL1Jwc1l1WW5CQVdFNWJoS1Z6RUFwMkc2eGFETXMwaFA4dlpNMFVJN2Zi?=
 =?utf-8?B?L0E3MUlKUGZzaFNaTDJXVk4zRU5xV3N2SFBOcnlkTjhnZXZQTFh6UzhDSExx?=
 =?utf-8?B?QTViNXVsMXhyOGFNWEJZNktyWVY3eVhlM1dETEtJT2lJdVBIMG9MOW9aMklU?=
 =?utf-8?B?NmZiOXFDQWZOWWljQllyYUVSc1ZaVmhsRjZVdis2U1ljTEg3YzVoVzJhWHRE?=
 =?utf-8?B?MFFtcEFGaytGUFg3UnlLT0VaMW1iNVhhMDAzOGV5SGRqd2FObm8wbzJmdjNE?=
 =?utf-8?B?bGI0Y0o5RzdlSUxOcnBCVkpkOHhtc0ZpOEx0N3o1VEZyNzhIK0VOZDFRRDVN?=
 =?utf-8?B?YW01WkRRWWFpb3Yvc0k0SDFlVkNwQTdHRHo0aFR0Y0Jlc3JvSFd6U25LbFVK?=
 =?utf-8?B?bHpYaHg2a21kYnZLQjFmRFN3U0lDejdsU0VJSFBETXNaanJFZ1pRZzI3NHE3?=
 =?utf-8?B?SVQzbWRXdGhYZDJtWDRQcDd0Z2tLQzdqemJwQ2RaY2hQalhrRHVPeTRxYUF5?=
 =?utf-8?B?NDVmZ0lzdWZjTG14KytWT0M0dzE3cjVxcmtXb2p1ckx5T1dLbFZReE5QWndP?=
 =?utf-8?B?bG9OVkI1OXY3STY3K3NTcitXWGNjc3JTUVFRd2JzZk90Nml1VERkK0IrNEZ3?=
 =?utf-8?B?L1hzN0JrT2JJTkxEWU1GbFA4dGUzQ3g3eEhRaEdEdTF4VUlWVkJ2anZIaTdn?=
 =?utf-8?B?Uk81RVFGSUYwdWpyNTQrZ3N4bWh1ZDlIZzNHODUxREF4NE14Snp1bEhTS3d6?=
 =?utf-8?B?RzdlekJpUzlnZXUvNkg3U3Jpa09aaVpmYmlhOWJ3b0E2aFJMWlhNRnlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ai9kV0FNSndWd1Y0RWhQVVIzRzN3RFJ4MFRmSmxhcGpLR09UbXd1UW93bzdp?=
 =?utf-8?B?U0xwaXRIcU95OHFpNVJRc3FydHdUOUpFL0Q3dWpwQjA5c3BGSGFGY09BbTd3?=
 =?utf-8?B?V2preWo3dEdWaFliZGZNR3RPTUNJSjhsU2ZLTHRVOFp2QnlZRUZIb3JoZVpX?=
 =?utf-8?B?Wmhub1Zwb2pFMFN2RFgwZUZPNmsyTWRyOWcrSUlxdENMM2tLeFpBeUkzT04z?=
 =?utf-8?B?eEhpZGxXM1hobFVGZkRrRkRHRXdENDZNQXhyWkY2QklqaGxFMmoxazhLU2JE?=
 =?utf-8?B?OWN1djd2TEdXNHl3NG5EcTh3cVNVWHEzZ0E5VlhqclJ4N01IY0lLa2V4Tm1X?=
 =?utf-8?B?UkhxWS9LKzBHUmZ1K2g1c2xIRXZIdFU0dTRtMTlHbXJRTU1iaVZyV3FFVGdt?=
 =?utf-8?B?YzZRNWpWRHdzNFpCVzQrcGZUbW5zS2JnN2hVM1ZpN3N2ejV6VnVQcXhqRnhK?=
 =?utf-8?B?WDVmQ0g0bUVPMmVualh6ZlVrdDBseFVnUjNZNGEzZXVhRmlzbUR4c0xYM0Mw?=
 =?utf-8?B?eEF0ZW96NzA4aTF4TWF2Y0k5VVZVY0dMNVFWM3FQTW9mVFVJVkN6aHRMZWkw?=
 =?utf-8?B?SXo4aDUvelo2cDEyUnpoYkx6UjM1K1BuVlIySkNidjNVdm11aytnOUFuNzdN?=
 =?utf-8?B?MWE3bzg4QjFDVzNRQUwydllmNEY3c1o5emd6MXZkcm1LWnROVjdQMFlDLzA3?=
 =?utf-8?B?RWp6WTBUMGVLRi9tU0tRTkxINjBkdTJtQUQ1endpcG1yZWtUaS9NSitFejZ1?=
 =?utf-8?B?ZWtqOFZ1Nkpjb2FtUk1SdElIYmgvTlNiYTVLS1lEZGpwSWNTUHBUVVE1Z0Ez?=
 =?utf-8?B?SmZ3aCsyL1M2TFJHaEFzNTkxU1U5dHVvVWNaU0U4OUdaWk5QbUVzZFMrNTV5?=
 =?utf-8?B?UjUwL1ZwMUx3WGZ5WFdadGVPV1BQb09JVmlDdVM1eTh1eVRCdVB4L0g0NXlL?=
 =?utf-8?B?anJMTnl2dmpGQTRLN1JEdjFzSkZIRW1Qem1PcmNpSmRnUlgrRGlFMmoyS3RF?=
 =?utf-8?B?blRLMVJNZGRFSU1mK042MGlLVUNDTVJYRW0rYkcrTWZDSGhRa2JDUi8ybDJW?=
 =?utf-8?B?Q0VHNm1nanJ0SEJ1Y2ZGRkRpQ1luWjZjSmNEbnhjVU9lQWJUUm82ZThpQTUx?=
 =?utf-8?B?REEwYWVYbDJhV2I1KzJsYm1HOGhUazJrT3psTm40YTNlUStaVjFta3lwVWVu?=
 =?utf-8?B?OVZIaW91dW41OGR4VWJiVWxqbHlhQ1VGdHJZRFBwRnlIWlpnTjhwNTRNdFlH?=
 =?utf-8?B?NFh5a3FNY1J1NExVdW1WbitWbmVyeUFKNmVod2wyNXJDVEJHTzNZK1l4RWYv?=
 =?utf-8?B?VGNkSnpqaHhTMC9zMFVRaE9EK3pDb2RMZjdBSENjZ25VUnp3TFF0ci9sM2lI?=
 =?utf-8?B?YkVodHNXSFNuSFNEK0ROTEhTbTUyL0VXQ0RJM1RuUG43ZGNrdzhyYTdtYUs3?=
 =?utf-8?B?SHRwVGNlTnlTc1BSTWpObGcrTGVtSGF1bFBnQlp3RDB4dDlsamJucjZuSU1R?=
 =?utf-8?B?RmpIUlZPN244SWJiTkphczloRnUrMFNVSUltSnhaV2R0WWFROXpReGNGNE5u?=
 =?utf-8?B?N0N3QVR5Y0FzN3I2bWdEcDhJQWhmQmduN2Q2OWluODVOMEhGQU12Y2tiWGFM?=
 =?utf-8?B?WlNWcnNOc0RGaHQwK0VGbkZpT0ozRmczaUdQR3gvTk9hanZTeXA4QmlHbE5F?=
 =?utf-8?B?ajFpaTltYU9HSEZqRjZQNUdDeUZJOUZ0TGd4eWMxeWl4Qzg4Q1VmMkxQUHl4?=
 =?utf-8?B?dVByYWc3VEZBSlA4cWxDYTl6cHNNVWsyQWErUU9OaU8vZlU0L3JUUEhFVkVT?=
 =?utf-8?B?RXRBdjhsU1RwTXMyRXlVYnd5U2RBeWZUSG9PWmR3RlNMN3drSTN0ZmxnM0FK?=
 =?utf-8?B?ME5IcGZPUlUySWhxb2duQUhlcUtrY3k0YjZ2M1ZnVHgvMkFXQTZOK3FYMk41?=
 =?utf-8?B?czJUSnVBMk83di9HU0VPSEVsb2FqcjZ5bldiWWtzb1NUbElYclBvRmFTc2c4?=
 =?utf-8?B?MWx5Mk5ScEEyeGNCZWZ2a1RjRTVXUHlNSmRkMnJuN1FQWWRuMWc4NGcwWFd5?=
 =?utf-8?B?WHVza0l0TTFDdzZPS1NMeVpqaFoyUTBrZUZsWFN0T09uWVd4Z1pCSy9zcEE2?=
 =?utf-8?Q?DchQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c11b27-35da-4830-9192-08dc79c045cb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 18:03:09.2808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XSSheEtCi0ghW4YRwfgQWpGuifWzLwKaqnEco/nreVgXJfnv4osfDdhbfIsy+ai
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301
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




On 2024-05-21 13:32, Mario Limonciello wrote:
> On 5/21/2024 12:27, Leo Li wrote:
>>
>>
>> On 2024-05-21 12:21, Mario Limonciello wrote:
>>> On 5/21/2024 11:14, Xaver Hugl wrote:
>>>> Am Di., 21. Mai 2024 um 16:00 Uhr schrieb Mario Limonciello
>>>> <mario.limonciello@amd.com>:
>>>>>
>>>>> On 5/21/2024 08:43, Simon Ser wrote:
>>>>>> This makes sense to me in general. I like the fact that it's simple and
>>>>>> vendor-neutral.
>>>>>>
>>>>>> Do we want to hardcode "panel" in the name? Are we sure that this will
>>>>>> ever only apply to panels?
>>>>>>
>>>>>> Do we want to use a name which reflects the intent, rather than the
>>>>>> mechanism? In other words, something like "color fidelity" = "preferred"
>>>>>> maybe? (I don't know, just throwing ideas around.)
>>>>>
>>>>> In that vein, how about:
>>>>>
>>>>> "power saving policy"
>>>>> --> "power saving"
>>>>> --> "color fidelity"
>>>>
>>>> It's not just about colors though, is it? The compositor might want to
>>>> disable it to increase the backlight brightness in bright
>>>> environments, so "color fidelity" doesn't really sound right
>>>
>>> Either of these better?
>>>
>>> "power saving policy"
>>> --> "power saving"
>>> --> "accuracy"
>>>
>>> "power saving policy"
>>> --> "allowed"
>>> --> "forbidden"
>>>
>>> Or any other idea?
>>
>> Another consideration in addition to accuracy is latency.
>>
>> I suppose a compositor may want to disable features such as PSR for use-cases 
>> requiring low latency. Touch and stylus input are some examples.
>>
>> I wonder if flags would work better than enums? A compositor can set something 
>> like `REQUIRE_ACCURACY & REQUIRE_LOW_LATENCY`, for example.
>>
> 
> I thought we had said the PSR latency issue discussed at the hackfest was likely 
> just a bug and that nominally it won't matter?

Ah, either my memory failed, or I failed to clarify. Let me fix that below.

> 
> If it really will matter enough then yeah I think you're right that flags would 
> be better.  More drivers would probably want to opt into the property for the 
> purpose of turning off PSR/PSR2/panel replay as well then.

Latency technically shouldn't be a problem for Panel Replay, but is a problem
for PSR/PSR2 due to their design. At least it is a problem for amdgpu, not sure
about other drivers.

FWIU, in short, when a panel (DPRX) goes into self-refresh, it's clock can drift
from the gpu (DPTX). Since there's no resync mechanism in PSR/PSR2, it is
possible for the panel to lag behind by 1-frame-time(ms) for a noticeable period
of time. Panel replay has a resync mechanism, so it theoretically can resync
within 1 frame.

Since, fwict, replay panels are still rare, I think it'll be nice for
compositors that care about latency to have the option to temporarily disable
PSR/PSR2.

- Leo

> 
>> - Leo
>>
>>>
>>>>
>>>>>>
>>>>>> Would be nice to add documentation for the property in the "standard
>>>>>> connector properties" section.
>>>>>
>>>>> Ack.
>>>>>
>>>
> 
