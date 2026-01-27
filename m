Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDUsA3xHeGnRpAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 06:05:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9778FF20
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 06:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377C510E277;
	Tue, 27 Jan 2026 05:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZkrIW9cO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010027.outbound.protection.outlook.com
 [52.101.193.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C6810E24A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 05:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDrZ4nGveE0vfg5bGijDXSKg7iHQbt6AmSeJOGpoAPjCo6ERe36vckXH7pGPZNuQXTfuSozwB6aNeN9yHCesOPjJgeiGJ8umwAJFbiNGcTIZM3Ke6u7WgcrZ2K0IZxPBK9NAN6CIF/lGATa4oEbM7gKYSFTyUVBg21jftEOa+rPKMB9SIZ4N0hJDPjcFZSTMvxKNqJVSz9WfN2WcnttsSfS+uIts0S1VNHQ2psc/7gI+PwAGH1Kv+WyGa645kZtlqzL7lDLfBLV8IF5dXKSzgAbAwEQhcV+ak7jiArf5/Ic/mfhCmYJpXtLBCRGJdVzYKiIKjJ8vkz2vYrXhgSQ9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CSrQDGY4onR7kJO9bL8bHeLayLV05qg622OQh/rRZA=;
 b=w1vWYFR5l+1UuJXIqI3LO8mYwwbDQu/JSGriqWKutKYHv8q+TrK7wbQc0B/vZurQgGU5dtI7Y8xKM35dAkwYhWQGCMDujl0XS8GTE+J5qgnL7Z23P3yoqze5SKkKfTDjuCVITEAnggdAAexzR+ap6OnhCFoITWMrO0QYBR1SgjXlfwkkpyKTLrrpxhU7OYFXZUzBBH040NPF30706bbEpKn8eLh+vaK/VTBVwPC8uDufIqCCBTslTKsOOuhaZNeef6rpgs84YacNSoeGDryOf2gxyq4C7VVE9P9FrZ8bq8gInaKw1K13u32i2pqiAjCpUNJ7kEcKbuSUlCD/J0Orcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CSrQDGY4onR7kJO9bL8bHeLayLV05qg622OQh/rRZA=;
 b=ZkrIW9cOYlgDgdzzvEnN2z/Q+DNg9LDpojv3VJi7BYp6z7euGItDgk+H7j+tKefg7mHoj+by9taf8RVXopN2niXsR8O5GjuH456toc/31D5Fh4JaIHhDu5F063CGVpe6/rZNtUqQrueX4Ua8seoTFVeAUX3SD1v8i0/lTEzHezk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY5PR12MB4148.namprd12.prod.outlook.com (2603:10b6:a03:208::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 05:04:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 05:04:51 +0000
Message-ID: <6467de90-7a03-4e15-a549-bc882b29d579@amd.com>
Date: Mon, 26 Jan 2026 23:04:49 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ogabbay@kernel.org, maciej.falkowski@linux.intel.com, hansg@kernel.org,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Lizhi Hou <lizhi.hou@amd.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 max.zhen@amd.com, sonal.santan@amd.com, platform-driver-x86@vger.kernel.org,
 VinitKumar.Shukla@amd.com, Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20260115173448.403826-1-lizhi.hou@amd.com>
 <176892084537.15580.12089679537024504744.b4-ty@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <176892084537.15580.12089679537024504744.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR15CA0024.namprd15.prod.outlook.com
 (2603:10b6:930:14::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BY5PR12MB4148:EE_
X-MS-Office365-Filtering-Correlation-Id: eb97e378-4dec-414a-8d50-08de5d619a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M25CS0FyK0M2ZElXSGVIMThqT1lqMjR2clZXbFFWSnZqY2djUldDVnpQOGx2?=
 =?utf-8?B?WTAxSWRicm04Q0NFaVpLaHAraE9pVFh0ZnBDUFBlMm9Ua01xMklHQWh2djY4?=
 =?utf-8?B?dWpCaWpXQ3RTWFFGQzZWRUFhN09wMDh5S2hwajh4a001Znhsd3RoOTc3V0Jq?=
 =?utf-8?B?c09EVWlGZnVWVzNDNlQ2cklTZWNiaUFmQ1lsVUk3MTFFRGFCdzJNcE1ickVO?=
 =?utf-8?B?bHVDWVBzM2lDNkR3TW9ObU9YUHF3QmFnYndUNlhyWUE3eDFxOC9RNWp3M0tI?=
 =?utf-8?B?aGtKSFNMZUdWNU4rVEQraERFQkJBVEk4K292b3hBbGVQeWZhSlQwdWlYZEpN?=
 =?utf-8?B?cmVOMS94ZklHSmJGd3dMbno1bHJRZUw1SHdNOTNDQ2Q2akdCZml4M2l6blc2?=
 =?utf-8?B?T0QrOFZ6MEZsWnBwc3Y4QmZUcU52WktBTzFoMWNCa0NkKzVnU1R0RHJ6cFcy?=
 =?utf-8?B?M3hZancvRUkwa2ljdGRydjFDUW9uZnlUUndrRU92OG9VR2JjUVE1SVI4OXQ2?=
 =?utf-8?B?T3BmeWcrTG4vQzBlZ3hmMlFOVmJ0K1BiWGNLZ1dJbGZncC95cGNmbWtDVGxu?=
 =?utf-8?B?Y01sTUt0SmhPWHZlL0ZRRlFqQnA2NC81bFlVTmwrd0JQQ1kyMFJlYW5TR0w1?=
 =?utf-8?B?Zy94eFFrWC9ZbXlkQVVPWE5lM2xGNGZoanRXWXVkUytTWEJQSFZEZzIvZ2Zv?=
 =?utf-8?B?TGZhcTJRLzMySlg5QmFwQVR1cDB2ZWZIaGcvNUo5QzdzVmxpaUVIV1h6U3Zl?=
 =?utf-8?B?ZGp6UHEyTmswS1QycnZwZ0pPdjc0U3ZMQURSbC80R1NvNENpOEh3dnlqb3pG?=
 =?utf-8?B?QlFWYVVmdDA0cjVtcitTZ1oxeVh4Z0V0UThWOTZ2Z2ZvZ3ZFbzNaaUNLVFY0?=
 =?utf-8?B?dVJzTDR0YnR4MkYyUzQ4QVB5YUlmaThhSjUzdlE5c3Rpb25DK0hGb1hKUDZ0?=
 =?utf-8?B?SWVmSXFLSjBDOU5NWFVHZ0RWNmZxVENNbUlFSkViL2V1bGxiUytUbktLRHpD?=
 =?utf-8?B?bGtnVzVSTnBLOUJvNjY3V3g1UmtzaXBQeWhHbVVZeGJaY0dFdGE1b3dmTENa?=
 =?utf-8?B?djVUd09OdWdYajN5SVJlT3ZDWmhWUWU1Y09DUnF6RUdOS0dJZ2Q0K3R6ZjN6?=
 =?utf-8?B?VnFYdy9CcWc2SkRwR2lNd2EyUzlkRUpXNnBjendrVlltNFRxakJLY08rRURF?=
 =?utf-8?B?VkRYb0hyaTF1RnJiWlJmUFV2d254TzAvOWZvdWM3ZTEwcWpZeDdhUG83Nitq?=
 =?utf-8?B?cUlVM1k0eGN1cGtHdG95VkFqMjAzY0g1ekVqRHN3dUg5dU50ZXB0MFcwekJj?=
 =?utf-8?B?aXcvM1RQU2o0aUFESEFnK3QzVzI1L083U2ZWZDd1cjhGUkllSys3WWNZeEFH?=
 =?utf-8?B?YzZyajZ6R0JmWkhMUFRXbElRNk1ybUhhTHZyUjR3N0pXUXdVdzJnQjU0VnZI?=
 =?utf-8?B?N1lLN09ESTVJSlRMYzFQc3NUc0tCRW9BYmtMM3FDQUdjaU14MUs5YTFxQ0dZ?=
 =?utf-8?B?Nm5TMFVCSEtVVEN1QVA4dTJmQitPMmZLNEhlYlZldE5hQUoxWTN4aG55NDBC?=
 =?utf-8?B?VnZnaExUcEhIL1N2VG8xWnNBaEx2UTR3QWNEVUZVWmdESFJLMkRBVElBZFdK?=
 =?utf-8?B?dDd5TzkxdG1mT1BLUEJJd2JKWHA5d2hzWkZ0NjZqcmw2SzRNamF0S0lQSVMv?=
 =?utf-8?B?WWRBbWt1RXNRSnlBVWRWb2ExcXVzc3NweUlMTHZmQ0dDSnYzdVFUa21qZnFL?=
 =?utf-8?B?aVM3STloSld0d2FhRmhDcDNaUk1mcXNnb3pDQTZLcmdvNmdWTFFTN085a0JF?=
 =?utf-8?B?UUJxdDVXb3k5T3ZKbHNsQnFDOEplSVpSVGJzaWxsREl0cUU5Mm4wWmY5MTNF?=
 =?utf-8?B?NjFjSVEzaUNRd1lTZ3NyNEx6M0ZYQWdGVnROdjJBWmlXWGZXbVBkUW5pM1FL?=
 =?utf-8?B?aU1EcFhka29ub3VCbVF3aUpoOUJGdVNybzRTQ2Z2dW5xRnRHSzlQSnN1djhm?=
 =?utf-8?B?NFd3eStWQys0YkRmNkZtVXhnaU5pL0RuQmRMU1dHTVhFcXpEdXBkcHJMQWN3?=
 =?utf-8?B?ZVFneFk5RTAvaThTWm5zcHlSeklYNktWY3pYZ2dGVnZIK0E0VytRZVQ2djRu?=
 =?utf-8?Q?Pps0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0hnVWE5UjJvZWNUR2s5Uy9DeExWdzBUbUtxdFlpdUFhY0hQVFBPQmNzSytP?=
 =?utf-8?B?bkVmWi9mQ3p6Mmg1cUxwTVpqM2M4eWlyQThSbjVvREo3MVV5dC8wSStCMjFw?=
 =?utf-8?B?SVpKcXErM3FJdzgwWVV3SFlyS2k5dkdSbzFXZmNTR2JjK2FTSmJYMnhIN0ZH?=
 =?utf-8?B?ejE1ays0U2xydk1GZmhFQ1YxTkJCOTJmcjBMVDV4T0k3ZkdEcDBMRldVTmFm?=
 =?utf-8?B?b0pUZEdwT3BicWVhZG94OU9xc29qcnU4eTVHTGRhNzVlZWpxTndwVkdrVUlX?=
 =?utf-8?B?dGJLbHpzNitkdTh5TlhJRVpjMHVOaURFNXBwZUE0aFlnS3cxN3ZhSUc3aW9m?=
 =?utf-8?B?WXdEOThZQzBmREtiR0l5Wi9ZNXVtcTVzWWw5MkxWSXdkSmIwbDFkTzMxM1Q1?=
 =?utf-8?B?TUFCaVlRNDJULzBzMUpXVk8zQkl6RFF2MmEvNzZPM2trNkllUGhYdGJtWWps?=
 =?utf-8?B?SXNWc0NQWUkrQTk2ZHdSNlFHejZidGVOVFdhRHNZQk5JQkFpeGxDSHZpQWhO?=
 =?utf-8?B?ajE4cGgxYS82dkJVaytRQzhtZkkwSThuam5hRWpuRUJGaVRyNE54cHFGYUR4?=
 =?utf-8?B?M2NSbmdhaFVqczhKenR6di9jUklheU9qUjVDcC9iK1N4OU5EUVBnMFRFbUVZ?=
 =?utf-8?B?QTJ2VUF0YklUWG9EZ0c4UEllMmRmMk5WVVV2KzhjMi9OM3BiMUQ2NG8xL094?=
 =?utf-8?B?ZCtFeEd1OUcvVzJQeHl1SHkxVElCV0FORHlFWUlFRlhXVXBvN0ZzOCthOFdp?=
 =?utf-8?B?dEo2UTVxZFNyejZyMXF4SFB5MWxsVFIyYjB0dVRxcnZhbXhPb0xWdXlkUjdL?=
 =?utf-8?B?L0RDOEZXek5sc3dFNDNyb3lpRHY2RGFZVkh1aURoKzZWZnZZNkVtWTVHZEMy?=
 =?utf-8?B?cWo3UHFIUHZjYXE4Qm1jbysya0N5Q1d3T0U0ZHV1YXdKbkJzeVZxcUJ4Ymov?=
 =?utf-8?B?TFlKSURpNWdYR2JOZ1grZXJvNHl6b1E4aENSUmRqaWJZak0wOXFmYTJQbDF5?=
 =?utf-8?B?clN4MFZ3VnlWWWt0eVhqNk9PM0tmbVQzbGV5MktvZllvR000eVhJazBibW1p?=
 =?utf-8?B?Q2MrNTFveFVKcmIyaDJmaEJuM0J2Y25wVitZcndVOUZFNmNDZ2d2NTd4bnA5?=
 =?utf-8?B?U0R4MllMTHo2ajNXaHp0dzgxK1ZuRU1jUENjeDFNU0FKeCtxSW15eFl4L2pt?=
 =?utf-8?B?cldZWWFZN0xDalc2dU5VTldoTWhEMFFnN1p6dHV6UzJOb3A3UVlmdFVxeTBq?=
 =?utf-8?B?MGl3cSs5bWFqMEZxTGJKU2o3V09hK0pUQ3lYanVQbzRjQkhqemVtQnJZTkQ3?=
 =?utf-8?B?bStxZDJ5ZE54VkpPN3R2UFdzTzhMc0paQ25nNUU2emd1ZCtxRVFvMWpaRVpL?=
 =?utf-8?B?UEszbjA4WnlzOFM0SHp1RUtkQk1zMmQ0L0MwUWZvOThONCtpZVBHWk1LdCtV?=
 =?utf-8?B?bkdSYldHOUgrdzVlNkpxUkRXMWhTL0hza0RqaWhQNWluL05IRlZKNnFwMWo5?=
 =?utf-8?B?SnNaK0ZNV252U3NRSk0wUDFFNWF6am5TQ2VDS0Z3QkVrQmJ2c0E0clk3bHZu?=
 =?utf-8?B?Q0M3Z3p1QWJkcEQ2cGI1cHZkbnQwODBXN3g3WC9panRTZUd5c3BNQjh1N2Vk?=
 =?utf-8?B?NU0vSE9XMTc5bWl5Z3FzTGtVUVRuQ25HMFp1WGJDME4ybDdoQlJwQzd3ZlZi?=
 =?utf-8?B?ODdReWhwUEVwOW1Pc0dPSlNNbWNRbE02UnZRVWxZVEVBeVFnSE1JYWJaVXBM?=
 =?utf-8?B?V1NpODJidThmRXAyenFsbW1CeElQQU45VWFkN2ZUMHdBdVNjcGJLMnNTamFZ?=
 =?utf-8?B?ckdRNkxNNTl3bDN6bTN1dDFoeUZDSDhnczEyUlM2UlpXNGZ6L2J0K3EzanJx?=
 =?utf-8?B?T1NidmIwRExwdTJ0ZllqWkdzeG81K2toWkVyOHhzN0Nhckt6SDJ3NXhheWxw?=
 =?utf-8?B?WjZIOXRMNllNZ1ZqNzdhZHpyU0JiaG1BeE1HcXE2clZseVFqdjFoM2s2WnhW?=
 =?utf-8?B?L0l1OCt2Y05HQ1c2YmUwYzduMDUrcC9ZM3dzd3NDb1B6QlhyVlZBeTNvSS9k?=
 =?utf-8?B?azFHSC9GL0pzbnd0N3F2RnorREJyeE5xOTlxd3FqU20vRUJBbmo1QVFkTERn?=
 =?utf-8?B?SW4rTGMyVCtkMDJabUJ3c3lFTEhmQTI2NkVuM0lKR1JxVDd2TUFpSGFGQkYx?=
 =?utf-8?B?RWQ1cFQ2WGY2MWZvRlZrUHB0UlJLTW9sUnExRlRJb3hyMjBkbUtIcVBDRWQv?=
 =?utf-8?B?SWh2OFhuTUtMbUVudGx2dmN3anRMdVJvMHpQeU9weW83ZXpJdm0vQmRvMW9D?=
 =?utf-8?B?MG5GSlJoT1FDck9sUHZNL1RKMWpNamI5UzNhMkdIOHNrbGRPMVNZdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb97e378-4dec-414a-8d50-08de5d619a12
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 05:04:51.4678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2qF2cVOme8mPAPbg+dscOZMtADas363kTCv5Q9pKJA7gzVUsjg7Zt1pZhs/aMYQsQnMe3eJaIMOsRlTHtHknA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4148
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ilpo.jarvinen@linux.intel.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:hansg@kernel.org,m:jeff.hugo@oss.qualcomm.com,m:lizhi.hou@amd.com,m:Shyam-sundar.S-k@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:platform-driver-x86@vger.kernel.org,m:VinitKumar.Shukla@amd.com,m:Patil.Reddy@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 5B9778FF20
X-Rspamd-Action: no action



On 1/20/2026 8:54 AM, Ilpo Järvinen wrote:
> On Thu, 15 Jan 2026 09:34:48 -0800, Lizhi Hou wrote:
> 
>> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
>> interface to make NPU metrics accessible to other drivers like AMDXDNA
>> driver, which can access and utilize this information as needed.
>>
>>
> 
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
> 
> The list of commits applied:
> [1/1] platform/x86/amd/pmf: Introduce new interface to export NPU metrics
>        commit: 15e19bd95be5c79f2f98b727edda002ba86f8d03
> 
> --
>   i.
> 

Lizhi,

One clarification.  What about the XDNA driver side of this change, are 
you still going to do it this cycle?

If so; this either needs an immutable branch from Ilpo or that side of 
the change needs to go through pdx86 as well.

Thanks,
