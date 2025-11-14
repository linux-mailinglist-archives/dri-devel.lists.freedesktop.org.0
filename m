Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B4BC5D2A5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725E510EA57;
	Fri, 14 Nov 2025 12:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DeNuNc8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012001.outbound.protection.outlook.com
 [40.107.200.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D4A10EA57;
 Fri, 14 Nov 2025 12:47:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhUP6CekUqoDPENJH7Cr3wiO7V+ex6kb9KRsgC1sYfcmo/3mTsmKa4dUzWJ/7laOaTIR9LvhIWIziSd+VhSu5B+MCRK9bAOCkrW+Jx8LvLBmyKAWqzAnoRhPDPQzpGtAUhSYjSnlFD8BzqYiuqhCEh0e/IKV4k8uu13zAzaZjrkSoiPea9q8vGGKSeuE9POgxRGKGAv1vIA96vBXgxwH4R3xgC9+Jh4H8IT0bbMVWs0ncVVHgE1pMTpPWqH+ny0XAmaEFxo+lXDStgiY+/dGElfffOLrkE2oRNWUVXvF/5m4UD/zqgLsIW8Mfpo4cbhT1rEGylmowe5m70IRAJDukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oU0+Gf363IsLu9Ps0WKaD+K/QUMh0CvIaNBAl5LTZU=;
 b=BYlnlRVmgOVnRS7xocnmquA2GLuLdVjTN9oraNGabqWRQPN9hVw6VkAyL0fRNp//E4Orw5OO+dqnWcDt2ZNjhwgdoAMUyJ+2nsc708FsfFiye6svs1LQVxI+pg8e4ZmOTRZDIxlxQ//7qE2gCC0yoIyXv3yhVqPfBnYX0OWyC+hg5eWxoEShavcYRjtThw5TXHRogx6j+2+ohpY/DIIVprPrWyDA0HEwGG9+kPOJ8w3eYVeDfhWKOqLcfcUg+Zg89YdIwQzOTWFG1fXw6n6jwQPdJQddgUaT4U5RxmucfNWuKhLcY+s5TUuOVvyq40jFiVEMYcEYgC2UwZel+A+P3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oU0+Gf363IsLu9Ps0WKaD+K/QUMh0CvIaNBAl5LTZU=;
 b=DeNuNc8RVIq59fx9ssKel2PbicQjsTfdB6ktfJet/ET6paFHJhz5tCJETPnSez42H+xLYMIDVq82WnV7/iXQU9iUKoNvBGrnmRSH4A+idbpAN85b7eOoPWeilOfqKZmQW39hUACO2ukXq3V1QaUcKkBcmDuurWsibulrZnsP898=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7518.namprd12.prod.outlook.com (2603:10b6:208:419::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 12:47:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 12:47:47 +0000
Message-ID: <9bd76e0e-6461-4497-a8b3-6c66d3f9c6c8@amd.com>
Date: Fri, 14 Nov 2025 13:47:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/20] drm/ttm: rework pipelined eviction fence handling
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-3-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-3-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: b6899912-5ef8-4e3e-8673-08de237c033b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0QzMDJKazkrU2JjRW5tNHA2Q3pqaEY0aFFpeTR1VUkzWmQzNGVDYXdraUdY?=
 =?utf-8?B?UG96V1B2OVF5dWtZM1NsaSsyQU5vS01welZGNDcwVXdwcEpJQS9kRStiYzFQ?=
 =?utf-8?B?YWNZY2JDM3hFejR6aDNFOUlBS3lWSlhDU2RxM0xPMHVydUlkcWh4NHh4QTN6?=
 =?utf-8?B?Ryt6Y3dKMWp4WTdwZEI5a1NVc3NnbjdSdE9yWFlaVlNWU0hlMEFpR3dOMFRK?=
 =?utf-8?B?ZXBDbHg0NlM3T2hkR0FQeVNzTkNheHpoRVBSMm8vNlZPZWkxSG5kbXN6Mm04?=
 =?utf-8?B?N1BYWnVFOFlBNmhSR05BU0RSdzU5dC9FS0srOFlVaEtHZGhtbnZEUGExaWsw?=
 =?utf-8?B?K241NmxGNGxQVFRKdng1aWRmS0xCVlFDTnZXWXZ4bEJxNHZDdGthK08yN1Aw?=
 =?utf-8?B?dFVMT3VHTnlSaXNpNmpZSnpzclpIbXplYWdtNTV6OEowSnMxSlF6L20zUFc3?=
 =?utf-8?B?ck1heHovN0ZabGRyaE5pVlBsZG9qUk5FRzR2NVR1cFJzWmJHZFhQRDRuVnIz?=
 =?utf-8?B?bUZ2ZURvS2JaeTBDK0Y2Wm1WY3dTcUJ4VWVoRFJvbXJVODA3Y0x6QXF6aUlh?=
 =?utf-8?B?UE11SkJaTkN3WDN0YWZHdFlPU0psdTJ6eTNXUHJaWW0yd2RxZXRWdXRpRGpO?=
 =?utf-8?B?Y05rSDI3WURGcVZmcFFZNnpOamR2ZW1EWExFcklJdzFieWxqdWRldXBxNmQz?=
 =?utf-8?B?aGwxYTBRRFFvQlFKbkhRWExxY3V2TGlyY2JhM2VTVGo0eklHZmx5MGN0QzA4?=
 =?utf-8?B?QUZIZlc0dlFFaEl0RzZKRklkUTdqc3hCVmU0dnl2enNoTFRDVTlXU1NvMU8v?=
 =?utf-8?B?bzdSWXdCeFdKaHNSUnA1K3UxVTV5ak5XcnZtZllHZUdMVitsMkxrWDlYenRl?=
 =?utf-8?B?THRuUjFMU0pyZDNsWTY2YVhtaFBac3JCb212amJ1UjZsZ2lLd0cvMkM1d0s2?=
 =?utf-8?B?UUlZTGR1RVIwY3FIVVBHeFhSMDlCNVh0ejV2QTQ1dnlRRm83c29qYlcwMEpR?=
 =?utf-8?B?Q3hlUEFyZkhmYnlCd2lCZXdwb3FoQzZnaEo2R0U1VS9WLzlCb3VqT2NmbGFi?=
 =?utf-8?B?R2ZxK3VxdUVzSEdid0JCL1EzZXY4SE5CTmR3QUZuYUZ0OW0rUWJVRFhYbHBK?=
 =?utf-8?B?eHBCVFZOcTlkVE55UFRwNWorVENMYmIwcnlrL0FhQjdmdEphRjRYSVBBbWVO?=
 =?utf-8?B?R0s1djRmcEpQV0hYdkdmbWlDcTlHOUZWTEZpcnlOb0VrQlFRRis2VmphY0tH?=
 =?utf-8?B?NkZpYmE0c2FiUG4zOWpRU3VlSnRBNmRMdUxEVjY2ZjBlQkZvamlnWjlxSTR0?=
 =?utf-8?B?dWc4YnZRUFowbmpMUW82UkZCR3lpbi9rS0xYaFhkVnp3VUwzS0ZLSWdKS2V0?=
 =?utf-8?B?S2praFJCc1RhV1lsZnRiSExyNHdQLyt6SXlmYXBnaHM3MHBPR0oydGNTbzlD?=
 =?utf-8?B?cjA5L1orQ0J2dmNwRVEzdWdnLzhQbm1aMDk4Qk95UDlOL3NEdzlBZytOakRx?=
 =?utf-8?B?Mjl1U0lTcC9NdENkWS9keW9pSVlVbzJIT1JXWmxSTkdQZ000b0Zua2tuSFpa?=
 =?utf-8?B?SHVhdHVMK0ovTnNFYUdrbG0zWlI5YlRFOWlPWDBUYXBralowb0NXMENNZFUx?=
 =?utf-8?B?UFFyTlgrb3VTNEtXS1kyaDFDaVEybVpkTndGalVvc3ZKUDNoU05Vd3gzNHUz?=
 =?utf-8?B?R1lQZEJXR2taUzBGZHVlZEdCeVhIclZJRUZvYWl2aXJEdjlXVDRZK2t4RjJJ?=
 =?utf-8?B?UjdxY1VNSDl3ZzFLRm1sanM5T0ladnFUVXZVd1NBTlRPVkQvQmlsMEdCVE5D?=
 =?utf-8?B?WFBpWkN2dEZLdWQzV1hqWTNmSVVuYUUwdFpTWHhYdmZhSWU5QUhpV2FVanhB?=
 =?utf-8?B?eVBwK01YY1pPamRGM2UrZGxMM0ZCS0FrVHBuSllmQTFnajBDdHJYS3JVQVp6?=
 =?utf-8?B?WmxYMmw4UVN1eGNneEx6S1VXUUltSjhvbUd5ZHRvM0JmSjJNTmVXZm1lSzFy?=
 =?utf-8?Q?2t2siQ7Uh3XYICzKptDucipDmd0/2g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWtCZy9ibDhvUm1EemNKUTVNU1J6NHBmc0Izek5BdWdIY29HREVjaUpESjFj?=
 =?utf-8?B?K1h5L3Z6YUo4bGdLK25TbnpIK0xjWW8rWHBpalRSTlJqYjZ2RWtHVUlLSDNl?=
 =?utf-8?B?SURLQ3Z2b2Z1SGNBekpmU2JldGlUK2lsdDQweDZYSWordXBYVllwempRZ2xa?=
 =?utf-8?B?ZlF0U2UzZk1UZnFkcGFOQnc3YWMvTnVDM3c2NzgzcDhaWTg1S3IzQ3pwY2lI?=
 =?utf-8?B?THlnN2x0WDBNNm5TcGpDM1JJZU5jVjdkeVNyWTBjOGxZQWkvZmRwTWJwR3RS?=
 =?utf-8?B?R2FJWkxKa2pFTWk3TW5STXY4bm1EODBzWWQ2OExuZm9XajU0KzVEMzZaUDdq?=
 =?utf-8?B?ZWM0MjVrUGVXUFFQdENBdjhBVVdkMktXbzdBOGt3ODJWSUhiblZYcFpHTEpo?=
 =?utf-8?B?VmF0aEorUTNndVRKdElVem8xbmtxMThPR3FZcFBCS0lsRVY3TTNZMTJ3M0Ux?=
 =?utf-8?B?dHBVTWRjalVVZ3paSC8zcUs3NUl1c3VUTEVOcVAvK2QzMW5waHZhUjB3Qyt4?=
 =?utf-8?B?RWZZdC9QOEJtK3FGTWNzMWdRanVFcEs1cllUVWFRWlVXSGM4THhpZlBwWUF3?=
 =?utf-8?B?YnFKTFdrS1pYMEt2TXJYNG1qOEdnb3dHeEhPUThreTlvclY2MWtSTkF6M2Yw?=
 =?utf-8?B?MVg5TkppSnQwR091MjFxbHZTc21IUlJsemplRlRmeXRld0JQMllPaXJxSE5E?=
 =?utf-8?B?ZlZyVzJ5Rkd5U3cySDhQMnVXVFlaMjJPcjQ3dDJMZW8wakM0SldqTkZNV2Z1?=
 =?utf-8?B?SWI0TUlRL1N6SDN1R3pQaTNndzV5SzliYW5iMHI1QkFCbTljOWM1VmNZelFL?=
 =?utf-8?B?cldOdHdOOGNGUzE1Q1pieU00KzNLRkVjV0piNmsrOFZDaGF2N1V5VC9WK3FF?=
 =?utf-8?B?MVJVNGJ0R0Q3QUFpdWJtU1Y2N0orOE44TTU3MG9iZFZWUmNlZnVTSnlRa0Nr?=
 =?utf-8?B?dmdXRTZKZjVZcCtyOW1USnJwNmkyeG95SlBCV3lZZWNWd3ZQRlNSVmJXUDcx?=
 =?utf-8?B?TlYzYlRLdm9QdXhCRHRtem5OT0twVDVya1dIUzFubGlvRWV4K0VFWXR4aXEv?=
 =?utf-8?B?VEVkL3R4cWNwT1ROOFZKZGdVVUE3WDEzZ1QwTXNJOXY4SWtHa0hNTWNJbzgz?=
 =?utf-8?B?U2lVUElqVmFpd045OGhkNHlBc0psWjhtcjVDZVRkU1lwdG5pNmxMYkViZzFJ?=
 =?utf-8?B?by83Y0gyeTEwR2lBYkpKbjV1VnRGVUgrdXpmK3g0WDRHOEVyNkltK2lLUHZu?=
 =?utf-8?B?d2JFNC9MOUlZUzBjaDRma2hBcmt5cjhuemlCc01iVnBWRkdMQTVkVHdrQjVS?=
 =?utf-8?B?VlNYSTVOeTZUVDRZNUxibjBKQnBPSklSdERXZytJcXo3VWhCTEpRK0pvMEli?=
 =?utf-8?B?bmRPREVDREQ3eTNoeklnaE5zZnBGbHYyQlFVbWdkZERJYXZnOGJqVHFUdWhE?=
 =?utf-8?B?SldHMWhFOG5pM1U3QzF4MmNrMGFmZHM5STNoOCtTOVd1Y1pJbnFwc3daNFF6?=
 =?utf-8?B?VVo0V0tKOVhsT0pFUkRLTEZ6cERRRkVJSHA0eWs3TC9ZNWF3K1pzeFk5NFhH?=
 =?utf-8?B?OVhlQyt4OXdzbkpyckZXL0g5OWlLSU16NnR4NmxSdHJ2Q09kSk1oa0R3U0pu?=
 =?utf-8?B?UVRjek5hQlhWak9OQjhmcGZVU1UxN3R2aGFVd09HUEdoL0FpYVpOSytqQmJX?=
 =?utf-8?B?S0grQVA2NFhEZWE5ZXdhRlkxWHZRMm9mVndIRGlDUTR5cDNLSlc5MzdZWUV1?=
 =?utf-8?B?VWVJamZQTHd2Zm1vYnN3OW5Cc3RqZVgydXlCdDgvVWpjbTJubHZ5UUMwcTlX?=
 =?utf-8?B?RXo0bFNKZEI2NUhTc2RDTFJjQTNlcENOQWVMUzVrNDhUaE5JNnFIZVpZZkQ5?=
 =?utf-8?B?bkRpT0FhSXAwOXVFZEh2SWVUUHJCellvd3FrU1lwRXRDVzdKMFY2NEhQMkZy?=
 =?utf-8?B?czZDTHZxYk5ZTG5RbUFHTDJDa0lmWUZ2S0RRLysvRFB2b2x0dVBnMTlJdjZn?=
 =?utf-8?B?UmUvTVV0Q2RZN2lUZ2RHbnF0eTFSMTk5NERMcFBKUUJwclJLMDg2TUErR1Zy?=
 =?utf-8?B?ZktkWHNKVjZhMndCcG94SnI4bkZHZU1HbG5ueXo0OFN6czRFZHZOVEZyVnA0?=
 =?utf-8?Q?77uGj+7lldDq7Ph7M5uxaF2bf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6899912-5ef8-4e3e-8673-08de237c033b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 12:47:47.3308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAF++g9O0pw0dJDaPqViBxf1hanZgEyLMsHtzyT/BtKym2jo2Y6kkNJX5DVkCc/Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7518
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> Until now ttm stored a single pipelined eviction fence which means
> drivers had to use a single entity for these evictions.
> 
> To lift this requirement, this commit allows up to 8 entities to
> be used.
> 
> Ideally a dma_resv object would have been used as a container of
> the eviction fences, but the locking rules makes it complex.
> dma_resv all have the same ww_class, which means "Attempting to
> lock more mutexes after ww_acquire_done." is an error.
> 
> One alternative considered was to introduced a 2nd ww_class for
> specific resv to hold a single "transient" lock (= the resv lock
> would only be held for a short period, without taking any other
> locks).
> 
> The other option, is to statically reserve a fence array, and
> extend the existing code to deal with N fences, instead of 1.
> 
> The driver is still responsible to reserve the correct number
> of fence slots.
> 
> ---
> v2:
> - simplified code
> - dropped n_fences
> - name changes
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  8 ++--
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 11 +++--
>  drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  5 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 47 ++++++++++---------
>  drivers/gpu/drm/ttm/ttm_bo_util.c             | 38 ++++++++++++---
>  drivers/gpu/drm/ttm/ttm_resource.c            | 31 +++++++-----
>  include/drm/ttm/ttm_resource.h                | 29 ++++++++----
>  7 files changed, 109 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 326476089db3..3b46a24a8c48 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2156,7 +2156,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
>  	uint64_t size;
> -	int r;
> +	int r, i;
>  
>  	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
>  	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
> @@ -2190,8 +2190,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.high_pr);
>  		drm_sched_entity_destroy(&adev->mman.low_pr);
> -		dma_fence_put(man->move);
> -		man->move = NULL;
> +		for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> +			dma_fence_put(man->eviction_fences[i]);
> +			man->eviction_fences[i] = NULL;
> +		}

