Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF0A27673
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD9810E6AA;
	Tue,  4 Feb 2025 15:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aCcWbgKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABE910E6A6;
 Tue,  4 Feb 2025 15:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6Hiu9XCCO8Za/ap1pGd1E363aEXHZYmV6uCN3bNIbJ/Bgg1Cgw3xqO4k8SEpNqPoA/WhmboB1Ftg/2FrAQuKDd3kdZ3ElW+f/QtnshJ7lnCGL+ec0S3/aW1GMcPsKEvjzvzESpx9ocoykhvn5rjGfQP16AEv4ncDZRvmHJKA71SDL+i9K/SHNvmuOTFPaWDl90R/C7Huo99HFzN3pDFaKkc+vuPZphCr1M3hrfJxAW5/Um7/Mf1txfmx7JCXlwU6h/mIW4yCTe6mipPvxvRZAjWwgGvFq2fC+0vHxXzq9FDbjX9BZW+d8Ge5bsM7ypXGcZLWwykRuC6tG2ska/6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah+5evfng1jcbtO32cUURgOENmfka1Y7jik/NrOn2v0=;
 b=LIA+nsFYkMxCtlsqmTbERQnEvr5Vcgw02PxYoJ8ikf7TmX/KOahmIXO6wAS1erY9U8MgHLStcg9NyUUKo6FUaYhGv/6Nn1PET+BOjfIiLgYNqyIJyPnZXIygDEDThuu6a0/3WF+yvD1oR7vGdV4zCIScEXaJic/smKQDoRAHVIcwvbRH9/S7cg/ncvkVVzxj9S88JaHdk58fTxJ+x5KJST5OCTuVu+NUHXfzfRyUQVcMzOf0HM2AzIPm72nOa92lKn/8fThAX2kumS/X99VrReyIHEqp18K+pNQeZrmIF04a0vKMQnFSUPEVU0P46tjDCswT7O5QoLC8n5SlZLFMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah+5evfng1jcbtO32cUURgOENmfka1Y7jik/NrOn2v0=;
 b=aCcWbgKI5O2dpjjCHbKbrfesB8zipB5xs5brazMX5vM78rR6Kd0msDoHrCfY7Wp5MzwOPo+NbhL8KaVfPJn31tGum9Wbp/rtqCqI+au/97t0t6PPAl4aTtk/O/7Honcu1TNUJEGY9IpoVQ8xKt5xTxUhWNnYGWP/e3L8ZAGBw0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 15:50:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 15:50:39 +0000
Message-ID: <5d705a69-3655-47fd-a512-06b98c4dc67b@amd.com>
Date: Tue, 4 Feb 2025 16:50:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/5] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, alexander.deucher@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, xaver.hugl@kde.org,
 pekka.paalanen@haloniitty.fi
