Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09789A8655D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 20:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C270010EC52;
	Fri, 11 Apr 2025 18:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KsCWd9dX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AF210EC52
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 18:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyfemmoQ7R1CMlaV5CI5aYXV6Xe1dVZinxpdERKVnraraLYfKRZFg0WpsbmGuMNcKLDJLBMVho+XxbF3C1mZ5oXw146vguk1883TI8LI/PJZU4u/5O3OljOskJX2gRYgCVomnHGOuD2pk/LCrOucbrY8nLq2UEXviJeRM8YNdyP32DNzpU66+XFcHrlix9/H6r5c4sIRBTCU7/2jUM9zafka73NhAa6ZrV7CFfoIGq0epmySWhXYntROtvZ31iT5mgfKOx1Cj9GraanrHnNdNgwmtt0YZ+IEu8CGGdvJB8OUboOHfYvqDpMUHQ1OOuFFrYiomgts7AE8dUENTsxrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AF3sIE2y+7tNh76XNRlF9grTPmtf6kgQqkhopzglJs=;
 b=PHEGsFht6w3cMXZPx2qBKBaD84mxRsdPM0K8ve8Rek4z67kaPEYRpW2lobVnkf5lH1upy05n1fELeFrZSMXLjFS/hj2Pb4uULRg/+aHpL591/x20+1JYonWMyiNuW+mlFMecPguLJSUUjh8CdDCIHE5n7XRa05/gtDfot/ME8LhqrLopl7L9p4Dv1+mayrj8bFw/CPhXa9fgeegGNX3mvP7fQU0OE7D1b7sWIqwMI9owspiG8ghsOJXOa1QmxIxacXy6Ozmq3zNkpj9dGCW0ERAMTm4tzqfctyol6rVkRxNZl4TkA2Q7A/cCrndI1t7bMslZTRIRfTjNh5DQyER82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AF3sIE2y+7tNh76XNRlF9grTPmtf6kgQqkhopzglJs=;
 b=KsCWd9dXEMz3Ell2QkdYFmIY8VL4YMSTrAwwU7v+sRhwgvD4/DuClZNN5JUuAvizT7qauJlcBh984fWHvsDF04/tRENW+3LzEAWOwb/mwZ25+6XcNMAB9o1XFgJLp08jAYxfSB+YfxqTljlf+zmnscDA1NRMSTymkDP2LqI1IIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by PH7PR12MB7284.namprd12.prod.outlook.com (2603:10b6:510:20b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 18:21:10 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7%5]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 18:21:10 +0000
