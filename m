Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3650AD8BF3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 14:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6D210E19B;
	Fri, 13 Jun 2025 12:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dyTIhiRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD71010E19B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 12:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxCSlYM6QnUyYMhomF4pnr0XLe3cShKArSclvujYc7FKI0gg2IFbyZrRgFqNZVxoC9zf8iaedsRy6k9nMR1V9+U2+dmb/BmRgiQcBCQQTAXS3UAX9jWmWh40LdWxhB71yjmNSi28cYTsWU9IlQ0rHh/zetoUZ4ULrZ8RN58CaLU80mHK0PgzBL5kkyYWYoBxx0RfIZbMFCWPWbASxRLUswxPQtmHChGdy3zgFAyHuz8PJ7qFbgl3boDC/81tGETAOir6bIKoNo0yX07kcpOCjy/utbzcH/j/k4dkdQXI+ghlHOEPkI2YCs3Alo88z8jqPBT/scZ6ggJJuhIV8S11Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjkcUM1/G8A84Ovr0TLsHGASAFnTBrrVg4H9iLUP1Jk=;
 b=d75pBPBgXeXeb3wrdIuE/MMvNCXfnKavGALV7rnZZHlwPdQAl+KVJauxLKWqdDUEXsOh1Sv7f1nds8Kao5YHIYDgqnqDj+6MOpC6CdidD4PbqLW3k4OoZZFYSueBEMV+G8Sn3DiWrjTj4ffgy5ygRZuvfUVQJwFqT3dSCDSef4ZAnBQ4QShxZkUPxibdnI4kzMyr0GFOETf6r7buEbo8tWZy/KsKIVewvGWcrsYkZ9LgYa4o3+Z2xCm2/ht6VXI4s+0DjKt5Ej4wQGTVv9ZGW2g6RIUMQgDcC3bHmFj3UM0Skq1WX+JXuwNHtx2FaWhiXuDZDBKM+died4Y+DKqC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjkcUM1/G8A84Ovr0TLsHGASAFnTBrrVg4H9iLUP1Jk=;
 b=dyTIhiRUgzMcNrVtRLkMKEdAhz/6LTSkVmv35nTgfowVQDCeJksj1Ljl/EovxKufNPkBPDznOd3LtfuQEWohuL/KtR5y7kCPSsu0JE419plndSFA8eO8/5Vjrok9Ko5zJQ8V0+LI/3LuquofyJwo75peoF9RZ26Jb8Wm0MpQ76w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 12:24:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 13 Jun 2025
 12:24:45 +0000
Message-ID: <cc1f8c8a-c01b-432d-a466-94ce532d0183@amd.com>
Date: Fri, 13 Jun 2025 14:24:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: "Saarinen, Jani" <jani.saarinen@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local> <aEByd4gidRpxJkfp@phenom.ffwll.local>
 <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
 <dca65c78-9af4-4266-b60e-ce13b5a61f06@ursulin.net>
 <39cf23f66c3f872dddbaf8948e42decc810263c6@intel.com>
 <DM8PR11MB5655FD4DC309FFFA44E87BD6E077A@DM8PR11MB5655.namprd11.prod.outlook.com>
 <362e5fc8-8cb9-4bfb-940c-555514e51912@amd.com>
