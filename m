Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C556B06915
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 00:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4633110E6D8;
	Tue, 15 Jul 2025 22:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Zfb2m+22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320C810E6D8;
 Tue, 15 Jul 2025 22:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mc7Q7RX0MFt6FNXmuJCpepIdt2FmltFeQWZdfe/mguMIVBpnmcc+0Of3PkGaQ36+vbEaILGDotzXuyEPF0DJoUH5XmUS/s27Nw1VwvgFWK8JcKiqPw2S3H04EqJeQnGMYz05iyns5Txgc/FY/pcRUeGsTLsPDSjDinQutt/XYQq9x9x+ytGSFp3P+BJZbqBsetCCjocm0dPmq0V6MByPd8JdtCtZ7Y9BdUaoJXlr3QjAAcU06zyc1kzcgsanx144popCaiHjaNJv20JYfAs8G/4/BTUTMu9j8fZGm9c0eeLnu677CncRyDQiHdVAONEC58SZx0jZUss8susmgxR7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASuPF/Kdy9dTKgN7KwvM3BOmLDqnuq7qEDWSYoewLUc=;
 b=TrtqRK3YPRzYivKE4++38Y8yKwaQ94AqBwrPsnuCo0PwVv7lV03EeqUbu0wes9TZ8vSvRjf+ihs+9/46CJqiqa+tJjEL+Ld6y6IIoXa7Fk3ES1wh6yYDXSFX5k3hy0TWh12I5ME3gkM5JRDCrdYGvgmKgczK+9lGgWueFugldoytT2nZCstrPvaDKQ9aDP7mkN56J0vKII926RONSyW+UcPUHGxan+asAxWAA5gj6cIbTbgF46bdms5Amp0UVvqeC6vPpEc8r75MAtxMmPFIkoBxBnzdHNtYAZ4F0coRP92lvDtziDkm/UMaN7oz9LvBAzPRMhekeZVt8Wy3/ycVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASuPF/Kdy9dTKgN7KwvM3BOmLDqnuq7qEDWSYoewLUc=;
 b=Zfb2m+22hNLmlqsVTFY4ixMHdY+4wi8G2LHqyYpNFKfRCJW5JTwT5V6eChy+Si0LEeCKVouNq/Yaj5bxbexHHDfJue18XuVXpYUMMXeOIfXmgIVjsVJbizOw/SO7ImVyYBREjzszFZq5bVumfvs7zmf9k9xXhETPoj3qi3GsXNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 15 Jul
 2025 22:08:24 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 22:08:24 +0000
Message-ID: <9286cee8-e088-4567-8e3f-cfc47d9bf3e9@amd.com>
Date: Tue, 15 Jul 2025 16:08:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>, "joshua@froggi.es"
 <joshua@froggi.es>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-34-alex.hung@amd.com>
 <Mk2DCOdpZ75QLmGiZYM8GfnoMHRIGsx2S0_gzq2ryBHKEfLQMP5ArB3s94s8NYyci5xYBPN1md01QaUOqqlwKb3KxJIBRxMLO9yjoitMVJc=@emersion.fr>
 <9e116b0d-c46c-41f5-a953-7d17d22c98c5@amd.com>
 <SJ1PR11MB612940940934BD8499DA179FB957A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <DM4PR11MB636083B3C1D1AF7690DE87D1F457A@DM4PR11MB6360.namprd11.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <DM4PR11MB636083B3C1D1AF7690DE87D1F457A@DM4PR11MB6360.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW3PR12MB4426:EE_