References: <20250204070528.1919158-1-raag.jadav@intel.com>
 <20250204070528.1919158-2-raag.jadav@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250204070528.1919158-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: d743cb67-e822-4df3-7fd6-08dd4533ac46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0ROSThVY2k0WC9KalVvMzJmRmVZTlN3alZ1WHBSTzlSVDlqYnZZU1hDMEhN?=
 =?utf-8?B?eHY2UGRuaVRQWGNjZlJEVmtJdjloY1JBWUg2NE9WUVdIQWlkRDN0SldBeVVC?=
 =?utf-8?B?bUhpaUNPSk5NZlpBTk1TNFZmM0ozWks0SWlOeSszdS9aWWdmNURZa3FQTkNu?=
 =?utf-8?B?ZXVuU0JKQlhLNHI4R1BRaVpkSjdrVWJFcE1Sczd4Nzl2R3hyTXdJWTNDSkVY?=
 =?utf-8?B?Q29TSTdXVDlRS0owM3FpeTMwRjZxbnd1MlBOQ3N1aE1xZVBBNld4Nm82Nmww?=
 =?utf-8?B?cmFiY2dxRkRxcGpxdnZaNjRvTzdrajhQQTd5aCtSQldkNzROUDdnOTlGSVNn?=
 =?utf-8?B?dTJhekx3b3ZaUUFCNDE4MVZVMWNucitrUnlmWWVlaVdndXF3K1Z4T3d6bW9K?=
 =?utf-8?B?NFo2QWJyWGcweDF3RXNMWG40cDFBWFh3czd4K3ZMTnFWTGRBaDBKYTBMYkQ2?=
 =?utf-8?B?MUJUbFZWV2tlQTV6d05NSlhLRzIwT09YdWZmMjdGMmpXYmp6TFJXdjJCV09D?=
 =?utf-8?B?SU9UYnRKdk5sT3hDN3c0eEJUdHMzZ1RYNnVGZHpaYkd2VU96VzFVNXZObnR3?=
 =?utf-8?B?RWNIajMwWHBhN2N4T1lQZkZZRUFjUFlMTHVLL0JXcm50bUhNQlFXcTFIL2ZN?=
 =?utf-8?B?TGVFZnNRR0ZmaGtKc3YxWXphWm9GNjJkcjJycVpnUk13cy8vaWVxdkJ2MDE1?=
 =?utf-8?B?MWk2eGdpZlJMZld4dHE3WHd2SzNCN29OSVdRTnBVMkd3N2ZRcVZsbjkxMmtx?=
 =?utf-8?B?UldNbWpKelF0cWE0V0ZQY0dKYkVKQy83YzBjRGlzQ1N4R01zTUY3aUxLVDlt?=
 =?utf-8?B?a3lDNm5vdlV2ZDg1ZVVFRXpTVjRXN04rTUJOTHNUN3loeEpMZWh0djNDWDUw?=
 =?utf-8?B?YzByMUM2WWJzdklzL0pzMVFpT1Nxa0d6WjRKNzJLNmplNENEQ05OYW9oeFM0?=
 =?utf-8?B?cnhMeXpyUkRON213MkNpb3JQY3o2WlFlYVhpM0FWSDRjZzhIU2lVSDdiUnJr?=
 =?utf-8?B?K2twN2MzZDcvQmNkNm4rTUY1WmU4NnhuZlJObTZ3Y1B2WEYwTzVQME9Yd0VR?=
 =?utf-8?B?cjZSRkdwNmlSS0RDQ2ZrZjJ5by84OUZaYlJCU21aQWZVTUkrVVQ2Y2FPMWFF?=
 =?utf-8?B?WTZzQ2NmbXpUTmdKZ2ZkVXNnZk1XYkNsMHlJZUVDNjJudkJVUDlGZkVTeXZz?=
 =?utf-8?B?R0hqRnBISlV2ZGRJUFEzdW9ORUhZdVo4UzRleHRndVNFS04xWTRUZ0ZxTnpQ?=
 =?utf-8?B?UEVaem1LOXRCcU01YmhiY0hsR2N2S3RUbUdiQktZcVdTOERrVTFZTVZoSXVa?=
 =?utf-8?B?cXREQitQcGgyVkwraTF2ZmpjbnVkSy80WDhhMUE4SlJhR0NsNWloNXc4U0NL?=
 =?utf-8?B?djZORW4ydEVrMVhhakplK0ZnaDNOY0luejBGZ05OSy9zUjRReTl0U2RCdHph?=
 =?utf-8?B?NW9tK3M3YjNBZlpWM3MzdW1paGRZUXhuWjMzWlRyMGMrV1pkaWQrdStIQkJo?=
 =?utf-8?B?b1o5ODNwTTBBNlgzSmJLNVZxMFlxWXNuRTFucFZRSnBQQkRrWnZOajhJMnFJ?=
 =?utf-8?B?dFI4VUZVRkgxQmpxUVVlR0tOYmdiUm1oUnRENFhoaVVZU1Y4M20raEVLUmF2?=
 =?utf-8?B?MkVHTG9LTXpIclhpbjdsNnliWmNSTkgrWUdZRGpLRi80VDNZaitMeXJ0NFl4?=
 =?utf-8?B?VUhPQURVMGZ4SjB5MlNpYTJaV2luRlB1b3FZdWVTZFZMWHJxRHZHai9DcTlm?=
 =?utf-8?B?alFVcTdNNm85VGhybWdRY29WZmxvbXU3Ylpya3hPK0ozVGpnYzFUcFVTNUoy?=
 =?utf-8?B?azdvOTcvdm80cFNOcWtDWHZmRkYyeG1YN016UnV6azF0YnhnMXg5SExiaVY5?=
 =?utf-8?Q?7cNNIHyts9cpn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UERyb25WZDJ1OFlkLzhMZEFCU1o5aFlTTUcxbFpseVU2UFVwbXhFcWcvdnRI?=
 =?utf-8?B?NVQwWXlRNkNqQWdxMjRYYmpCelNvbEN4ci9wamRrbFZORWxVSlMreUpqcHV5?=
 =?utf-8?B?a1VkR0g0OFR6VVU1VWdEYmxuZFJKS2ppM2dzYlNPOEtEK3hvcmw0RW10aWts?=
 =?utf-8?B?Q0hRQzhZVHlYV244TDB1cFZ6OWRCMjQyNUtLNXZIL29oVmdSRWxZcUVQdE4v?=
 =?utf-8?B?T1EyeUpacHE4WXh0bTRRd1Y2YlBsQXpKRm9PYzFvV3U4ZmI4RWs5SDFmV2kz?=
 =?utf-8?B?WEloaFhJUmdUZ0wyU1I4VmpoelVUN0FBMkxORjdCNTRRQ09LeHUzeFpVU3I2?=
 =?utf-8?B?NFZ0Qm1vSHRWakZ0THNDMTREakd1RHplQUE2b083VjlEVVJCNms0UnRoczlC?=
 =?utf-8?B?OWpsNXVjcXdKa2ljZ0RRNXZXUjBheFlvRDduYUIyLzBNNnpZUkt0UHBtdVJW?=
 =?utf-8?B?clZYMDRYS1d4K1N4MUVXYUpqVUh6NHp4OFFwdUl6eC8vUlR4YW9wYmtqYTYz?=
 =?utf-8?B?Tng3SVJHNC9WRk9EY253UW80R0NmRFlwU2VLMTlsaklJSEg2UUp0L2hYT253?=
 =?utf-8?B?SkE3dWJKa2RmRHphZHU0dGoxc2lzVmVXMW1FV1RoRkZla1gzdnQ5S2tTM21r?=
 =?utf-8?B?NVBvVUQrNmZzbVZTdi9ZekV6QlFrMG5ySXdFL1BVWjF0M3lqeDQzNVJWc0Mz?=
 =?utf-8?B?NnR0TkFKcm1qUzVhN3VPbURWOHVvNUlQdlFYV0N0UFJDMlRNRDU0MklDMHdr?=
 =?utf-8?B?Rk96UHp3U1ZQTlBPM0hEWlhsN290TWNCL2ZhSTlhTTZiZ1JBR0Z2cExrTStI?=
 =?utf-8?B?cytqTmxQVHZNelozRWJXQThhUHMxZ0wza1o4c0pydEFIeis2OENqbGtCTFdL?=
 =?utf-8?B?SmJJa3JvSjVlWjZ0TE0rcFBna21ZOExWQmFGZ3hXbHljZ25pZzlnUThicXMv?=
 =?utf-8?B?a2RHMXR0YTBCUDhJTVhId05kcEpjSWJJMWhHVExBUGR1SU8xMWZPSCs3ejAz?=
 =?utf-8?B?RmNLdTFOclorZ2kzYTJXekFVK3lPaVZldjJjeTZvVUNnK0I1U010N0Z4LzZU?=
 =?utf-8?B?b2JIU2lNRUNneGJ2cXc5WWdwOHRPMHRISUtJMlF6WVMvOGxiT1dvQ2crNUNm?=
 =?utf-8?B?R2RPZTNKR0FNWnQ3Vm1mZVhXVU96Vnc2RytMeTN5dFptWU9DUHVFbCtVWFJP?=
 =?utf-8?B?M29Jd2lCUXdkRzlpcUlDLzIrT21CVE9pS2lPVEhjQWI1cWNmeEhhSlhGakhv?=
 =?utf-8?B?T1lVYWlmS3dicVZRRDVNTVBKb3ZGSFR3ZFdpTFdKUWp0RE9yMndtQ0dML0Zv?=
 =?utf-8?B?VEhoNFdZT1RmdXEwQWZPLzFhVE9BL1BOdCtXNGNUT0czaUNTVEwzQ0srZlds?=
 =?utf-8?B?SGpFTDhmMnp1SE1tT0NiOFRDK01jeml4aDVtcHVuKzc1bGdZS0JVT083MVpq?=
 =?utf-8?B?b1NpOEFrZitPdndoT2RTTEtIWWhtNVd1OThma3lFSFk4cVpRaTRFU3FSK25u?=
 =?utf-8?B?QXV0Z0hHV1NYRlg3OGFRaUFnUlUvZ3JVdC9UTXFGUXQvWDg1Rm41bzFMd0Zz?=
 =?utf-8?B?azFia3hXYTF3am5XZWF3WE9IQVJuMmJEZXhGSHQ2RGhWQ0JrVG5TdnFKVmR2?=
 =?utf-8?B?QngzUUVsbyttS2kxcHpkblBMdTZLaGV3UWpOcExLUXYzMzQ4ZWs0NUFiRS95?=
 =?utf-8?B?d1R5SlJjTGxVR1NUeFZyM24wV3R2M1ZqemUzc3d3WWlJUmt6djFjYUNEUFU1?=
 =?utf-8?B?K1gyTjh2N3grZjVNMXFjMzNjVUEzdEhzRU5VRkt5aW1HZUxiMWlYcDV1Mmpl?=
 =?utf-8?B?YkRrMnB2TTBTOU5oSnhaUWQ0MGt4dGpjQzRVd0NuWnNkYnlyS1Q2YytobG42?=
 =?utf-8?B?NURrei9yQnhMU1hpRDJ3Q0svWFl6RmhBb05KZGxEbFRLUXR3Sk96MDRPdVVL?=
 =?utf-8?B?TWVNS1ZYOGJ3YUR1SlQxMmxjVUU1c0NqaEkzaG9lbitGMEcwS29kVjlIZHEw?=
 =?utf-8?B?STBpLytoQ3NuMzFWS1F4bDhuOVRNc3poUTFweURpTjFsZHBneFgzWFMrdEJx?=
 =?utf-8?B?alk2V1VaUlBkZjlPTEYrWkJXd1cxVXlzd0VMOWZ3VkRHVU15MUprS1JtR29P?=
 =?utf-8?Q?QF/+P7Q/odA3tyFLrrEkizo1k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d743cb67-e822-4df3-7fd6-08dd4533ac46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:50:39.6699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUdMmirNzap/Ken5pWjYEB9hKdat/LcmzleTZqSNff7TcpnBVbzFHfoU+7qmZOCV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136
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