That code should have been a TTM function in the first place.

I suggest to just call ttm_resource_manager_cleanup() here instead and add this as comment:

/* Drop all the old fences since re-creating the scheduler entities will allocate next contexts */

Apart from that looks good to me.

Regards,
Christian.

>  	}
>  
>  	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 3148f5d3dbd6..8f71906c4238 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -651,7 +651,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>  	int err;
>  
>  	man = ttm_manager_type(priv->ttm_dev, mem_type);
> -	man->move = dma_fence_get_stub();
> +	man->eviction_fences[0] = dma_fence_get_stub();
>  
>  	bo = ttm_bo_kunit_init(test, test->priv, size, NULL);
>  	bo->type = bo_type;
> @@ -668,7 +668,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
>  
>  	ttm_bo_put(bo);
> -	dma_fence_put(man->move);
> +	dma_fence_put(man->eviction_fences[0]);
>  }
>  
>  static const struct ttm_bo_validate_test_case ttm_bo_validate_wait_cases[] = {
> @@ -732,9 +732,9 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>  
>  	spin_lock_init(&fence_lock);
>  	man = ttm_manager_type(priv->ttm_dev, fst_mem);
> -	man->move = alloc_mock_fence(test);
> +	man->eviction_fences[0] = alloc_mock_fence(test);
>  
> -	task = kthread_create(threaded_fence_signal, man->move, "move-fence-signal");
> +	task = kthread_create(threaded_fence_signal, man->eviction_fences[0], "move-fence-signal");
>  	if (IS_ERR(task))
>  		KUNIT_FAIL(test, "Couldn't create move fence signal task\n");
>  
> @@ -742,7 +742,8 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>  	err = ttm_bo_validate(bo, placement_val, &ctx_val);
>  	dma_resv_unlock(bo->base.resv);
>  
> -	dma_fence_wait_timeout(man->move, false, MAX_SCHEDULE_TIMEOUT);
> +	dma_fence_wait_timeout(man->eviction_fences[0], false, MAX_SCHEDULE_TIMEOUT);
> +	man->eviction_fences[0] = NULL;
>  
>  	KUNIT_EXPECT_EQ(test, err, 0);
>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> index e6ea2bd01f07..c0e4e35e0442 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -207,6 +207,7 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
>  	struct ttm_resource_test_priv *priv = test->priv;
>  	struct ttm_resource_manager *man;
>  	size_t size = SZ_16K;
> +	int i;
>  
>  	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, man);
> @@ -216,8 +217,8 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
>  	KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
>  	KUNIT_ASSERT_EQ(test, man->size, size);
>  	KUNIT_ASSERT_EQ(test, man->usage, 0);
> -	KUNIT_ASSERT_NULL(test, man->move);
> -	KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++)
> +		KUNIT_ASSERT_NULL(test, man->eviction_fences[i]);
>  
>  	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f4d9e68b21e7..0b3732ed6f6c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -658,34 +658,35 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
>  EXPORT_SYMBOL(ttm_bo_unpin);
>  
>  /*
> - * Add the last move fence to the BO as kernel dependency and reserve a new
> - * fence slot.
> + * Add the pipelined eviction fencesto the BO as kernel dependency and reserve new
> + * fence slots.
>   */
> -static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
> -				 struct ttm_resource_manager *man,
> -				 bool no_wait_gpu)
> +static int ttm_bo_add_pipelined_eviction_fences(struct ttm_buffer_object *bo,
> +						struct ttm_resource_manager *man,
> +						bool no_wait_gpu)
>  {
>  	struct dma_fence *fence;
> -	int ret;
> +	int i;
>  
> -	spin_lock(&man->move_lock);
> -	fence = dma_fence_get(man->move);
> -	spin_unlock(&man->move_lock);
> +	spin_lock(&man->eviction_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> +		fence = man->eviction_fences[i];
> +		if (!fence)
> +			continue;
>  
> -	if (!fence)
> -		return 0;
> -
> -	if (no_wait_gpu) {
> -		ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
> -		dma_fence_put(fence);
> -		return ret;
> +		if (no_wait_gpu) {
> +			if (!dma_fence_is_signaled(fence)) {
> +				spin_unlock(&man->eviction_lock);
> +				return -EBUSY;
> +			}
> +		} else {
> +			dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
> +		}
>  	}
> +	spin_unlock(&man->eviction_lock);
>  
> -	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
> -
> -	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> -	dma_fence_put(fence);
> -	return ret;
> +	/* TODO: this call should be removed. */
> +	return dma_resv_reserve_fences(bo->base.resv, 1);
>  }
>  
>  /**
> @@ -718,7 +719,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  	int i, ret;
>  
>  	ticket = dma_resv_locking_ctx(bo->base.resv);
> -	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> +	ret = dma_resv_reserve_fences(bo->base.resv, TTM_NUM_MOVE_FENCES);
>  	if (unlikely(ret))
>  		return ret;
>  
> @@ -757,7 +758,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  				return ret;
>  		}
>  
> -		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
> +		ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu);
>  		if (unlikely(ret)) {
>  			ttm_resource_free(bo, res);
>  			if (ret == -EBUSY)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index acbbca9d5c92..2ff35d55e462 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -258,7 +258,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  	ret = dma_resv_trylock(&fbo->base.base._resv);
>  	WARN_ON(!ret);
>  
> -	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
> +	ret = dma_resv_reserve_fences(&fbo->base.base._resv, TTM_NUM_MOVE_FENCES);
>  	if (ret) {
>  		dma_resv_unlock(&fbo->base.base._resv);
>  		kfree(fbo);
> @@ -646,20 +646,44 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>  {
>  	struct ttm_device *bdev = bo->bdev;
>  	struct ttm_resource_manager *from;
> +	struct dma_fence *tmp;
> +	int i;
>  
>  	from = ttm_manager_type(bdev, bo->resource->mem_type);
>  
>  	/**
>  	 * BO doesn't have a TTM we need to bind/unbind. Just remember
> -	 * this eviction and free up the allocation
> +	 * this eviction and free up the allocation.
> +	 * The fence will be saved in the first free slot or in the slot
> +	 * already used to store a fence from the same context. Since
> +	 * drivers can't use more than TTM_NUM_MOVE_FENCES contexts for
> +	 * evictions we should always find a slot to use.
>  	 */
> -	spin_lock(&from->move_lock);
> -	if (!from->move || dma_fence_is_later(fence, from->move)) {
> -		dma_fence_put(from->move);
> -		from->move = dma_fence_get(fence);
> +	spin_lock(&from->eviction_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> +		tmp = from->eviction_fences[i];
> +		if (!tmp)
> +			break;
> +		if (fence->context != tmp->context)
> +			continue;
> +		if (dma_fence_is_later(fence, tmp)) {
> +			dma_fence_put(tmp);
> +			break;
> +		}
> +		goto unlock;
> +	}
> +	if (i < TTM_NUM_MOVE_FENCES) {
> +		from->eviction_fences[i] = dma_fence_get(fence);
> +	} else {
> +		WARN(1, "not enough fence slots for all fence contexts");
> +		spin_unlock(&from->eviction_lock);
> +		dma_fence_wait(fence, false);
> +		goto end;
>  	}
> -	spin_unlock(&from->move_lock);
>  
> +unlock:
> +	spin_unlock(&from->eviction_lock);
> +end:
>  	ttm_resource_free(bo, &bo->resource);
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index e2c82ad07eb4..62c34cafa387 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -523,14 +523,15 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  {
>  	unsigned i;
>  
> -	spin_lock_init(&man->move_lock);
>  	man->bdev = bdev;
>  	man->size = size;
>  	man->usage = 0;
>  
>  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		INIT_LIST_HEAD(&man->lru[i]);
> -	man->move = NULL;
> +	spin_lock_init(&man->eviction_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++)
> +		man->eviction_fences[i] = NULL;
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_init);
>  
> @@ -551,7 +552,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  		.no_wait_gpu = false,
>  	};
>  	struct dma_fence *fence;
> -	int ret;
> +	int ret, i;
>  
>  	do {
>  		ret = ttm_bo_evict_first(bdev, man, &ctx);
> @@ -561,18 +562,24 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  	if (ret && ret != -ENOENT)
>  		return ret;
>  
> -	spin_lock(&man->move_lock);
> -	fence = dma_fence_get(man->move);
> -	spin_unlock(&man->move_lock);
> +	ret = 0;
>  
> -	if (fence) {
> -		ret = dma_fence_wait(fence, false);
> -		dma_fence_put(fence);
> -		if (ret)
> -			return ret;
> +	spin_lock(&man->eviction_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> +		fence = man->eviction_fences[i];
> +		if (fence && !dma_fence_is_signaled(fence)) {
> +			dma_fence_get(fence);
> +			spin_unlock(&man->eviction_lock);
> +			ret = dma_fence_wait(fence, false);
> +			dma_fence_put(fence);
> +			if (ret)
> +				return ret;
> +			spin_lock(&man->eviction_lock);
> +		}
>  	}
> +	spin_unlock(&man->eviction_lock);
>  
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_evict_all);
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index f49daa504c36..50e6added509 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -50,6 +50,15 @@ struct io_mapping;
>  struct sg_table;
>  struct scatterlist;
>  
> +/**
> + * define TTM_NUM_MOVE_FENCES - How many entities can be used for evictions
> + *
> + * Pipelined evictions can be spread on multiple entities. This
> + * is the max number of entities that can be used by the driver
> + * for that purpose.
> + */
> +#define TTM_NUM_MOVE_FENCES 8
> +
>  /**
>   * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
>   */
> @@ -180,8 +189,8 @@ struct ttm_resource_manager_func {
>   * @size: Size of the managed region.
>   * @bdev: ttm device this manager belongs to
>   * @func: structure pointer implementing the range manager. See above
> - * @move_lock: lock for move fence
> - * @move: The fence of the last pipelined move operation.
> + * @eviction_lock: lock for eviction fences
> + * @eviction_fences: The fences of the last pipelined move operation.
>   * @lru: The lru list for this memory type.
>   *
>   * This structure is used to identify and manage memory types for a device.
> @@ -195,12 +204,12 @@ struct ttm_resource_manager {
>  	struct ttm_device *bdev;
>  	uint64_t size;
>  	const struct ttm_resource_manager_func *func;
> -	spinlock_t move_lock;
>  
> -	/*
> -	 * Protected by @move_lock.
> +	/* This is very similar to a dma_resv object, but locking rules make
> +	 * it difficult to use one in this context.
>  	 */
> -	struct dma_fence *move;
> +	spinlock_t eviction_lock;
> +	struct dma_fence *eviction_fences[TTM_NUM_MOVE_FENCES];
>  
>  	/*
>  	 * Protected by the bdev->lru_lock.
> @@ -421,8 +430,12 @@ static inline bool ttm_resource_manager_used(struct ttm_resource_manager *man)
>  static inline void
>  ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>  {
> -	dma_fence_put(man->move);
> -	man->move = NULL;
> +	int i;
> +
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> +		dma_fence_put(man->eviction_fences[i]);
> +		man->eviction_fences[i] = NULL;
> +	}
>  }
>  
>  void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);

