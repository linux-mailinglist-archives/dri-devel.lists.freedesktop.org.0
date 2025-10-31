Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8688C22C27
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 01:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0591010EA86;
	Fri, 31 Oct 2025 00:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ciecl8bb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013017.outbound.protection.outlook.com
 [40.107.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B9B10EA86;
 Fri, 31 Oct 2025 00:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvri7u3f1DOuj3mvH6PFzlCVbRjBHlQErLqqyq6vzZyxPMMTLOxGM9YcCcdhN2d5bM2rgnCaRhdZ82itH3WKQH37WCroh/BlDcjYQYvGe8vgnH8sfSqoKQW4/6bKZt1M+vVjtzCGr7WnFiHb+7Qu3m/c/JXg9olYKrIyrbUZ3/jBMlEkDicOeiRcT0VQ6xBmj805t5oxaX8waJSArg0m175/ikqF5mlfzhPXfvkDu4LVilQjrSHuDOnlhLL/KhBdtk/qeqiDEhuCSOelCCKPEU4lkzk6v7EVR7rmG5wL8hh4hjpK1F0sif2stN4PG0Ar3pWk6na0PttVmcUCeeeQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUQZvtk8Ikhjc8HwrV5ShTfdvJTWEm683uZ1TWF32AE=;
 b=R+Q7z+Y/uy5S4dlA5DG5qNl2VC8lFl/ef4c+s6VSWnsmExZ5mdnuvw20iaYcUZMQl7s4HK/NAWXlp4IOLuZ/UUZSvsP5EATZ75zIv4QJAs0QMkXa01h2bS9jjlky5tWfV56IfoOHsiMcGmOIt0YkzzMcArRWgg31wVFVEOj6PJRZOXf3CdmYxFEaN8JTSI3Xy47r7K/Jxx+egRvceK2jz9X5yJ6ieheTucz0+x0WyQ3EkOqRzeKpOrQZFQy9mi/TFjPglIycpir2Den3pWy0+lfl6CfBQJpBgh31DNgf8qa5RxeNfZB//Vtp56rzlroeeCoKqNBeiHdEATZ8e0ahQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUQZvtk8Ikhjc8HwrV5ShTfdvJTWEm683uZ1TWF32AE=;
 b=Ciecl8bb8b4HFm/LjH2IbvWgDqKxCTwaJx/MiX+Uukt68lNTsljZ5WrTGSBxRNPBHht9XL4kCPfnOeTh+yJBEJk7rvQRN63qCDs8FEHwWm68LZclLgpT3l/LXrYRLRKRFBWUBei4koyGqCYaR9CRyLpOS4higSNzso2OeN+TqCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 00:04:27 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 00:04:27 +0000
Message-ID: <41e6da0a-7f06-40b0-8e8b-ce2699fde760@amd.com>
Date: Thu, 30 Oct 2025 18:04:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 14/49] drm/vkms: Add enumerated 1D curve colorop
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com, nfraprado@collabora.com, arthurgrillo@riseup.net,
 Daniel Stone <daniels@collabora.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
 <20251030034349.2309829-15-alex.hung@amd.com>
 <cfdc46fd-2a02-45ed-a752-25ea5a46b52a@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <cfdc46fd-2a02-45ed-a752-25ea5a46b52a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:303:b5::12) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c89100-48a3-427c-463d-08de18110ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGFtSWk0d3R4cm5HaWUzSmM1amxFQnArNUc1dVZQd1hVdVYxZUhncTh0MjNl?=
 =?utf-8?B?VC9vWktKWURncmZ0TmJ2Z29SZ1o3bzRNTFJ5Vldaam9jT1I5VUxRUE5KMU05?=
 =?utf-8?B?Nzh5ZjBuT0QreWlEY2F2T3hTaEpPTm4xMkNLTGVoYnYxdFR0djdCS1RNY1VP?=
 =?utf-8?B?cnN2d1BxY2ZxL0NQaUpUZ1U0WUEwbDh2SVlLVWxVZGpvQmtobUhLOUlYZjNX?=
 =?utf-8?B?RVJnTTI4RkNaY1FLeXFSVlhheWt5SzlJcE9TZml6QmQ1OFVmRDEycjI3N0c5?=
 =?utf-8?B?UDFtOTc5VE8xbUhUOXdxZjI3YWphdTFoSTVCUjk0SDE1aGRQZHZEQ3hsTkNI?=
 =?utf-8?B?UGlqMVZnc0RoM0lnai83MWhJeWtuaUZYS0xDTlRDV3NIR2FaaTlMTE12Ky83?=
 =?utf-8?B?cEhqV01pREU3WFpGWEJCY1luVDlKRGJLc2FPYTNLa2xrL1R4enhsVkFVV0dj?=
 =?utf-8?B?TWVSUWZHd3habmZmNXk2b1BCNndPTkxDM2orMXVPdjR6em5rTGk0ajRHNFNI?=
 =?utf-8?B?U3Nxck4vdWE3RkFPK3NTVlpnYWFKd1NGWkg5QXBkMDFIUldpZWMrcERNRit6?=
 =?utf-8?B?c2dLZFBNOFBoQkpBeVRlZ1lMQTVFbmFNRU1mb1hNblhNbjIwL1NRZG9aOWFS?=
 =?utf-8?B?NU9pVWZRUkZ6b2w4TlhOZk81QjR3dkIvMEJyNmlJK0tUcnN3Y24vVk9GWG9v?=
 =?utf-8?B?bFFjYjZyL0N5TmdPb2l3dUNBa1hRVmE0c3BDSnYyeWJKcXNSQmZoZTBZSndE?=
 =?utf-8?B?V3p4d0FDWS9OY0wvQVhRQzY3ajAwdTlYOUMrRXVoOExLWDd4YnN1S0N2Wi84?=
 =?utf-8?B?MDJYcmNqY2hqVEwyZXFoMDdBazZzcW5aMHBnYmQyeFNIb0NNU3BOK2swUkhW?=
 =?utf-8?B?N1pxV2Rrcnlqb1IwSGJ4UnBuOVJKV3BwR1ZKZks3UVVSTnoxbElHOSs5ZFZI?=
 =?utf-8?B?OGpaQ29laXM1eG1heXMyTlZvRTQ3Nk52Q2R5Y0JUSmVaUHFKbXVaVGlvdmRk?=
 =?utf-8?B?YVRiSTVQSUxub0x0UGxEZGJTaWU5aGtDdDZsWVFtNEwvUDVOZjZ0UXFVNVdQ?=
 =?utf-8?B?VzVNOVdhWC8wQmxoVytnMHBaWlg1d1R0dDI4MFNDN29ZdDBaRzVQc3lrTFA4?=
 =?utf-8?B?T3U0WjAvN3VnYzFjV3RpUDQyU0NkN2lQcVZNVzVPZVNXVHVLMFFxdlYzVytP?=
 =?utf-8?B?b2grYjFjVVFkZm5yTm9iVTFFT1IvaUdTTVhNa1NRRmNQd3BodzNZbnFkcjBC?=
 =?utf-8?B?R09qc1NSc3h0UCs5NEtKeDRUTHdHUlpzSEFlZmt1STdFaXc0ZjJ3ZHFza1Nm?=
 =?utf-8?B?SlA1aGpWbWNNYTNuaWVkMWN5ZzByQXVqWTd2Zk9pM29GSlFqYU80UW9FZklv?=
 =?utf-8?B?ejRRaDQyM2R0Z3gxY2tQb3hRZ0lkNUhWM0dEUDdUYXZxZm9tbGdOemp2TFJB?=
 =?utf-8?B?Wnc2S0laMHVQaEVqVXFra2MzeUtzWGJOb2dKaVhGUlJOV0hKNzNuRktEc3RV?=
 =?utf-8?B?OXhJSDFzbXNqK3ZRUUxnUXlVb0lhZlNyVm9OWU5SZGZMUzBmRUZIaFlhQ0VO?=
 =?utf-8?B?cUJWVnJKNWw1QWtRc09McHM3dWFUTGRUU2pxVG1Fa0VzWGpXcjlpdm9SYVkr?=
 =?utf-8?B?RFo4bEVNdlZhbFZHMlBTWHVwSGhublh5UXozanNkVWErcmlUem5yRnAycy8w?=
 =?utf-8?B?RllmcGJDeUxGcURxOGlUYmhZZGNDVEppRlZ0SldkcDFHMHRPc1JPVy9lUkxu?=
 =?utf-8?B?dkpTUlNOVzN2bkVSVS9WOGNiL0p5emJIT1k1MHo3NnVoZzRwb3FFYzZKd2xt?=
 =?utf-8?B?UTg1dFZ6emVaRjBvWW16VDZyQy9GNTNud05ITWRVc01sZnF5NzJYT1dkbW5x?=
 =?utf-8?B?Z2cwOVFPOHFueWxZU3JrTmhBM2llU2NWcnV6aG10UVBDNlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0RlSTBUbkNSK3MwN0VYN3BPcTJWMHRScnF2RXFiUjRjdGRFMEx3ZWdhK2Y0?=
 =?utf-8?B?WXdSR2hNOGRnUEhpWU5nOC90Sjloc3hrQUtsZWg0V0orWGFYYms2NlJjbWVU?=
 =?utf-8?B?cUNVeW81WVp6QXZRelpSajNPRElQU1dudEZoZmtJcEluY1JoT2lIY2VnKzdk?=
 =?utf-8?B?LzVPV1FNR2EyaXRyMldpUlJNUDNVZFFoUk10ayt5Q2dtZFRSa0xrWFp6amtx?=
 =?utf-8?B?SjVvOU5aeFpMMXZkQ3dIYUF5RnJleE1kemtmQ3pZMHVMUzB5bWhkbHRoTFpx?=
 =?utf-8?B?SzZURWdRV0NETW1BSHpSQnVQM215TTcwR2hCcWJLVFRrWitOTjhsbHVTU01y?=
 =?utf-8?B?V1hYSGFrbTlRYys1aUxxQUp3N0JYNFRLcU9LUXlGQzRUU1JSblV1WktXcGRa?=
 =?utf-8?B?dFRMRUVyM21zbDRUQllWUGk3MkZzNnpUUEhBUExCQTcxUmlPd3g1TkhQa0Jy?=
 =?utf-8?B?MUtoS0Vaby8yOTE3RnJFZC80L3llb0tDSXdjRlk5QTZqZ2dsTW5FMklxRGFK?=
 =?utf-8?B?c2tPcnhQMzI2MzgxQWYxVExXS1pQUVphSVdQdGhDdFMzWFdmNEJWNTl6RGtP?=
 =?utf-8?B?VG5zVUV2WnNsVEdXMENYRFM5S0VVWjI0d3ltOXVIQzhmNmNjSTVGOVU0UDJo?=
 =?utf-8?B?U2IrOU1PWi8rd2VvblJFb0V5d0sycUUzMGl0SE5yOUdFckxoODdUY3prbFBu?=
 =?utf-8?B?WGNnZ2ovdmx0UjRiQkdQbmxSUVFPbzUxTlVXdzRRR0ZYcXlOR1FLcUwrVzFJ?=
 =?utf-8?B?S0haQnJ1WWF3QUdub0NwRWpZMkJaVFRiT3BUdk9Fbmh4Y2FuQ0UxME9MbjFF?=
 =?utf-8?B?WEFGa3FENVpOTlE5SjNqM3dyNzBBQkcyK2VaMlI3cnFuSXlBSEE2NGs3dWZM?=
 =?utf-8?B?MUtVSlNkOGVKRWRldHpRZDl6ZGU3ckhtSEVTaWZicHBoZmowU0dvK0JkbE52?=
 =?utf-8?B?OVZ0NzQvd1pXMVVvWlcrRlBld2Fialdtd1hYeTlodUp3VXBpKzFCSEpkbTMr?=
 =?utf-8?B?U3JUVi9nNVVERXN0UmQ4OHdsR01MZjJKOWtwYU5LNmt5UTNacTJ0UDdTanI2?=
 =?utf-8?B?eHZTUEFzeTJQQnhZUmVqbVovWjdsKzE1dDN3UGhOcnBDK04yMVJFTnowc1RS?=
 =?utf-8?B?dVJDdTBPdHZDUkNPQlhrUUZWNWZrY25SMHg2aG1HcDRhSUVHemJhUnRqS1hM?=
 =?utf-8?B?dE9MRmp1NGY0SEVqbnBCZ055U3lPQ3dicjBnYmtkTEVnMmxEaklCOGpGVDli?=
 =?utf-8?B?TStXMlR5K3ZkUFhCeGo2VklLdnkwbFBzbTM4dG9YRW9FUXV6a1JjMUlZaE03?=
 =?utf-8?B?d2JKcVNYL25CZGU0NFFiYVgweDE4K3ByQmFvbVBBeDRDdU5jcDI3V0w0d2R1?=
 =?utf-8?B?QStVdDRLM2RxTm1JcUZvcStvNlAvRFVYemRjaFpNdlVIeEMwaVI2U0k0WEFM?=
 =?utf-8?B?bTJVZWU4NThPeWxZWG9zNklxMVNkL1piQjZ2S3c5SlJjVmNzaERVKzJ1YkFn?=
 =?utf-8?B?N29qZUpnTkhxdlprTDdWd21OZmpKbTI0R0lyZ2ZxZzg1N2hJaUFrckdOblRk?=
 =?utf-8?B?cXQyMHBVR3lFMHpIY0Zrb0xoL0tZN1dlUlIvTXJBMjRONXE1SVhMcDhGVTBw?=
 =?utf-8?B?eWJEVmJscEhsc2pHUWlxbzR2WW1SaW9WZWdOWkxaMGsxZ0VtSjl0SEtqVlR2?=
 =?utf-8?B?YnhqZGNiVEl0SDNnNUpSMWN2dGc3R1BKbmNQVlFkbTIxdUJwa3dNUzVFbFhT?=
 =?utf-8?B?aW1xeGZIazV1M3hhdU9DQ29KR0p2MlNwTnBiZVplT3lwVkR2RXI1cjRESS9i?=
 =?utf-8?B?Vm10djViRW00SlpqRXMvUXhQL2hwYWJLZHFDZ2lYVDZLMmtuOXNLeko4VmtQ?=
 =?utf-8?B?M3VFMzY3SWNuajB0N3l5enNVSXAvUk53bHhkVHNTTXlMTEovZFluekVVemRD?=
 =?utf-8?B?ZlBhb2w0UEpqc1VwdVpwTm50MUxIZFdRa3V2aTQrck0yL0t3WmZtTVQvUE95?=
 =?utf-8?B?a0Era0pzaDFYWG5SMEVJMUJxSXFkdmFoUkVUT1pTSXJBR2t3K1B5QUY3Vm5Z?=
 =?utf-8?B?Vjczc3A4eXhlZlh2Y1NJUWN1SmtaOWgvMklyeURsSTNPeXFWMW13WGpZWGpD?=
 =?utf-8?Q?/S44+YtqDrVIYpJFRa09IRySM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c89100-48a3-427c-463d-08de18110ec2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 00:04:27.6294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoYIxkfoGxAEY0Zsbu7uti2OpPkiqeBe+rk/PPSf7oX9kupP+1uedqLYGD86tPQ0sLO8H06ZnRPeK9oKBOAKcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683
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



On 10/30/25 08:50, Louis Chauvet wrote:
> 
> This patch LGTM, but can you add the [1] (preparatory patch to reduce 
> the diff in this patch) and [2] (fixup to this patch, add a module 
> parameter to enable/disable the pipeline and disable it by default for 
> configfs devices) so it will make it easier to implement configfs for 
> color pipeline without breaking uAPI?
> 
> [1]:https://paste.sr.ht/~fomys/16118ef2b5604226a7607db8a41941a27a43f168
> [2]:https://paste.sr.ht/~fomys/a98191b09ff7290dc6768bf7d54e789984cd3250
> 
> With those patches: Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Thanks a lot for your series!

Hi Louis,

Thanks for reviewing.

Do you want to add these patch on top of this patch as below?

   e1c34c68dc33 fixup! drm/vkms: Add enumerated 1D curve colorop
   68251534ebd1 drm/vkms: Pass plane_cfg to plane initialization
   8160438be2b5 drm/vkms: Add enumerated 1D curve colorop

I noticed "fixup! drm/vkms: Add enumerated 1D curve colorop" has no 
commit messages though.

Or do you prefer them to squash them together?