Message-ID: <4f365fae-aae2-a0df-e8e9-268b536378b1@amd.com>
Date: Fri, 11 Apr 2025 23:50:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
 ogabbay@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de,
 praveen.jain@amd.com, harpreet.anand@amd.com, nikhil.agarwal@amd.com,
 srivatsa@csail.mit.edu, code@tyhicks.com, ptsm@linux.microsoft.com,
 linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
 keyrings@vger.kernel.org
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
 <Z_imAnYu1hGRb8An@gondor.apana.org.au>
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <Z_imAnYu1hGRb8An@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::15) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|PH7PR12MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c929a2-12c9-464d-c61e-08dd7925a242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGtaWm1NSW5maFBDS3FrRnhxQ3RZV3pwSTVCVXFjNXJDQ2xzVVZGMmFZUFNl?=
 =?utf-8?B?VXR0SVZldzRuNVNjTS9yN1N2R3U1bE1mdEZtMG96dXRSWTM4bS9vUTMyV05a?=
 =?utf-8?B?VlVDRFRwb0ZWSk54R1JsQnh5UGNCM0pPNUYrRlNZNDh2UlBOWTI0NktFWWxE?=
 =?utf-8?B?aWF2UGRBSWhPMFhNZjcrVFl3WDNXVFhIOHhqYkhzWFYzR2VManZ4aTMxOU9r?=
 =?utf-8?B?OStlMXNVRllkTTRDNG5mOEt4dHRmZlI3SlZkUmpEUTc1ZzVFdXRlVlBHaDJv?=
 =?utf-8?B?cXA3a2xmZ2FCWkFHa0R1bUtaWUhLVkUwTkNFZW9VcEZaYUpGYmRsL1VLU08w?=
 =?utf-8?B?TzVrYnZRYndlaVdMY0lGeWdmVW9aRXFsNWpnTUlVd2hvc1E3TlM4WmU3ZUN4?=
 =?utf-8?B?Z0liS0dsbVNHRG1lMkhGSVlTWFAzbFppbzdsTzVuQnhwZkt4ZXFZaFlxbWVn?=
 =?utf-8?B?Z3R6a2FFZDZSUkNEdmZTZWpQcFNzYmxKLzZwNTNoR2FoZ0hXNkk4bitYK1Ny?=
 =?utf-8?B?T3V0d2dLZnpJQmlmZnFONkFiTmxoS252VXBPUEN3cmt6UnBzMUNKNDkvaFVG?=
 =?utf-8?B?NisyZFJXemUvM1dlbVd3TmRkeUZDVVB6Ym42Q0xPc0F4TWNuaGdtaDZ4M25z?=
 =?utf-8?B?Z2tjb2V1aTRSNXIyVXRiZ25DWUtZKzYxMWxOM1grbXIxM01zYmFlUjdaWVA4?=
 =?utf-8?B?Nkw1dGdTMVFjVzF2cTV3UDRNQ2hCVkFzMEphSUk2WGNaU0ZCYVFWL0JtUkxC?=
 =?utf-8?B?SnVkd0pldzEzSXdHZ2hKZjk1OGpURGVMS2phR3BhYXJMcDRub05WbElxS2hj?=
 =?utf-8?B?Q00xUkE5VWN5b2pLUWhxWG9QQi92YjlzZitHN0J2bnU1cjVtbHlsQnV2VmFW?=
 =?utf-8?B?akZQcjE5T21hdnVnOGQvYUxjb0MySm1tQVp1KzlCQm1LVHczS0RvTWgvWG03?=
 =?utf-8?B?dndSRlVONTdlMFo5MmxwL0wxUFlxZjZxUEFFaTlWNjBST0Y4eHk0bURUZ002?=
 =?utf-8?B?ams5dHZtWWE2ZStBeXJ3STMxdjVQNmVTNFBmZDVsVFN0eCthNzRlYUJQdkIy?=
 =?utf-8?B?QnEvYXA2enZDV1V2TkdMVGUyVDZDOFZ6Y2ZPVzBhV25TTU1CVHpWbFNUUEg3?=
 =?utf-8?B?UXRWVm92a3kveVZzeGlqcjk3SE5KNFRNRWhvYmUvNGRES2cvSHYyclo5TW9j?=
 =?utf-8?B?bG9qd3lnc3RjcXR2dUkwamk4cWdUTWdGZnBENWNFeHhsMlA2bEs1L0VLaysx?=
 =?utf-8?B?bkoyOEQzZk9HdGhGR216d2hEb0JyeElBMHhJVzNPcHRKaE5IQlpaWkdEQ1Jk?=
 =?utf-8?B?cWpNVlExQmpEOEJVREdPZDJiSzZFQmtRTUVEdGxxdm45Znh4SkpFbTcvMlUy?=
 =?utf-8?B?ZzFSMVJQSEt1T3ZGSlh1NEE2Q3o2Wm9INnRmaDllMHd6eGtqYWxmTndaNHRX?=
 =?utf-8?B?cHZjb0NBeUtWRTdLMC9zSkk4cm1lWWV1UjJVVEVYemxHYTZ3VlFIZDlYaVZi?=
 =?utf-8?B?Wm9yVkRQVlRGSjh1cWNJZCtzcm5QaktETEs2Vkw3L0E0dUtnenMyby8vdnk2?=
 =?utf-8?B?K09qRGNSUDBXZGNINi9UVEdVTWcvTTgwRkdsc3N5VmpnQi9zNnlqU0N5UjRw?=
 =?utf-8?B?UU41SmxVTVVEaEhrMGU1NlNPU25mV1k0emlEM3U1UXVrMW9HR09OajVVenNF?=
 =?utf-8?B?TGtWWTVUYU90SWhnQlNOL1REaEQ0dTkvTStvTStNejJnSmJIYVFCMkJZUktz?=
 =?utf-8?B?aUduUGJzYi83VlF6Y2dQNnhlVzd1ekNsRlhKMjR1aDZPRlYvZEJObjZyeVFF?=
 =?utf-8?B?a1dnRE4vdm1SMmMwSUlxTjlhUzgzNGZoa0IvUFN2dXBFU2RMMnpUcFpkQnZF?=
 =?utf-8?B?YkliTmxsTWxudFRoN25GSzZRTWNSeDdxN1BScnZUQmNTeFNBcWM4d3ZSK2dt?=
 =?utf-8?Q?/hE4x+s/TZ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9193.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlZTUjRmbjZCeVdPOXAybzZXRXQycEtnN01tNUc0R09ZdlVNVjhjaCttTkgw?=
 =?utf-8?B?QTVxU3hITUVUWnFpSjdRbHRnRWJ2V2FQZEtXbkM4VDA3cWx2SHRMZU4xUzNN?=
 =?utf-8?B?WlRlNkpsTnJia3dxajJvMVhEeVlNblZjV0hlazh1WWVTNCtjdEx4OTJNS0VU?=
 =?utf-8?B?THF3UWNBQVl5Y0gwZk9maThLMGlqbHJ2V0ZIN2kvQWFaQWRrbWo4UUtQVjhN?=
 =?utf-8?B?VlhUNFJlMjBwUVg5dnYzQ2ROZHBSaDk1TmxhaFRRbWpZZVgybXVtM0UxWlZI?=
 =?utf-8?B?S09BbDI4WTJpbitsWVdseGI1MFBVS1BYRGxHVmNGU2lFTVpYblZxTWd3b3Nz?=
 =?utf-8?B?cnZTZGdVM1h4TFZPVXd2NGw3eHN3R0xCOGxXWkpVazFYTyszRXZMeThTcnhW?=
 =?utf-8?B?SkFETUhWS2t1dk0vVEVsMjRBUkxKYmpLZ3dZQUpaSW0xaDgwSmFxRHRNL0tJ?=
 =?utf-8?B?TlBGMmx2M0syZERnbHNGS0RyN2IrVCtzd3M2N1NQUGR2VVorZE9YcEhiSHp1?=
 =?utf-8?B?YkVXSlphRHFHWm05T3A3T1ZhdE92bEkwMDZLLzFUUk4zZCtCdzAyYmJnUVRN?=
 =?utf-8?B?ZzFVbWJydE14TzlxbTU3c3VoNjVhcWJCYUVyRzI4VHlHampOR0wxZDJoVEtX?=
 =?utf-8?B?RWlEeHMzM1dDQmd4OE5Gc0pHM29VVFZPZ0g2QmoxdkxXUE41RFhFeTJURjZM?=
 =?utf-8?B?U3JjMksva3NhN3VDQUlYL1VwQ2EvOEx4RU9OWkpXTm01Y1ZuSjFGV0xiWFFH?=
 =?utf-8?B?TlJSQzVyREFjZkExeWpEQ2sya21tRFRZK1oyQng2ZlBxRTBJUzhrM0hwemti?=
 =?utf-8?B?TXd6YWppRVpjNlhpUVNhbGs2TUlPbERvMUpML3J0YzE4TUtjTEhmczk5TVc5?=
 =?utf-8?B?eEZOOU14NmhsaS9RTHo5U3N5REdQWWhyYWVzWEhIdW9qRzRKWnl2RS8wZmJD?=
 =?utf-8?B?NEEvQ2ppZnNFU1ZqN0JnS1ZUTkYrOHpEd0YwVStyTEhsbVFUeWMyR0hNS2VT?=
 =?utf-8?B?b05qdHd5Z2JWSzNsQUdZdzlJQmdYenl6cjFCaFBwZEVXUnlka280SU9VRllQ?=
 =?utf-8?B?NDRBTkF1dDhiTnRWRVA3U0Y3TDI1YlhzQmFkQWt6VE9tTnJzWk82N3dZdEU5?=
 =?utf-8?B?VEhTYS9ZTnVNQXpuUXY5T0FrVW84Z3FuVjdCTkIrLzhPTEZxUnA1TUJGNlp1?=
 =?utf-8?B?WlBjV1Q4clBaSTBjNFdEcWRuSkNvdVk4WUVrZDhJQUJxakY5aC9ZQVNreXBv?=
 =?utf-8?B?THY1ZGdwc1hjWmZQQWJ3NmVETHltYUV6OEY1cmI2UExjRnlNa2ZJYk5idnZY?=
 =?utf-8?B?R1VSQ2NKY2Z6Qm5yNlhFNFFrdmNqYW9BV2NXWTZneFdKODZRTm9tZXRqLzdK?=
 =?utf-8?B?NlNVUzcvRUJCemdXeWtPWkw3eVVCUFo1WGV0bHhaaXFCQ2dKL3o1OWVDM1BQ?=
 =?utf-8?B?ME50NEl4ejJva2Z5bFBPSkcxSll2eDJLSUZIc2tlakt1ak1yLzAvK0JFcmE4?=
 =?utf-8?B?TmkrREJwd0haZjY0dnk0Q0RBbUEzUE9kazZKM0hiall1blF1VjQzdlkwL0dB?=
 =?utf-8?B?MWZwZzB6ankzemxySkVwYjgwNFd0Y3RnUXNXSVRBaTRzczh6c08wV21rMlh0?=
 =?utf-8?B?dnpoY2VpdE11WDRZTjlwckpySW1ncDNsdjhHTU5WckxGQmNyNW8xZ0tKS1Jy?=
 =?utf-8?B?YW1McnFNSHdvTTVtNWdxc1pBckRHVE1FZkEwOGRZVnpIY2RaQ2hUUEJ3Q25Q?=
 =?utf-8?B?Zkdjd2RVSjhJRlp4bm9STGxTd1hlelY2cTNrUHpUdC84YnAvVHhoTUxIdzhT?=
 =?utf-8?B?SmpBSEV1OTJhWjFlK25CNmNBcjFyL1Y3OTEyMXJEMmNkL2gvQkVBZGVZd1dF?=
 =?utf-8?B?MlY5VlFlOVhCR01iMC9IUE1SMmVjTkh4VHB4TTcwUmR5Tk16Wkx6czRXQ2Ns?=
 =?utf-8?B?S2xYTGJnbzNVK1kxaFQrZUwwMjByYVdMQkhqakpFd05tM2RwQWZTWFhlN3FU?=
 =?utf-8?B?OFZXa1h3QU8yQkFyM0Y1c3JvZEVzMWNuVWl1SXQ3blNSQmtvd01NYmJzOWV0?=
 =?utf-8?B?TnRkTlUvaU1MVDBMUXlqUnlkN2ZMeVg5cXc0N1lMblp6NCs0bkRwakVaRnZF?=
 =?utf-8?Q?J4BheOi+fo/P25vhxeAkR173h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c929a2-12c9-464d-c61e-08dd7925a242
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 18:21:10.2557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yp3DHIIFk010sO/yQgBxWRI9odXrTJkyTGtgzdBfiPfk1dqtbCSlfUiLfcnCNCpH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7284
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



On 11-04-2025 10:47, Herbert Xu wrote:
> On Fri, Apr 11, 2025 at 10:21:03AM +0530, Gupta, Nipun wrote:
>>
>> added crypto maintainers for comments.
>> IMO, as accel framework is designed to support any type of compute
>> accelerators, the PKI crypto accelerator in accel framework is not
>> completely out of place here, as also suggested at:
>> https://lore.kernel.org/all/2025031352-gyration-deceit-5563@gregkh/
>>
>> Having the crypto accelerator as part of accel also enables to extract
>> the most performance from the HW PKI engines, given that the queue
>> assignment is handled per drm device open call.
> 
> There is actually a user-space interface for asymmetric crypto
> through the keyring subsystem.  Adding the maintainers of those
> in case they wish to comment on your driver.

AFAIU after looking into it, the keyring subsystem is not to perform the 
data operations, but for managing keys for these operations. Kindly 
correct me if I am wrong here.

Thanks,
Nipun