Content-Language: en-US
In-Reply-To: <362e5fc8-8cb9-4bfb-940c-555514e51912@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: de6decd4-2c85-4cf3-54da-08ddaa754812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2NrVCt6ZlYwWURUMXZzdWlPZWNzTThodVcwY2o0b1VKaTQrZW83L2xPOFpU?=
 =?utf-8?B?U2hNdUVLT0FrZ2RMalVLYjhsN2FPT0pWUWhnZTA2MkVPd3laN0hsNXU4MFB4?=
 =?utf-8?B?Z3NKTUo4SWQwOUo5TThOazFONlNWaUdiRFliRnRqa25ISlNPV3hQQUtWWitC?=
 =?utf-8?B?SVRYdTYzYlRwZVhFOVBDSXl2ZE1XSWtPZ2gxVlRSbitvVWxMMGNZNEJ6ZW5Q?=
 =?utf-8?B?Z2I3bjNvOEJ1Nkd5WWRMV2QzY1J5eGczYnpWVWpOVEptd05jeXNWblBOZkYz?=
 =?utf-8?B?VUZZNUtEWEF3dVRhUUxkMTN3NHlOM1ZMMk9JcGxRWUloYlQvZWRDZ3NnSjEz?=
 =?utf-8?B?WmFscGtuRitFdzVxektmUTdMZ25SbVNZZDFiblJTMjFmWDdlZVhoRi9vYSsx?=
 =?utf-8?B?M1RZa2NqNkRSK283M1dNbkQySEQwZ1I0YVBCTyt0K1ZiQmFrU1VDZ1Eya2U4?=
 =?utf-8?B?Vm41V2EzaDdpMGFZQ3lydEJNQ09TWHdkOXhGUjREck9IR21BamtVQ0ZoT0NB?=
 =?utf-8?B?MDZSdFZ6aTJoQWsydU1kTWMyUzhaWm5obnEraitJdDJTdi83SUtUenRueGlz?=
 =?utf-8?B?WG1aMGMzMnlXMTE1UDhoQ29hMCtWNisrN3Ftc0RrYnZkQWxPUnprdUFnQlJn?=
 =?utf-8?B?aklwR2dKQlNoS1RPY1ZxaERYUE4xQmZ1dmZRa0RhSEFaWlhCV3FTZC9ndjlk?=
 =?utf-8?B?cXJQVjN5Mk1LeW90ZHh4dExhbnphdW1HWTN1OGVyRkNhN2ROOHM1RVUrVVA4?=
 =?utf-8?B?T3djTWx4QjFqR0xZTnkxd29oa2dWRFZKVmhWbXlQK3dzalNRUFhhSEIrMld0?=
 =?utf-8?B?RzVxQjdOZXg4Uy9UaTJIMGlpWk9oVit5Z2tSTkNkdmFDOXFxTlVFcW8zd2dZ?=
 =?utf-8?B?U01oSWxLcW41TS9ZcVY4VEVGejNJTVZSVGhqZ01WbmJoa2c0b3JUNmFGdmpF?=
 =?utf-8?B?N0t4MGg5Zy9VbmVhekJXRHFCN1NyTnU2VmxvYUZMa3JlWE55dG5ZY1VNMUoz?=
 =?utf-8?B?SVF5Y2Q5b1ZpaEgrdHo2SGJ4czF2Z2Y3dmI5b2wyeDdrK1MxYXZZSjhjMklS?=
 =?utf-8?B?eEgxaW1rdVVxS1pOMnY3SDJsMHMwR1JLNUpuRytFeVpxdnV4NjdZanYyM2VC?=
 =?utf-8?B?WGgwYWVvcGtWaVo4R0VLT2swTHg3SjhBei9UKzRXdVZRSHQyd0FFYW10d0JK?=
 =?utf-8?B?NlVhVFpDSitXTlpUUEZUWXNKVnU5b2N4a1ZjOFdoT2tZYnl6eGJuNDh6ZVhW?=
 =?utf-8?B?cmp6TklTVXlxSjFFTWdkOVV0SThGcUJva0pKbnFsYUh2UFdUSUxPOVNQTHF6?=
 =?utf-8?B?SDc2S0RXc0RVWU4xclVYUjBMMTk1OVBpZHkwazRoVy9LVEU3aUM1bDVMV2l5?=
 =?utf-8?B?cUZnbkhJeGtwb0hTMGFzaEIzWnJtWGdDVzJDZWRhSnFjWHZYWFB1QlNnZ3ow?=
 =?utf-8?B?RzVGd1hzT0lrWlZ1RStlVmp4ZFZyeEJCUEl4Z0prQWFjcW5vT1daMkRScWh6?=
 =?utf-8?B?LzU5eExZQUljV3g1UDR6bm9rRmpMb3VFSzB6Und1R2J6bFB3TEhCdG4vMnps?=
 =?utf-8?B?c2VsRnFkdjQ2UU8wYTNQVnlSVnRrZ2hhVSsybllsdjBuT0h6L1lYNjZGN2ti?=
 =?utf-8?B?TkRtTmFLSzJqcWVycVRjdEhGZE13R1NWdDMzbzlIZ2FLeTErUkU0WG9lTmd2?=
 =?utf-8?B?djUwbjZCTkNyRHNtMm1BbkhmcHNXQTVOOVN6U0gvdTBDbXZrOHowTFdIYWc5?=
 =?utf-8?B?UC9MaDhLRml4N2hRY3VIcEMycGFFYisrUEVPZ3ZubDZMSVZvc2VOV21nT1pv?=
 =?utf-8?Q?jaVZWan8KlCHZNj9+ShKd7634eSNeLJPf64TQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdzbWV2RlczeFcyK2FBcDcvYWVCVmtzRDF0SFB0SlhSOVhLRlpUOHcrdEhm?=
 =?utf-8?B?S1l1STc2VFRvREtqZ1cxeWRxNU9HU2QwZ0Q4WGpTS0dGQ1VjYmZXeTRMc1Yx?=
 =?utf-8?B?OWtiQTFvY0l3eU1KckEwTWZBbjBFZ2pMdWlZb29qSWJwM2RuWDJmVHpDS0Fm?=
 =?utf-8?B?aFdwNWMzZlhxOFV4ZHpSU0RuZUFBQ080M3d4d2QvbnRrenFPTldMYW03aW9u?=
 =?utf-8?B?Y2x3WUJLc1Z2QXlkMWcwVnBqL0RFKzlzdHc1SjBSVndZM3lwSml0S0tIS2NM?=
 =?utf-8?B?YmhNREU0bEN2Y2xlbllZVEdjWHhIZDY5VjhXaDJoMC9CTi9iNHR4Zk1BTnFQ?=
 =?utf-8?B?ejVyZVRMdXg4QTJsYUpsT2RNN0xPK2lqdlJ2UlVhdS9JVElUcGt1c1B5STFB?=
 =?utf-8?B?aG1FNnpqblpPRWUrU05SSHpMVGtWaWhBcHNHeGV0YWZhTFBubFAzYmFBWjZu?=
 =?utf-8?B?R0JYQVlFR2JqaTkrOEt1ZlhNZkp2UXhsSmRNd1JoRlhodEw2cnNObDFaRzRH?=
 =?utf-8?B?bTZrTGRmSjRYajE5alhzNHRkYXB2Tll2eUpCek05Nmp1RmVrajBRR3dCdUdF?=
 =?utf-8?B?bW9rV1lURDVPZk1HQkdEdnptMlFnOWRGMktlUXBva3FJSHRzYUJZak1xQzZn?=
 =?utf-8?B?VkxNUVpBZlJubUV5K3NzZVlXR0t2V3hkRWY5MVdpeU1adDVpSmoxZEtHKzMr?=
 =?utf-8?B?U1d3Qm51c0M2bFVLSWltQmpDL2EzQWowNWhyQlJuaGN2b0Y3Sml5djduMDlR?=
 =?utf-8?B?bjNaZ2hBcFVEYVYxVHh4ZUxmODNoZEdQTUJtdXpseXAydExYZTU1dFdxbHFv?=
 =?utf-8?B?OC9EZnpFUG9Bam5MOHNTYXltVlFSdHhDK043RkRWQ3hZdzZTaFlXNGU2YkM2?=
 =?utf-8?B?MFZUcTdaVXY5aXlvaXVvcjE2Ukc4a0syY3Z2NDNTODlWWGN6Z1hnQ0UrRmRB?=
 =?utf-8?B?SDlHYmZQYlFJSy9VNkdlM1hwdWg4VVZ5TzhINCtBZ1liNTJ5WEhyMlpnUVlp?=
 =?utf-8?B?TlNlcStWN1EyY0pLYTZhVSt4SGV1czMwREdDQy9wb0o2VXBsSlNBR0tCVFIx?=
 =?utf-8?B?N2ZoUGdXTS9TT1JqZmwxLy9WYWtpR25GYXdZdGNGbE1yK3JoZEdIUndkMU02?=
 =?utf-8?B?TGw2UnVvaU53QTFGcC9VOTFCOHRDUXBlYXlXNkc2NTMxeXFrMlpGUFNVOFhy?=
 =?utf-8?B?UVdrSE4xcTZEM3IzVDBBalF5bHBtMXZDdXBVNHRPSGhRTDk3djJ1cGszMG1Y?=
 =?utf-8?B?OVBIV3hpa3VmT0pmVUQ5QTlLWlRwUDlrT3NyKzJ1amljakdySFVHc1Uzd3Zw?=
 =?utf-8?B?YlFtUmtCbUtaTDRJbFJkSkI4NjAvS2Zhd2loRHZqMkQzM1JLZHA3UzNJcTFV?=
 =?utf-8?B?MzJTTjR5N2JYZlhmemVkdTRCSS9MNXlUWHY3SWN4b01VK1cvNDRQRmE2ZFJC?=
 =?utf-8?B?QUQ2WitKZ3RDVk9kSHdTYkZMMnM1MWhlVExiRHBERzNadDVna1h6SWhKRjlM?=
 =?utf-8?B?SHQ2aGgyell4MW55SWhIR2RUVWd4cmtRMUhqbEdnQ2VmQUNrcjgzVzFlbTls?=
 =?utf-8?B?NjRZanoxZ1czRUk4emN4dVB2WWt4OGpDZVFMNnF3UXZiTmZ1aXlyanZrQVFO?=
 =?utf-8?B?OWdROTdZTklFbFAxSUFjYmtaakdzNkgzZHRlK1hIRkdmRmJUL1BrRjFLRFE0?=
 =?utf-8?B?aW9manE1Z1lUY0FEYVpWaHE4OWJxeVpCY0dFdldQUU9jdnE3dloyVDA0QzJF?=
 =?utf-8?B?UTMzN1EzaC8zRXFiVjdIMko0bjIyNE9yeE1tVEpNNXBKaVR3SkZqWVVuNDVC?=
 =?utf-8?B?aUhDV05xUUlJdWdaZlk4TW54T3Fhbk9rTlN0aGR3ZFN2WjhyaFMvUEpLb2sz?=
 =?utf-8?B?Z29LWGZZVjJqZUVhdjMzN2JGNWQrSGNUYUhnam5mdFQzeTRNRGMwdFBBdFBD?=
 =?utf-8?B?RHJMdkljTVdvbS9QM0FkYzVGSUh6NjcwcEhMajVFTyt4bmFNMUxnWXQ0SEFl?=
 =?utf-8?B?MmhENkNSWkZhU2tOQ3d6dXVqMWc1YzY3N1JwWUgzSU42N2NFeENGNkZGYm9w?=
 =?utf-8?B?Q3lsb1VKbjd4NEY3OXFZTkRKR0xQU0N1SkMya1hlSmNpcmM4WkRKWGhOd2Rs?=
 =?utf-8?Q?8POQPCp8zG2VUPEOBoQjXEwW8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6decd4-2c85-4cf3-54da-08ddaa754812
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 12:24:45.5707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfkEX3ZGuXdtbWVzwfJJnKZtZwWSJ6lsNjfYltuyeIWrR+A4x1hQZOdbhHtrX/ys
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
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