X-MS-Office365-Filtering-Correlation-Id: b20b5148-975e-40a9-3f7f-08ddc3ec1dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXFEcC9TVFBndnRKY3BBVnRpMkhkSmszVWk5N1cxSEwzOVFwYThsdXBjTTJQ?=
 =?utf-8?B?b0NlVzd0WmxCbkZHNVFoODliNU16bTJ2K3ZsZXk4aGRxS3lFM3NwMTBDVm5R?=
 =?utf-8?B?Vm1kckg3aHZ5WGNDWTRDQXN3SnZuRysvUjVKNThNcDdld1BiVDVrckRlM2tI?=
 =?utf-8?B?cFl5RWRVZ2Zzb25Oa2E0Vk00UjZMck1JWS9yTmdRbThaeXgxODM5QnFCMGZ0?=
 =?utf-8?B?c2hHTkdNeWpJU3lYeVFkSjFQUmRhUTRVb0EyaXlvdlNqS29mZFRGcDJFWklj?=
 =?utf-8?B?UmhIdEo1QmovQU42SVAybFR4emxiZXNKRUkyMXVUUkZjNE1WWDF2Y0pXV1hS?=
 =?utf-8?B?VTdxbDRQeFlKd1E5SzZHcFpaNFp2RXZxeEtpbW9Jck5UTG9sYStScUh3anZl?=
 =?utf-8?B?Mmp3K2h3MEd6K25vL0N4SjV1dWNEY3Y1bVZ6NGZtK2tOa2lzNjdEWFAwbnJh?=
 =?utf-8?B?ZEVhYTVSNzh6VnQ0Ukd3ZzI2ZFZKYmk4ZnBXUGZNMnJOUHNxSDdqdVFVNGlF?=
 =?utf-8?B?dVVKdEtNa2dQUkx3S29EcjFWRXNyWkpJd2VwU2wvOHlqQ1BlUWROZVZGb0Ny?=
 =?utf-8?B?SURQK2xQb05YNjRncDVLY2VTSGtIcnRwVGo2UHNpTDFsdDV3eTRhN0tEK2ht?=
 =?utf-8?B?cWtCalZreEhQek95dnlkVFRsYlJkVFI5RmJwWVNBeU01dEc1MFp3aDZVRDNP?=
 =?utf-8?B?M2tKZHJEd0xvL0Vhb2xJNUVjemh3WDFubGJObE1HRUhnY3kvUUJSU2xkcHY3?=
 =?utf-8?B?MWQ2VmY0NUROb2x3a0laWUEwTXNkd1ZGa0xMaWh6R2ZpRWpvVEdvYmN4aW41?=
 =?utf-8?B?SGhDdHZ0Q1N3RzUzVUpvbWVnQ0RDRnNnRW9wcGtZV3l4aUcyMFFUelZzNi95?=
 =?utf-8?B?cGR2dW90R1dpcEtETmdIMjViM3lIcVd3M3ZLUFB4QnMvaVF4ZlAwODFaYmlB?=
 =?utf-8?B?WDJ5Z1NMblZjRjRIcXlhZnQxNUx4VkFiYjVSejdobEQ4RDRNWHc1VE9uSUFP?=
 =?utf-8?B?ajF6UXlpZXZtUmtnREhxYzRhNkZKTmhoT2JZaGVscEllT3NQSU51UWR4RG1T?=
 =?utf-8?B?MVcwdGwrS3F0d2M2N2VFaDNKYzNFeXZjRk1sUDNBU1lDbzM3TWZWbDhrUHl5?=
 =?utf-8?B?b0oybzIrMDA0aUl5enJjaGtLQ2VWcWtqNDVyVklVR1o4K3AyS2ZxeUJHVktC?=
 =?utf-8?B?Tk1GcmZBY0lHSFF5eE0zNW1DSkJ3aGxueGZOa1ZMV01UZjdoSDd2QkZGK3hX?=
 =?utf-8?B?VW1ITjJEa25Hdng4TzQvaHFCaW5IQTRsUXJiaENWaUsxMkdScy9WWU9KSjJw?=
 =?utf-8?B?aUtXNzRHWC9VY3lSRXU2cGZxSDRzWTg0cUl0N1NhVjRBU1pQZkl3Nzd4YWNx?=
 =?utf-8?B?TDVKS29sN3NuQXZWczZKNG9HcitlL2s4bGlGQzNkLy80Mkc0eWx2Y2p3dmVC?=
 =?utf-8?B?TTR4YkhsWmJwUGZhN1NacjZSU2k4b0YrRnhVN2s4Qk1KUWo2NFNTaVVLN3BD?=
 =?utf-8?B?NnZxejhLQUk3ZWhWQUJ4U25EOXcxSUo0N2NUZHU3N29ZdnRKVk1ydzF2T2Nj?=
 =?utf-8?B?MmFFejE3R1dURExMNU0vR3VQWlc5cVYzaDYzd2J3QkdnNFYxYllITkdtVkpP?=
 =?utf-8?B?RnJXaGRVY2NucEJmbi9GTm5IaFFUcFp4a0h4V0tweVdJeXd3aGJLbDdQQlZp?=
 =?utf-8?B?NVZqVFVrbytGZ3JmOGRKYW9nc0pnRFVvQjhMektIVFpNd1NxM0NmbWtOUHRu?=
 =?utf-8?B?cmRLd0tDN1ZhU3JtYjQxTjVsN0tYVFBoK0FBUnc4cFdJVGNqZHVzVmlDS2t3?=
 =?utf-8?B?NTlyaWhhZzk5TFhpaXpla0lEYU5hYUZxazB4Qk1ibE03YTFQNnpsYmRjQWhm?=
 =?utf-8?B?WDkrK0ZWZEtsVzZaSm9LcmQ4WllFbXAwdU9JT0djWS9vQ2srYktYb0dGZnFM?=
 =?utf-8?Q?aqmnz0m7wDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWU0bVQ3UVhCOTB1Wm1acm9oTm1SWUdDRHdSTm5oNUtXcHRlMkJhOFNBNGxH?=
 =?utf-8?B?aVRSYlpFUVk4RnlTRnBIWnZWb3hwN09uNDBvVzRHeUhFUHV4cTR1MTFqRWFt?=
 =?utf-8?B?OWRHSHNxeGZXZVNLTDVhMXkwS2NhaXFNMVhiTVZoQnZkZmRUTFFraHMwVEo2?=
 =?utf-8?B?TVY2NHN6amllWk5KNWw2bVNYY3pkNHpsdVc2djF6aUtlS09nQUU1ZVZ0bzJl?=
 =?utf-8?B?bnZLSjBZT1hUNFhrTGZ5YTBGMTFkUllyZlhUVGVjdHdZVDYvTmg5NWttcWl5?=
 =?utf-8?B?NTVxVlltRTRzYjhOdi9ucEsxUzVDZFF1S1JNMWpMeSsvSDlpL0RvbEkwaWM4?=
 =?utf-8?B?L0cxeUsrNTRjNjZnR016MFBQNGtVWDVpOGt4dUd4TWd2Um5sdEY1OFQ1ZEln?=
 =?utf-8?B?TjRBU2xESi8xUm02MHF0c1l3bG5ZUnY0M0ZaaHVFcWZudTJMK1ZuTjB5V0tX?=
 =?utf-8?B?S0VHQ2FaNHJ0b0tSZ2xudmtIWDBRL1FaOWk1Tjc3TG0rMXRqZFFXWTR2bW5q?=
 =?utf-8?B?QXVCeENiakVmOVYxTm1oNUx3OUlPSEI2d3llYUQ3cnV3a2lOZXN3K2pyVVVN?=
 =?utf-8?B?dlBzNGMvWllIbjlDQi9IUkp5ODlpeUJ2N2lCai95N3pYWVpXZkJRSlZISEhM?=
 =?utf-8?B?T2NTa0NsMk9QZFpwYVl5Qy9YUUlJSTBTNlJIM2NPRU5XTmxOWldVRzJKbzhQ?=
 =?utf-8?B?N3JvMFlreU4xTENsN0wra0xBTXppZ29TTEhSVy9ZK2wvUzlSYW5DUHBzNGg4?=
 =?utf-8?B?NW10SXVSVk55aGRUSXdqSHovNmhBMDlhNEluc2dxMjNweXhIYkdLanA1MDJF?=
 =?utf-8?B?Wnp5ZjVpd09sTTJxbGZSVmVERk9Qc3Y2aTRhZUVRQUtBVVhtWkZ0Yk5RN3d3?=
 =?utf-8?B?Uytxd05PSnpXelhNVHhwVzNnZzlsSUg0MUVBNFB6SW9rSzJvR0NuWThQQ1FT?=
 =?utf-8?B?ZHB6YzFWZlF6NEVmUVp2MGZ3NVRacXdyR1NXbm1OcW1qQXNkNjM3YXNORVk5?=
 =?utf-8?B?NjBZNTR4emdYVW5rZ0I5Y0NGMW16REtNeFE4L2hpOHFoUml0cG14cXF4NkM2?=
 =?utf-8?B?bEduWDFOdjNWTnNBRVZOcHZOaXZINHZjcVhrUzdCQlN1TmxnQWFGWUxkejF3?=
 =?utf-8?B?eEQvUS9HekU0cTFxRzdMVitlQnVqQ0VHMGl3SUNxNjdxYkJaWm5pN1R3bFJC?=
 =?utf-8?B?QmtuSlNWRFZ3M2psenBrKzIrQzd0RDdpdFdJUzlMSGFMcjBieEcyYUtTZTM2?=
 =?utf-8?B?d1A4aHJRMml1eVQwcy90bEl0VVB5WGFTR2xuWTlXUWRsN3FSeWFuM1JwVUJu?=
 =?utf-8?B?ODVLMk1oVEp4VnhGUndkOWc3dzBPRlZ3U09jWnQ1V1dwSnM5M1FkMUl3WGk3?=
 =?utf-8?B?eWRNUkpLMjF3M053WmdVS2E2ZzZuajU0QjRjNnpWSmF3NUFiQTczV2R0TlVv?=
 =?utf-8?B?SHpKZjRUNG1raDZQNXBVNkNOVFpZc1dmdXliSlo5V1J3ZmxJVlMzZUZpd0xu?=
 =?utf-8?B?Z0VkMWZVYkpYdWRUTGlmQzFBNVNVbTdyRE1BbmF5S2gyV0FablNuWjJkMzFo?=
 =?utf-8?B?dDgyUlRsUzJsZEd3T043WTZTdE95cFp1UGlhYzRTb1k5U2xIM3ovdmhCbHJX?=
 =?utf-8?B?MkQwSVF1U09rNDBTWHpGKy8yUitWbm1JZnBYY1F0R1lnZXZzVm9JQ2JQUHZY?=
 =?utf-8?B?cmpPK2l0aFp5eUtDWjVMR21iM2RXL3VTK1BMOXorUDNyajhZTkptSVJvdlJL?=
 =?utf-8?B?WTVrbkZ3Mmt1MjhHemFja0cvVmcxU1JlSmp3OXphWUZ6Yy9mZytBL1lOOFZ5?=
 =?utf-8?B?S1h2by9HdmNFMGxFMjFlVEJBUTRjVG9XcHQxSDhKSlFVVUliU05BZEJ2NDVy?=
 =?utf-8?B?T3h3dEFwZWR1N2doTjhsWFdaNHg2ZWFzdXpvQkh2QlBDMzBJUTRIVnlRZ0cy?=
 =?utf-8?B?ZnRLYVNHUkROUzB4VTZDRVZiSFE1UXh0Qk84Rzl0eFFMb293M1hoUmhINUo2?=
 =?utf-8?B?UnhxQ0FHMWxKMXdtbmhjUHdOUDEybnB5SmUzSE85WmJ1ZHBVbDhENFNmb256?=
 =?utf-8?B?cEIwSGtwaytzTUQ5dHViUUN1Qmp1S2RiMGlUUlZxRnRqQVdKT0N3dmpIcXcr?=
 =?utf-8?Q?UH38zog6sYgB6AALC5KHMNE3P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20b5148-975e-40a9-3f7f-08ddc3ec1dd6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 22:08:23.9734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDwfPWF05jKU593pKVP1UTOyKNdO8j1HZaIz513B1K6qrrafmddizbrK4n8jgoJWpk+rRgcyK+xueDh0AlwkIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426
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



