Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D780BC22C1B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 01:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEF110EAAB;
	Fri, 31 Oct 2025 00:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n3ZOdR8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010068.outbound.protection.outlook.com
 [40.93.198.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F4A10EAA3;
 Fri, 31 Oct 2025 00:01:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFgUc8h5mJew0KBdR17HPAa67lf8d4iNBQ1jisqviKaiTWn+7v/LcJBdNbivJe9KqRJ1V/WmljRuHeQpw+XgZakaa1in68hRF2XQ1BMi2isGjoHpmsRlJcwVqcxs/loGaP8D2AMmlEvZX9DxgsFOvZush/yYW2ipsjLVitWnGOhr7yHn0ojoBmVzxUrBVkyQJPJip6cBObv5Ypy5iootgLeEhASd4ojNPeJFOPYsiIhWPk2bC5EXHKv3mnV7YTu5UVSca4lg7hsKFSxoGZanhII6lhLJEuO2k2i62KezO1EQWbafPql2BOKG40935P1N/5hsvpA9m0xjhGgmcfgqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgkrJXmTARNXBrRqBvkMWDGYmBD8q2KYD78R6pQhY+I=;
 b=Ms1Azmu9tPCl8g2hCxvF2F9LSw1GmiWajkWdWmGSH4GCDI+ymhoqlE1rS/7B70ySzJE4JOlUtBfczjK5sJvxdCVY22b1dysAkKyGalEM8AB3ZQjTpegRBp07bi8mjhVox6dWQtuv2GEmNvDMh5ZmDgxxQdGlTt47RZ/jWt/ZJ9ZhgXQP77K/SCFcA3P1K8KfFHbKtyCj7Vcn05qp9Efws8Vy1O0H5S/hRjartZuPSugsTM5zAUoDPZMj0DIAU/edavS0vcm+Sq6o4n2N9dgKeX9BiIjTq5AFQ638sAaSwcSsYoWj+eczcBJrHeljvobYIx22bZMl/lA4XH8ReUKQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgkrJXmTARNXBrRqBvkMWDGYmBD8q2KYD78R6pQhY+I=;
 b=n3ZOdR8WxuoxhTbYdm/Zm2gUALvkGcvGWKS50ysGFWHvphXzR4OenS9MdvtuY9Kg885FWlN6ZxSuc0Ev+A43g98BxVZdigNXxD9UwiWt7kw6Lpm0Iaz5c1EUembIWj3gacmSPBpH1pvf+li4X2SLeuUSqYg0j3zZrnPN7xjyvZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 00:01:12 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 00:01:12 +0000
Message-ID: <7a0c9f0c-6617-4870-8488-8a9c6576dd26@amd.com>
Date: Thu, 30 Oct 2025 18:01:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 02/49] drm/vkms: Add kunit tests for VKMS LUT handling
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
 <20251030034349.2309829-3-alex.hung@amd.com>
 <ab6cc898-a059-47c7-9ab6-8ab2a4b5783e@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <ab6cc898-a059-47c7-9ab6-8ab2a4b5783e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:303:8e::21) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: ea07994a-ecdb-4773-a486-08de18109a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d25NVS9JbjVxQjhRKzN5R21BU3BseVBFSkpmbmRkeCtobVNDZDhFYUoxYVM3?=
 =?utf-8?B?RnhlYnBHSnFYTzVEblRuOGZ6d0dITHF4dVArb2hETUNRRDFHQ2Vqazd0S3V3?=
 =?utf-8?B?OWYxK2ozUEhSVDY0c2gvY1pqbFBuZ2RBWXJydjk2UFFpWlZDS01Ba1pZMGhM?=
 =?utf-8?B?SzBsUmMxeUdnMERDY2NFZjhxak5VSmpiRDlaYUFZSWxkd2k3elVUa0JJUWRN?=
 =?utf-8?B?NUV5bWdhMGE3aWxIckFzODliTG1wYk9ianBiWkZ4S01BaFpDWFoxcUhqKzNs?=
 =?utf-8?B?N1creCtGNHh6L2FuOFhkMXBhc05kQ2ZBV3dONHNPYitnQm81Mldmby94cFpx?=
 =?utf-8?B?M0RBVStEdHFpdDA4KzFGc25keVJZTHlGM2pESGNEZXYvZ000YUZBSjU5eGpB?=
 =?utf-8?B?OHkyZVgzUWRSdU1vVkZ6emprbnEwdjdrQ1RtMnhVNWRvTnMxSWFjL21UM2ZY?=
 =?utf-8?B?QUxEa3Rjb1Z3eEFiUmsyV05majZLOUtCRjdmOXcvdlBhMkkzU1hXenhLTElI?=
 =?utf-8?B?R2J1bjZZZHRwTjBDNG9WdVBReXF2ZEc4UTYyd0IzcVYwVDFqV1A3c040ZEdE?=
 =?utf-8?B?d0M1MmdwUURPTHREcDRDSmlyRk5IU0tQMStSZVF4V05NRCtTU0lPNzN3NmZm?=
 =?utf-8?B?SXQra2hnUk4zQ1B4SUhMWjNUSXkrY05XTnp5MHJhc2duUlNhekxVSng2cFNv?=
 =?utf-8?B?OXg3TUtyR3JkcHRZbjREc1ZuRVp3a1kyNXQzR09vRy8rYTQrRVM1QkRhYWZ2?=
 =?utf-8?B?S2V3aGlRSGlqVStraUlhUmlNVEZBUGxiMyt3d2lZbEIyMmhYUEp0MkphTFlS?=
 =?utf-8?B?ODNVMW5oSXZoMUVGbEdOalJXcC96TEpHYTZtWm1HWm9ueXppWXQ0SE5Vang0?=
 =?utf-8?B?cGlmdkNycVN1R2EvRDZUdVpJeGpKc3BiY0htczBBdU9YaVlobG5sOEtmOHR0?=
 =?utf-8?B?OTJKY09oVExmZUVOVUtPMmZWbUIzS2dJbDNBYk9zU1hKcHp4VEpoSHdUcnZn?=
 =?utf-8?B?QUcrNll1dXdnMEdXR3JIM0hxUG1tMDdXdGIrd01nY2ZPODB4NGxDOC9WcTI1?=
 =?utf-8?B?TnhGR3JMT0FPNEtHV0JOVUJpbzMzektPdGJUdStTMXZVd29GbTRRalhSTXRq?=
 =?utf-8?B?ejIxamhOcEFKTUFRSFlMSTE5bndoUHYxczhhd0lhLzBTM3ZYTSt2UVpMa3d2?=
 =?utf-8?B?TlJkNXUvRU8rMVUvT0hHL3hRb3Ztc25YQmVFbEJON2tNSUFEYmNHcDlOcHVj?=
 =?utf-8?B?aTNwNXVLWHAyVTkwekVURE5NZjRnYldUc2dPenBYZXNFNFJwWSsxSkE3enBD?=
 =?utf-8?B?U1NCUTlwSUFuQ1VSeHBzTHp2aG1TM05LVlczZkY3RUJLN2RjK2xhQlNnZGZo?=
 =?utf-8?B?NEZudjJEbC9RSy9odkhEWVU5NVE4dS9icXZnR0Z6RGpWNDBYdnVvQTBNTjM4?=
 =?utf-8?B?dGNTNGdGMXNNV05WWTVWdXVTMm92bk9TOEpJWGZWMUtwME9xSkp1SEdSc2xx?=
 =?utf-8?B?NlVTcksrNTh6cmpqOUE4aC9PY0FMTURGUFU3OFdnL0JwNTRyV1U3RGhXR0g4?=
 =?utf-8?B?SVQ0a0t4Y2JaZGZXU1cvNm5SaTJlaDJpTjg4ai85MGEyTVM1OHZEcy8wajNY?=
 =?utf-8?B?SEUzMVdna1pxWTZnak5SZFN2T3J6ZlNVWlZDSXJjd2dDMVUwTnM1cXdyN0ds?=
 =?utf-8?B?WGh5MDJ1YTkyUkZSOVQzak10NWdpOWUwNS94YjZsSFdkWHlwY3VGYW5HVmhk?=
 =?utf-8?B?eEVvczZ6alV6N08xc2dXTlpicmxqRGlXd2t4anhmQktKNWxNRzRZTm8reHE1?=
 =?utf-8?B?RGs4R21KdFJPN3JLWkF5U3BWeDFic3lZL2FIV0htN2JjRkRKdSs4RXV0WklC?=
 =?utf-8?B?M0JmdzlHMUh3K2t0cFQzOTFRNjFmRUw1WEdiUlAzYWdyNitzcHgwMW5rbkV5?=
 =?utf-8?Q?7FmPXu4mmQ8IdlqFI/xQJ7QjovtMUNSY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXJJdDhCVFdOREhiYllqenQrejRFTzBINkxCNnZQdVRGN0pHTCs0WWJDdWta?=
 =?utf-8?B?VEt5cDFiTGlKWkZsMlAxZ1ZXYWxuNzZnK0ViSG83bHQvTXYwWVJReXYwTlBY?=
 =?utf-8?B?WllRd3lXYWtVVHFrOHZQSEFXbDlnUkVYalZCTS9rMFR1d0ljSEhPNlBMTHpH?=
 =?utf-8?B?WGRrM2VnbFcrMkthRTFuT24yZGc1SzZ6N3kzdXZwOWJjdk0vNEY4MzdjTlV1?=
 =?utf-8?B?aUJCZkxod0ZVSzhtT2M0KzJGM054a3pMMnFJL3ZNT2JoV3k1RjlmRHpwOEdJ?=
 =?utf-8?B?NS9Ha3M1V29BcFZqeUVGaTk1Zko3Yk9mS3J1WHlKYmNhU1pkVFBkZ0ZpK1I4?=
 =?utf-8?B?VFVFOXpUTHJSVDd4dStYakp4elpzOXM4Mk5JQlp0c1BsN0tYalNtOXBURTJH?=
 =?utf-8?B?M0lnQ29JaTNPbFpJK05MNUxOcGZWSHA5RGt3SFo0YXRXTU5iOFR2SU5Ub0R0?=
 =?utf-8?B?UXVoeVZXQ2RJZ0VKanh5KzJBTUpVVUZFQnE4Uy9SYlRTazZzVXg3YUYrY2lB?=
 =?utf-8?B?SUZNSGdwOE44S2tzOWJGdGFHRHRBeXYvdWVXb1M2SExSRnFDdGpnd21nZjNM?=
 =?utf-8?B?NHA2TkZsa0Frb25GYXlmbHNUblVhWmdxUjlvT2RKV3VQYjIvVmZNUDMrSTdU?=
 =?utf-8?B?Z1ExZytOL2dVOXkyZm1UdHpwUU9iVWFvSm1aMmZFS0NlU3JBTzh2NVR1N2hR?=
 =?utf-8?B?cTZFVDh0ZHJRVG5JaDBiTkZYb3dEeXFlR0tCZEg3aXlqMXZrdndFVHZuVDJZ?=
 =?utf-8?B?Rm1sUUppZG5RV1BjWWVtNjkzVzdkVURwOCtNN2tFNjdyZkJ5dDNaM0NHNjVZ?=
 =?utf-8?B?dldLRVpZUVg3OGRGdGRqS3NYeHpEVFpETVdma3AwOWh3Vjg0WGwyYk5zRWFX?=
 =?utf-8?B?VzNvKzRXSkc0dDhxeVhLMUQweUpIN2M2U1IxdzRuNGRpLzBwWHhCZktsTzFF?=
 =?utf-8?B?SEhEL1NpWm5GeVJmOE5DVHFOcERLR0ZIMmN1VjVGSzEvUHE4QVZuaTBaL2Vt?=
 =?utf-8?B?MHI4NHFhSU9BSzBmUVBNdHJRRXlWcjhtTHJCdTcyblJ1QURtM3M3RW9IcnYr?=
 =?utf-8?B?MlozUUpWQ1l0STVuU2J0K1JDRFd3d1l2NGd0TkRZTmRzeitKYWsvOXVuTkU3?=
 =?utf-8?B?Tk5CRmNwQ2VBNmU3WGlnM0RUaEk5SEtTaVhNcUUwQ1VsV1p2MEZXRGVVTVFk?=
 =?utf-8?B?eERPUEExamRyME5EUzZ1c0E0eUJ3clRham51aTIrYzJXSHo5N1RkR1NLU2FJ?=
 =?utf-8?B?TCsvTTFKaUpMTzY0UENjWk1wR1l2Mm1xMlVicXRySnpDUkZZUklvOUpBdEsz?=
 =?utf-8?B?UFlMaEl0cFhMcG5wUTcrSVJ3NVd3M25yT0grL3BpWlo2Y3FRdW9peEpYRDY3?=
 =?utf-8?B?TEtNeVRhQ3g4R2d2QXFHQWZtejhMa0VsdlBYdzdsWWRSUnliMWJIOFJNNGRn?=
 =?utf-8?B?dXdZbVFnWGRYVUt3ZGJmdGVKYlVrQVhrOC9EdE8zd1NCbjZmSjQwOXpMR0c5?=
 =?utf-8?B?ZGJadW5HRGRPSkF1TDEvNkhUMlcwMkc0TE9leG9NZndwNmxrSExBeC9PUk91?=
 =?utf-8?B?WXdDM3FrSHY2L2ZkTWFpT2xVQTF5QVI2TmwwNGJMZmc4emw5Rk9JYy9HcnAr?=
 =?utf-8?B?YmhkN2pQOXhFalJHZk1IQ1NHaXRlRWY4UHJzMWF0cGNvN3R5UTk1c1pPQWpu?=
 =?utf-8?B?SW1Fc3h0ajhjajZTSjlSdVFCWi9EaFVWUVcrT3VSUWpxemdiNTRXNkNaY25p?=
 =?utf-8?B?cnVZMGw5TC9sWWdLVXBzWG8rbnJvd2RWRGFWUHVienNNMEdoT2JvT3V4Tlp5?=
 =?utf-8?B?UWRhZWdEL3F5bEx5aks2aG5lY1BHdkNWRVZjNklyUTlHTmhwNlhGUE94VEpH?=
 =?utf-8?B?c0UwSnkxaU00bUt1WThqSXFFUHl6cFNhcnQyaThOb0pHa0psQkVkZHNyYzdp?=
 =?utf-8?B?VGRGbkpIZGgrbzZOYTVYNHlEQkJkZUhScGJNQi9QZlBWYWZQbXpvU0xucEFN?=
 =?utf-8?B?NXQ4S2dnaElnMEprZXRlK0RaTnVVQStOWktqNldKbDBodXdkYUZVNHRNRlkr?=
 =?utf-8?B?K1g1anI4alhDY2J4SmdFdG1EWW1lMEUvTW5kM0tTT0xzT2Jia0M4c1ByeGpa?=
 =?utf-8?Q?HROYc9vsRvPCjwe4AwmFb8b15?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea07994a-ecdb-4773-a486-08de18109a35
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 00:01:12.1003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X58RbbIn0jBcD9+V8byUrwjdMucszR0rApGAoRS53JbjPEZYgQwUXI1wUbZgwuFty0PKePHXg24G9iYPGpzCyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053
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
> I need this to compile properly the test
> 
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/ 
> tests/Makefile
> index a834d182b022..d4d9ba8d4c54 100644
> --- a/drivers/gpu/drm/vkms/tests/Makefile
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -2,6 +2,7 @@
> 
>   vkms-kunit-tests-y := \
>          vkms_config_test.o \
> -       vkms_format_test.o
> +       vkms_format_test.o \
> +       vkms_color_test.o
> 
> -obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o 
> vkms_config_test.o vkms_color_test.o
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o

Thanks. I will add these changes to this patch.