On 6/13/25 14:15, Christian König wrote:
> On 6/13/25 14:11, Saarinen, Jani wrote:
>> Hi, 
>>
>>> -----Original Message-----
>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Jani
>>> Nikula
>>> Sent: Friday, 13 June 2025 14.02
>>> To: Tvrtko Ursulin <tursulin@ursulin.net>; Simona Vetter
>>> <simona.vetter@ffwll.ch>; Christian König
>>> <ckoenig.leichtzumerken@gmail.com>
>>> Cc: tzimmermann@suse.de; dri-devel@lists.freedesktop.org
>>> Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
>>>
>>> On Fri, 13 Jun 2025, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>>> On 13/06/2025 11:09, Jani Nikula wrote:
>>>>> On Wed, 04 Jun 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>>>>>> On Wed, Jun 04, 2025 at 05:36:22PM +0200, Simona Vetter wrote:
>>>>> This regressed one of our CI IGT tests [1].
>>>>>
>>>>> BR,
>>>>> Jani.
>>>>>
>>>>>
>>>>> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463
>>>>
>>>> It also explodes even more trivially when logging into a KDE Wayland
>>>> session:
>>>
>>> Smells like a revert, and back to the drawing board, perhaps?
> 
> Potentially, but any idea what's going wrong? Sounds like I missed something, but I don't see what.

Oh! I now see what's going on.

Looks like the code previously had a race condition and by removing the extra check I made the race condition 100% likely.

Ups, I think a simple revert won't do it here. Give me a second.

Regards,
Christian.

> 
> Regards,
> Christian.
> 
>> I would say so. Looks like this on our CI https://intel-gfx-ci.01.org/tree/drm-tip/igt@prime_self_import@basic-with_one_bo.html 
>> And systems stop testing anything after (see eg https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16692/bat-twl-1/igt_runner0.txt ) when aborts happens. 
>>
>>>
>>>
>>> BR,
>>> Jani.
>>
>> Br
>> Other Jani
>>>
>>>
>>> --
>>> Jani Nikula, Intel
> 