On 7/15/25 01:44, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Sent: Tuesday, July 15, 2025 10:08 AM
>> To: Alex Hung <alex.hung@amd.com>; Simon Ser <contact@emersion.fr>;
>> Shankar, Uma <uma.shankar@intel.com>
>> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; wayland-
>> devel@lists.freedesktop.org; harry.wentland@amd.com; leo.liu@amd.com;
>> ville.syrjala@linux.intel.com; pekka.paalanen@collabora.com; mwen@igalia.com;
>> jadahl@redhat.com; sebastian.wick@redhat.com; shashank.sharma@amd.com;
>> agoins@nvidia.com; joshua@froggi.es; mdaenzer@redhat.com;
>> aleixpol@kde.org; xaver.hugl@gmail.com; victoria@system76.com;
>> daniel@ffwll.ch; quic_naseer@quicinc.com; quic_cbraga@quicinc.com;
>> quic_abhinavk@quicinc.com; marcan@marcan.st; Liviu.Dudau@arm.com;
>> sashamcintosh@google.com; louis.chauvet@bootlin.com; arthurgrillo@riseup.net
>> Subject: RE: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
>>
>>
>>
>>> -----Original Message-----
>>> From: Alex Hung <alex.hung@amd.com>
>>> Sent: Friday, July 11, 2025 9:59 PM
>>> To: Simon Ser <contact@emersion.fr>; Shankar, Uma
>>> <uma.shankar@intel.com>
>>> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
>>> wayland- devel@lists.freedesktop.org; harry.wentland@amd.com;
>>> leo.liu@amd.com; ville.syrjala@linux.intel.com;
>>> pekka.paalanen@collabora.com; mwen@igalia.com; jadahl@redhat.com;
>>> sebastian.wick@redhat.com; shashank.sharma@amd.com;
>> agoins@nvidia.com;
>>> joshua@froggi.es; mdaenzer@redhat.com; aleixpol@kde.org;
>>> xaver.hugl@gmail.com; victoria@system76.com; daniel@ffwll.ch;
>>> quic_naseer@quicinc.com; quic_cbraga@quicinc.com;
>>> quic_abhinavk@quicinc.com; marcan@marcan.st; Liviu.Dudau@arm.com;
>>> sashamcintosh@google.com; Borah, Chaitanya Kumar
>>> <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com;
>>> arthurgrillo@riseup.net
>>> Subject: Re: [PATCH V10 33/46] drm: Add Enhanced LUT precision
>>> structure
>>>
>>>
>>>
>>> On 7/8/25 11:10, Simon Ser wrote:
>>>> On Tuesday, June 17th, 2025 at 06:26, Alex Hung <alex.hung@amd.com>
>>> wrote:
>>>>
>>>>> diff --git a/include/uapi/drm/drm_mode.h
>>>>> b/include/uapi/drm/drm_mode.h index 651bdf48b766..21bd96f437e0
>>> 100644
>>>>> --- a/include/uapi/drm/drm_mode.h
>>>>> +++ b/include/uapi/drm/drm_mode.h
>>>>> @@ -872,6 +872,16 @@ struct drm_color_lut {
>>>>>    	__u16 reserved;
>>>>>    };
>>>>>
>>>>> +struct drm_color_lut_32 {
>>>>
>>>> Subjective nit: I would personally prefer "lut32" over "lut_32", but
>>>> that's very deep into bike-shedding territory. Feel free to ignore.
>>>
>>> I think it's a good idea.
>>>
>>> I got this from Uma's patchset. I will sync up with him to avoid
>>> future conflicts.
>>>
>>
>> Just for the record, we took some inspiration from struct drm_color_ctm_3x4 for
>> this.
>> That said, I don’t mind the bike-shedding — naming things is half the fun anyway.
>> Happy to go with lut32 if that looks better!
>>
>> @Uma feel free to disagree.
> 
> Yeah, Agree. Also Alex, you can make the change and have it as part of your series.
> Let us know if any help needed.

Sounds good to me.

I will include "drm: Add helper to extract lut from struct 
drm_color_lut_32", requested by Chaitanya, and make the changes from 
*lut_32* to *lut32* to both patches, including the struct name and 
function names so they all look consistent.

> 
> Regards,
> Uma Shankar
> 
>>
>> Regards
>>
>> Chaitanya
>>
>>>>
>>>>> +	/*
>>>>> +	 * Similar to drm_color_lut but for high precision LUTs
>>>>> +	 */
>>>>
>>>> Instead of this code comment, would be nicer to have a proper doc
>>> comment.
>>>> In doc comments, "struct XXX" is enough to create a link. (struct
>>>> drm_color_lut doesn't have a doc comment, but has been introduced
>>>> ages
>>>> ago.)
>>>>
>>>> "high precision" is a bit subjective, proibably "32-bit precision"
>>>> would be better.
>>>>
>>>>> +	__u32 red;
>>>>> +	__u32 green;
>>>>> +	__u32 blue;
>>>>> +	__u32 reserved;
>>>>> +};
>>>>> +
>>>>>    /**
>>>>>     * enum drm_colorop_type - Type of color operation
>>>>>     *
>>>>> @@ -879,6 +889,7 @@ struct drm_color_lut {
>>>>>     * and defines a different set of properties. This enum defines
>>>>> all types
>>> and
>>>>>     * gives a high-level description.
>>>>>     */
>>>>> +
>>>>
>>>> Nit: probably this extra newline should get dropped?
>>>>
>>>>>    enum drm_colorop_type {
>>>>>    	/**
>>>>>    	 * @DRM_COLOROP_1D_CURVE:
>>>>> --
>>>>> 2.43.0
> 

