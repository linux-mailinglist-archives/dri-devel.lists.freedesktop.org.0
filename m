Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2cz+Cw+ec2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98FA7834A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86F10EB38;
	Fri, 23 Jan 2026 16:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CMV2LkME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010021.outbound.protection.outlook.com
 [40.93.198.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0616110EB3E;
 Fri, 23 Jan 2026 16:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJPX8dg+0pxapsHUAvuKrxxxoJDGVpDVVCoAU1QI1C5SVIELB77zmYeLIbQgH+mcW8Rkzmf3I1Pcomw0Ubq0rWMs87r68cFi3Pn8PFUH7EZt+vrLnupHGYZQ9wwlcQFrVoOCUjYCrh/PmkzhjfD3sbIh1diTzOfcojD9x7eCGdRgp9huCpdWeHF5UTYBuxGx8SEh54UyIrwDo5Vghgf1nRhr1ycxQUNuYWxpo/sSqmt8Cl2kC5ACqSrH8im/2se35H20Y0Txl42GcTtLY6iJtEf3EXk2YV6z6irPeDmsPf6aC61+thlXZFdYJ870PAkGM/STtKcbCdabH8c3D5Evwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wT48aWW/W+f44/Tm48BQ3IXWD/aWUqqtli06mbPdc20=;
 b=s3+DEv1ymCt0p7JbghY0VKnhcqQlikHcBsRtt0AYhoCwA0IfErT+o884vS3bUVhkPla2ruDX34lu60XDj2yovzauIdrgJTCuT3SIUbTdJrwq9+XOjYik7ZmjgzetGil478y6UItkisJFrnfOUYzSPcNNlVXnbL0EAzQNI3Pm7+4iuQddeL6esQpZtR6FjCIHKzr61zOimzikX+6Xmpe+4zC3BGLQpQHjWiBg62SmR9e4ksXnHhu7eSq+xW4Dq6eHUgAuS03CbPUiyagkUDNb9CyxKEnROOQUYD6giXtdNLFWO/9azeTgUv8ynk8fD8uZUQ43Wx2YHHlTK2v4IMPZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT48aWW/W+f44/Tm48BQ3IXWD/aWUqqtli06mbPdc20=;
 b=CMV2LkMEzO1BpWVAfLQhRScDiwye7h/4fLCW/IlUJ5fFC7BHvP4/zylezaAGnzmrGGQMAy3evTYUD9x20m68f9VR7OJN8Lmb07o6vFyKItwoPWg34LNAOvms8TL1BPpi2GtlUPpdTpDC24cTravwV+EIQRKHEXGNh3cJ19OtKnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 16:12:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 16:12:53 +0000
Message-ID: <b9df6f55-3e29-4287-a7cc-4e369b35336d@amd.com>
Date: Fri, 23 Jan 2026 17:12:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: dri-devel@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <aXOJRWALUJLcGWqh@hal-station.localdomain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aXOJRWALUJLcGWqh@hal-station.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: 0750159e-36d3-4b43-410a-08de5a9a425b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnRDZi9NNVF1RzhDK2FWNmZwR0JRTkZ6dDdpRWc3bW9pQ3VsSFZIa2Q1N2Zx?=
 =?utf-8?B?K1NaZ3hXOHUycW1XMy9DME5tMWdBQ09xbVJFZFdrYmVTRmVBRHNXcGVvMDM1?=
 =?utf-8?B?cGFxby9vL3k4dmlNT0R5S3kwaTN0c0NNdWpBTVM1cDN2RExMVzV3LzlpVlpz?=
 =?utf-8?B?cnU3SGRmZm0wdHlpaXg0OENFVkN4Y0l3djlobWljaXozQ0V2ZnhOOTc3WEpQ?=
 =?utf-8?B?SU9HRjBQQW8yT25wckUyMnMyR0N0TEZOeU1qZWc4YWhFSjJyODlzdFFIVThY?=
 =?utf-8?B?UG9NN01ScHIrVFFZVXd6NXFjUkRiN05lazd0Z25EWTJJTUFNcEVqMTZKYnRi?=
 =?utf-8?B?TmdEOU5VVStVQnN6MWthUHlMNkpya09JMmRKRGdRWVdzaExWSjN5dXdjZmFE?=
 =?utf-8?B?SHBGZE1mQjlMMlhLanZEOUovT0V6WHpndTMxVUk3K1ZvRk4veU9YWHdUL01N?=
 =?utf-8?B?U1UySkJzb1hyU1FDelJkM3FmUlRGajRMZXRaOUFiMVdHREU4ZGVhclJhb3g5?=
 =?utf-8?B?MHRXYkJSSGI1SFNTVERaMkJwalFiRzN2eGFKWEl0czljV09CS1pvc2VTL0lL?=
 =?utf-8?B?a05iNWdGeTJHbXp1RHVWYzRnRXBXdjg1ai9QVk5JR29pL3BZVWhGTWtoUUUz?=
 =?utf-8?B?MDhXU0tIcDNsWVpteUtYQ2c5VDZWb2o4bEJZUXBUU0gxTGxyWjZqSVM4TzlF?=
 =?utf-8?B?N2J1ZHNLUEJndGhEZ3ZEZXBORm5KUmo4cG1OM09zSWFERElNQ25idXJ1KzYx?=
 =?utf-8?B?aDJnalJBS0xOYS9zeDM2amFYQlNWMGJBYkU3U1FwdytqMkhuZ2oxbmZkTms5?=
 =?utf-8?B?SXJhQjZ0YVdjaGEyS3NaMThSb0kvbGY0dDh6Z1pNVkdDcVJTKzNHWThpVmhL?=
 =?utf-8?B?RERYajdOWDJKdnVUdVFZMlRGWTVFTlAycU1JcklGcnVQUnQyR042OHpYU0xB?=
 =?utf-8?B?Nyt5MWRJdlhsTlZUWk5uRXpsL082Vk4rejA5THl6cmIxZmEwalJDYlZvVEN1?=
 =?utf-8?B?YnJMVllmdXVad3dUMzdBSlFSd05OVlNhdWQwMkFpbE8vT2ptZU5OQ3VlSFR1?=
 =?utf-8?B?Z1diUFZlaVNoM0R2UmFvVEppejFMYlhJUzdWTFJKSXdnWHNRT1FhYVA5bEI2?=
 =?utf-8?B?ZDc5MXgzY0twQ1dHc3lFdS91NFVLMU0zallib1dydWFMZWVvNk5Fdi9GOXNi?=
 =?utf-8?B?QWQ4OUxkOS9Lc0QwUFBVNG9YOFJyUlI3bmRrL05JYTVjYm1mc0FwZzF6NkRY?=
 =?utf-8?B?VENvbW1ZLzJKN1FBYm1aaFBGVGl3RXRXNDNYdVlteHBBU3VQVEZkWEYxbUIr?=
 =?utf-8?B?Z3cxVTNoYWZDNkd6eWprL3Jhc1NqSVRyUTN1Mmt5TjgvZWhaZ1ZIVkkvSGRJ?=
 =?utf-8?B?d2dvT1lkSEUyQnNHaFFPbmF1aWtuQy9QNXUwWDlNTW04VXNrclR6R0h5YWQr?=
 =?utf-8?B?T0l5bkRlMkNLYjErR0h5TGZHd0pxNXhFVUVBREdQZlJwY1VZWUxOSStnb0dS?=
 =?utf-8?B?Y3ZDL0dHOG5TdUZ5S3RhQ0dzMmlLZmZ0azV0U1FmT29LbFFOVk95U2ZraE14?=
 =?utf-8?B?aHpGbHFGWjNPVEVkR3BjeHZjTzN6N0hNK1orZUZrdTBvVjlBcTNMdm53WWx2?=
 =?utf-8?B?Q1FGNmpUcTcrSHF2UUlhZ215czZ3cWQxdHNQOUZzaTdOTlVyOGFGYmQzVGVF?=
 =?utf-8?B?VzZ5T3Vqc1VuV3VYaXdLM3R6NXZvSE5hN2ltbytOSFEza3VCeXF5UW5MSVB4?=
 =?utf-8?B?dDIrdGQ2MldXdTU4NURjY3lOVHpQeCtwazBLVGtxREx2MVUxOXQ4UDRFa3hj?=
 =?utf-8?B?QjhHbGoxNTZ2eHN1dXZGeFRHOEJnU1gyaWJqSjNLQWxxWG5qenB2bndMbjZL?=
 =?utf-8?B?cHdpR1hoT3Y3Tis1N3EvNURpYkN3QnpHbGFkVEdqQS9LRXp4RUtNa25PME1S?=
 =?utf-8?B?UXBOeVNZS0NWL0RjcmtMWlZQc1k3Z1JZQkwybk93Y3htRk12ZDdqdXFHZEtC?=
 =?utf-8?B?MXJEbmdsVzRuTXFlZ0k5N1A3K0RwQUtOUUpWeGZyNUxDTlpReks4ZkhMSEZE?=
 =?utf-8?B?T0lqSlNRU1dSY0hRVkFXenVRWUxuUE9hUDlDVHRpclNLMG9rM0RDbTY2MzN5?=
 =?utf-8?Q?ujDc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkFQeGY2S3FNbTVETnVFa3lMd1V5OWU0YW9wTzdvd3ZuZU9sbzU2ZmdSNDV3?=
 =?utf-8?B?VnVMd3JNM09FbS81NzQ2ZkcxbVBqS29NSW12dlVydnA5dC9SR2dYV3lRMEFz?=
 =?utf-8?B?WGgwdkcrUUM2MW40UDRaSGdXOHRQV0NxUFp4Z2x6eHQxa09HSmVGVk5veENj?=
 =?utf-8?B?VGVBRTBKUDhEeWcvNk0zTVVjTnRKYWV1MDVVMUNUNS9mM2Foanh1dDR3bWFJ?=
 =?utf-8?B?WmJyK1dGLzExK1doUmFvdnlLZWVPc3o1b3pqRXNDVE9Hc3NqVHNkZ0FzMDlG?=
 =?utf-8?B?cFNvN2pnV1M3YWV6ZFJucUUzZndaT0JvMW02a0o0aGJRZWo3NnJmT0E0dmZ2?=
 =?utf-8?B?ZktucndFSi82ZHJxSzB4VlFVZWZBOVVZMldMYlVkb25jckROU2J6L1EzODl6?=
 =?utf-8?B?OXFUMEY5L3NBTW1YTnYrK0pjeGlMY0hLSC9EYUR0bEJqNXdmanBQaUpTdUNr?=
 =?utf-8?B?eUJERGY3TnFua0E5Nk5LMzRxL1FielRISjY5ejF4ZU4wU0JoazFFZlFIajF3?=
 =?utf-8?B?V212Q0tvSDkxdjFuSjFKZEd1VjY2VDhaRVBqTkllUnd2Nk1hSWJHQmo1aVdJ?=
 =?utf-8?B?VGJhZ044bEhaNlF2aXMvcTQ5Nit2ZEptV3BtS0JFK0ZINmMrRmMrbmtmNkNw?=
 =?utf-8?B?NXlYTDlzbDZHY2VzQnAwRHV0VW4xbDIvdlhUQTRHOHJxL1BnS21ZU0NVdDRP?=
 =?utf-8?B?ZWJid2pYT0ZVNGF1T0hIR1NhQm9HK0VqQUI4UE1UNXZmd254ak1makZPVFZ5?=
 =?utf-8?B?YTEvM0ZOdm84Q0E3cklzVWU4YkppdTJhdytNODNDRklIWHhwUHdaT2VpRzFo?=
 =?utf-8?B?QnlrWGprbDFSSExhWmlQbjZyQnlpSFNUVEFCaVZBLzFiUlBobGdtRi8wb1Y3?=
 =?utf-8?B?bG9aUk43MzEyNk5adUxDWElsUGFlN3B6dGhPc0dmdHhjWnhnUmxpNlE0eXBV?=
 =?utf-8?B?clh0MTdFanM3c0dtU2JQRTlUbEZZdVpFOTArNitBaHJCY25BWG43dm4yeTJE?=
 =?utf-8?B?RHlBV0YybGtGUzQyMk5VY3greW5SZitYd1M4SmduMUc4OHhFUUdKT1J6SEY4?=
 =?utf-8?B?ei9xOEFkbndmR1BpTExyOXNaRFpGbkErd0xoMm5FVExPSk05aVBIYmlQVUlP?=
 =?utf-8?B?RXNYdHFHRG5tMkU3YmVKQkV4VWV1N25vbXM2UFpkZEVFMUlnSVJyTzFiR0Zi?=
 =?utf-8?B?bVVsWWx6eFYzSFlDYlMzaVlsaE9QbVoxTjNFREpiVWJZS1lYSHRhbVlHcWFs?=
 =?utf-8?B?RFk4YS9rTFFJdzNjSXdrMDdVQ2x0cG1QbEc5YmYyUlBYeVVUeURuZGJicWRk?=
 =?utf-8?B?MVBLQU45ZTVCZk9EeklhS2dYTFE0V0NYVGY3Z1lySXZkN0JNd0lmRUcyTHYw?=
 =?utf-8?B?R1l4SFVXaUcyMkcyaXRydC9GcDZGUy9qZUpjUEk3ZG5WOGxQVDNJdmc0TElv?=
 =?utf-8?B?V1ZzQmR5ZkZRTGNKZ1JiS1YzOEtGSUVGZDMvd3MyWVN0Vi9tVFZ5NDlPR05v?=
 =?utf-8?B?TXQ5NHJLcGwwYTRYTjdGOXhEQk1Vc2YvcTlibCttRVp0d3lvNXlIYXIwanNq?=
 =?utf-8?B?NFRka0NMSFBpOERRM1JHRWdEWmFVSFkvbFhRRTh4bUlQT25EOTZydzJGUTFZ?=
 =?utf-8?B?WEtPMitYSWpTUzZVaGdTSEoxRTVFcEZFbFpYaTNvSlE0WS80NmlmOGsrQ2pW?=
 =?utf-8?B?bzhjRkpyZDd6aG5CTmZ4UndOc0NUd0hEendYU1NYSVJGa2x6WmFUTmZRcm8z?=
 =?utf-8?B?ZmhHU2Npdmo3RjlPeTEvT3h4UjJndXl4aHBlNXpyZmFuQzN4WG81eGs0ZTdD?=
 =?utf-8?B?VEc5eWhEV00yTjRvTG4vak1ZaHFyMHNMZnpucUwzZldyaUxPU0dzQXJUMnFl?=
 =?utf-8?B?YUdZcVhxVXVoQk5kSjJXSWR5c1NicnVrSGJXMHJ1SzlFYlZQb1J3MHc1UkRz?=
 =?utf-8?B?ajJMSVlGWklUc1RLYndaYXZMK2s3WlZpM3NGVTlTTTVrWmNUZ3Q3aDVzMGFh?=
 =?utf-8?B?cWtneVB5aVpjT0UxcHQzZk00UEtjaXJaSmlXcTVNTWd5V2EreDlwaG50Rk1i?=
 =?utf-8?B?M3poSEo3OEp4a3krQjR5a3BHRmRYWkc0SWplTnFPNUdoU1VWS1piM2IyTHNY?=
 =?utf-8?B?YXQ5RVlnWUNmcjI0NWZOcEZKSmNCRFJuR0lBTnhiZG5KYXlZOFdLbnNXQTAw?=
 =?utf-8?B?bHVXb2JyQ1MvYkdwZnJtY0JreHErdmVEUnZpcDBSVWkrSy8zVC9YZ0pmUzlx?=
 =?utf-8?B?STErVzRERkJUK3MveEppeENIQnNWL3lxdFU2cTYyQWxOOFgycWdWMUh1NWZJ?=
 =?utf-8?Q?3NtgPoWec+KQKW5npw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0750159e-36d3-4b43-410a-08de5a9a425b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:12:52.7265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnZ6zIgYc1NyBbANs1cbtOjX/lfJy85HZmEHw+vBSMoY16eyIHdqHvzB0G7ZUvP/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C98FA7834A
X-Rspamd-Action: no action

On 1/23/26 15:44, Hamza Mahfooz wrote:
> On Fri, Jan 23, 2026 at 02:52:44PM +0100, Christian König wrote:
>> I can only see two reasons why you could run into a timeout:
>>
>> 1. A dma_fence never signals.
>> 	How that should be handled is already well documented and doesn't require any of this.
>>
>> 2. A coding error in the vblank or page flip handler leading to waiting forever.
>> 	In that case calling back into the driver doesn't help either.
>>
>> So as far as I can see the whole approach doesn't make any sense at all.
> 
> It appears that resetting display firmware is able to put at least a
> subset of these systems back into a consistent (usable) state. Though, I
> don't have a reliable way to reproduce the issue that I'm seeing so I
> can't say for sure what it boils down to.

Well there is no way to only reset the display firmware. So I'm not sure what you are testing here.

What could be is that the DC code has bugs and a normal ASIC reset unblocked some endless loop or similar somehow, but that is absolutely not the right thing TODO.

Regards,
Christian.