Am 04.02.25 um 08:05 schrieb Raag Jadav:
> Introduce device wedged event, which notifies userspace of 'wedged'
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is no longer operating as
> expected and has become unrecoverable from driver context. Purpose of
> this implementation is to provide drivers a generic way to recover the
> device with the help of userspace intervention without taking any drastic
> measures (like resetting or re-enumerating the full bus, on which the
> underlying physical device is sitting) in the driver.
>
> A 'wedged' device is basically a device that is declared dead by the
> driver after exhausting all possible attempts to recover it from driver
> context. The uevent is the notification that is sent to userspace along
> with a hint about what could possibly be attempted to recover the device
> from userspace and bring it back to usable state. Different drivers may
> have different ideas of a 'wedged' device depending on hardware
> implementation of the underlying physical device, and hence the vendor
> agnostic nature of the event. It is up to the drivers to decide when they
> see the need for device recovery and how they want to recover from the
> available methods.
>
> Driver prerequisites
> --------------------
>
> The driver, before opting for recovery, needs to make sure that the
> 'wedged' device doesn't harm the system as a whole by taking care of the
> prerequisites. Necessary actions must include disabling DMA to system
> memory as well as any communication channels with other devices. Further,
> the driver must ensure that all dma_fences are signalled and any device
> state that the core kernel might depend on is cleaned up. All existing
> mmaps should be invalidated and page faults should be redirected to a
> dummy page. Once the event is sent, the device must be kept in 'wedged'
> state until the recovery is performed. New accesses to the device
> (IOCTLs) should be rejected, preferably with an error code that resembles
> the type of failure the device has encountered. This will signify the
> reason for wedging, which can be reported to the application if needed.
>
> Recovery
> --------
>
> Current implementation defines three recovery methods, out of which,
> drivers can use any one, multiple or none. Method(s) of choice will be
> sent in the uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in
> order of less to more side-effects. If driver is unsure about recovery
> or method is unknown (like soft/hard system reboot, firmware flashing,
> physical device replacement or any other procedure which can't be
> attempted on the fly), ``WEDGED=unknown`` will be sent instead.
>
> Userspace consumers can parse this event and attempt recovery as per the
> following expectations.
>
>      =============== ========================================
>      Recovery method Consumer expectations
>      =============== ========================================
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
>      unknown         consumer policy
>      =============== ========================================
>
> The only exception to this is ``WEDGED=none``, which signifies that the
> device was temporarily 'wedged' at some point but was recovered from driver
> context using device specific methods like reset. No explicit recovery is
> expected from the consumer in this case, but it can still take additional
> steps like gathering telemetry information (devcoredump, syslog). This is
> useful because the first hang is usually the most critical one which can
> result in consequential hangs or complete wedging.
>
> Consumer prerequisites
> ----------------------
>
> It is the responsibility of the consumer to make sure that the device or
> its resources are not in use by any process before attempting recovery.
> With IOCTLs erroring out, all device memory should be unmapped and file
> descriptors should be closed to prevent leaks or undefined behaviour. The
> idea here is to clear the device of all user context beforehand and set
> the stage for a clean recovery.
>
> Example
> -------
>
> Udev rule::
>
>      SUBSYSTEM=="drm", ENV{WEDGED}=="rebind", DEVPATH=="*/drm/card[0-9]",
>      RUN+="/path/to/rebind.sh $env{DEVPATH}"
>
> Recovery script::
>
>      #!/bin/sh
>
>      DEVPATH=$(readlink -f /sys/$1/device)
>      DEVICE=$(basename $DEVPATH)
>      DRIVER=$(readlink -f $DEVPATH/driver)
>
>      echo -n $DEVICE > $DRIVER/unbind
>      echo -n $DEVICE > $DRIVER/bind
>
> Customization
> -------------
>
> Although basic recovery is possible with a simple script, consumers can
> define custom policies around recovery. For example, if the driver supports
> multiple recovery methods, consumers can opt for the suitable one depending
> on scenarios like repeat offences or vendor specific failures. Consumers
> can also choose to have the device available for debugging or telemetry
> collection and base their recovery decision on the findings. This is useful
> especially when the driver is unsure about recovery or method is unknown.
>
>   v4: s/drm_dev_wedged/drm_dev_wedged_event
>       Use drm_info() (Jani)
>       Kernel doc adjustment (Aravind)
>   v5: Send recovery method with uevent (Lina)
>   v6: Access wedge_recovery_opts[] using helper function (Jani)
>       Use snprintf() (Jani)
>   v7: Convert recovery helpers into regular functions (Andy, Jani)
>       Aesthetic adjustments (Andy)
>       Handle invalid recovery method
>   v8: Allow sending multiple methods with uevent (Lucas, Michal)
>       static_assert() globally (Andy)
>   v9: Provide 'none' method for device reset (Christian)
>       Provide recovery opts using switch cases
> v11: Log device reset (André)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_drv.c | 68 +++++++++++++++++++++++++++++++++++++++
>   include/drm/drm_device.h  |  8 +++++
>   include/drm/drm_drv.h     |  1 +
>   3 files changed, 77 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3cf440eee8a2..17fc5dc708f4 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -26,6 +26,7 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> +#include <linux/bitops.h>
>   #include <linux/cgroup_dmem.h>
>   #include <linux/debugfs.h>
>   #include <linux/fs.h>
> @@ -34,6 +35,7 @@
>   #include <linux/mount.h>
>   #include <linux/pseudo_fs.h>
>   #include <linux/slab.h>
> +#include <linux/sprintf.h>
>   #include <linux/srcu.h>
>   #include <linux/xarray.h>
>   
> @@ -498,6 +500,72 @@ void drm_dev_unplug(struct drm_device *dev)
>   }
>   EXPORT_SYMBOL(drm_dev_unplug);
>   
> +/*
> + * Available recovery methods for wedged device. To be sent along with device
> + * wedged uevent.
> + */
> +static const char *drm_get_wedge_recovery(unsigned int opt)
> +{
> +	switch (BIT(opt)) {
> +	case DRM_WEDGE_RECOVERY_NONE:
> +		return "none";
> +	case DRM_WEDGE_RECOVERY_REBIND:
> +		return "rebind";
> +	case DRM_WEDGE_RECOVERY_BUS_RESET:
> +		return "bus-reset";
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +/**
> + * drm_dev_wedged_event - generate a device wedged uevent
> + * @dev: DRM device
> + * @method: method(s) to be used for recovery
> + *
> + * This generates a device wedged uevent for the DRM device specified by @dev.
> + * Recovery @method\(s) of choice will be sent in the uevent environment as
> + * ``WEDGED=<method1>[,..,<methodN>]`` in order of less to more side-effects.
> + * If caller is unsure about recovery or @method is unknown (0),
> + * ``WEDGED=unknown`` will be sent instead.
> + *
> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> + * details.
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +{
> +	const char *recovery = NULL;
> +	unsigned int len, opt;
> +	/* Event string length up to 28+ characters with available methods */
> +	char event_string[32];
> +	char *envp[] = { event_string, NULL };
> +
> +	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
> +
> +	for_each_set_bit(opt, &method, BITS_PER_TYPE(method)) {
> +		recovery = drm_get_wedge_recovery(opt);
> +		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
> +			break;
> +
> +		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
> +	}
> +
> +	if (recovery)
> +		/* Get rid of trailing comma */
> +		event_string[len - 1] = '\0';
> +	else
> +		/* Caller is unsure about recovery, do the best we can at this point. */
> +		snprintf(event_string, sizeof(event_string), "%s", "WEDGED=unknown");
> +
> +	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
> +		 "but recovered through reset" : "needs recovery");
> +
> +	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_dev_wedged_event);
> +
>   /*
>    * DRM internal mount
>    * We want to be able to allocate our own "struct address_space" to control
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index c91f87b5242d..6ea54a578cda 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -21,6 +21,14 @@ struct inode;
>   struct pci_dev;
>   struct pci_controller;
>   
> +/*
> + * Recovery methods for wedged device in order of less to more side-effects.
> + * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> + * use any one, multiple (or'd) or none depending on their needs.
> + */
> +#define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
> +#define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
> +#define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>   
>   /**
>    * enum switch_power_state - power state of drm device
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 9952b846c170..a43d707b5f36 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -482,6 +482,7 @@ void drm_put_dev(struct drm_device *dev);
>   bool drm_dev_enter(struct drm_device *dev, int *idx);
>   void drm_dev_exit(int idx);
>   void drm_dev_unplug(struct drm_device *dev);
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
>   
>   /**
>    * drm_dev_is_unplugged - is a DRM device unplugged

