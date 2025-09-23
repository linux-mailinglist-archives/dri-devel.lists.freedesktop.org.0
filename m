Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3524BB95F7C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 15:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D897B10E128;
	Tue, 23 Sep 2025 13:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pvl2tP6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7BA10E127;
 Tue, 23 Sep 2025 13:12:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sinYgrRPUFcwv3PCJAEpcRP+u0u7cQpFiBs7fcYKk2h5SIUT9W6Kl7rHL1ZhtvIW0AVAVMu6WoyOYHCNA6ES1K97K7X/4/MpMAYC4uxmfqRqZdasTxpS9ziRCTejIssm/UyldHaDgC03qWJmKvDClWou/rKiPDloaPfMsbQvV4p5UyfSUZbhhSKmS0lmiP6HtoiMCijDN+P/B6u6PK9DGTgnLZaH0DzQz9HG7+OP/VmPRgXurryXMPGdUsyB7Fanxesp+LPavvFhN/sVJV5vVSeF9Xauvwf51TaA3xJ5S1D70qjT+aAnvDO56516wDdZNB4xy29ir/WfXyLGpjfg7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boa9cuRGIJEMqeFwEhZCQYnBgeWY+ZkqtiPaUU4P6jw=;
 b=SikLdrnZ/4IwSyaQJLy/hDnqkfoOBVgzBJhmodOFGSYjEhmakmZFxteeCr1A6dupENPDaYvL+I2h9sYMfEDaFRlwLulA5VzEs7ipJR+drBQFS3sreO1UN/JeTTHuL+uy270GePKYQkOxDLgEO770nvCvTVjK7huhHRd2pbivWp5QRgNxny/VTTmgZI1SFQLmPca3DrVzVBeODwEeVapl/aPh3bv5Y4KbzpQ3N2AH18teble5SVBtHltPcZmyJSqL/4Zy5ERfDjZ6sTiIQjP1+oZ6lMaUXNr8jqPsTDG20BCEItbJCiBi24rCFPleJzTJQ4iRLpGwvYeJDEGYjp50qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boa9cuRGIJEMqeFwEhZCQYnBgeWY+ZkqtiPaUU4P6jw=;
 b=Pvl2tP6tT0+IMVZoC9oC5STiDvmFK+pJopQdzPq9zL13gBBZ8A9PGgfFYVy3NI0ag/So2nz6uXgDigxqxHt6HTYBth9rFlwBPz0hh3PUmUdYLvY2EcPKJvEESheRCCelcFpLVlUhv74iAJom1VVmmsUMlcF4k7b5x//qXfWHNBq56GK0Le2cEr+TfMu6R9P6BqStYVS4s45FjkalPl92Vv2ybQEBj5UX2nQRg0Yy4Vr2kthrj3WGIAkO4PwBKxuPlmVqENh3TKAWfsGnzSW/vPFb+wrLWIUdv4cXcD1Q1XRLbxFabQrVyqcF2SNMCJfl5/VoZKwhavcOML/Pep+19g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 23 Sep
 2025 13:12:50 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 13:12:50 +0000
Date: Tue, 23 Sep 2025 10:12:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250923131247.GK1391379@nvidia.com>
References: <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
X-ClientProxiedBy: BN0PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:408:ee::28) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CH3PR12MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: bd005bce-b8d6-432a-3391-08ddfaa2e55c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXR5aG1PN3RUNVB5Y1BMN3VubU5nNmxDK0hnM2prUXYvcXc2RjlGOGU2RmVU?=
 =?utf-8?B?UnVsdDlxMDl4RzhFb3Qwa1dhWVVUU0VQUFlXWGswbHdWMUh1REdRa1d4Y3B2?=
 =?utf-8?B?VkFJVGpNMkZEM3l6VFdWRkJoNTBRN2VZblRhMWhXN2NEYUhOSEdnSklXYU5V?=
 =?utf-8?B?bWZ5SThLL1RSTWMvVmZKeWZFYm51a2VzVWY2K29SSmxOVFp5S3dzRXFpMC9t?=
 =?utf-8?B?NWlSNG9ZMXpxcHc3ZitiU3FaY0NaTnJMRlNLVEE5dUoyU3NhYWZUZks5QXFz?=
 =?utf-8?B?UEhraXNKclZSZ1AzQUxWaU1lZGoyMllydGhwZzlRa25rYjJRM3VyU0Z1NXBr?=
 =?utf-8?B?a2NOMWJkRFcwbW83RmVQTzA3VTZzdXdxaU96THF0L3RNVlZveGhDUS82NHlo?=
 =?utf-8?B?TVlWYllHT1BrS0ZCR3pFc0oza0J3T2d5aHFqWmd3K0liZWRRQjVZWkJNYW9L?=
 =?utf-8?B?N3BQamIzTnVkV0lxWTZmOStuTElIZFREUFJmM0IzSVFuSjdMVGZXZWRFRElQ?=
 =?utf-8?B?bWpHMjBPMkFHcFBBZkdad1RFTGNnRHBRbmsyNEZMK2wxbURRUFZ5dG9LSFdN?=
 =?utf-8?B?SmJpNGthd3IxK2lKTys4N21iUyt5cGVFU2dsVlJTOERxbzRTWFdweE12ZmJB?=
 =?utf-8?B?TDBOaTJBZTVZTTdUYUVuMHZmS0VyNGIyWWJxMDZhSmlzOE8rSjlYdWl6aFJa?=
 =?utf-8?B?RDRCbEpjVlh1c3VuR2grRWFweFVXMCt3V2JiVjVoalpIUTFWRlFXY1hMV2dt?=
 =?utf-8?B?UG1jcENCdnV2WGNXcTRmcEEzeVVGNy9RamcvUnV5bVVsQkg4aE5ESXpuVk1C?=
 =?utf-8?B?UmZnZFdiOFlFcGdwMFI3WHErdzNoS0swbzVTeGkvWlJoT2VhMGVRVEo5dDBa?=
 =?utf-8?B?U05HajMwYUtOZWVxK0owcFlvbmRBZXVIaWQvTkRubVVjSG9BTlNRT3lwRkww?=
 =?utf-8?B?dFpoc3oveGxtU2VLejQ5cEd0dGJkcngvQmdVMm0rTUZCN2NqRFdEQTZjWTFJ?=
 =?utf-8?B?Z0kvWWZIeUNDN2F0Uis3OWVibzdSVGd1NEVIUnhNUkRnYlNGeEhudHJjSU9B?=
 =?utf-8?B?dGIwR3pGTUpCRXNzK3RXQjErVE55YVZRaHhiNzEyVmMxcGI0WEFzMzhQTVJw?=
 =?utf-8?B?MElTZHo2c1Yxb3ppZlV5dFUvTzNvaXZiSE5FZTlUSk8yT3VHOWQ3ZHFYcU80?=
 =?utf-8?B?aDh5TFJGQkh1ZStXME9PZ2I5ay9aSjFjMW15YVZjYkpGRmlpMEpmRE5FUlpT?=
 =?utf-8?B?RFMyQ2JDTm9ubU9jZk0waG50MmlLaWFzTFMvcE5GcTBVWVB4MTZnak1LMFNo?=
 =?utf-8?B?aGE3czkzaExGTXFrWTYxTG9rY2Z4K2JPQ3ZWSU50eW5IdmFmbXlmekJ6Vm9l?=
 =?utf-8?B?MjMveTBadHZpM0p5NmYwZzd2aVlDay9kK2hoYkZkTDREczdhOWtVQnF1NnJu?=
 =?utf-8?B?aVJDQ1A0QjJRRFQ5T015bW1kNFdBYTZDdms0NG1DeHN5S1BhSGRRaFE5b0Fw?=
 =?utf-8?B?MzB0MDA3a1lnaGJrMUVHVWpvb2lKYVBTV29kNlFWa1B1aElSZEczVHFhbHFX?=
 =?utf-8?B?THcvRDRJNDgwY29HSkV6S2xWUldETk5ZMitndHJIRzBlczRjQzRqTXpwUTdC?=
 =?utf-8?B?dlBJc0o5QXJpOTAySTRBMklULzJ1QmtJSnkrUW9pMU5WNDRmZWZIRE8xTXNL?=
 =?utf-8?B?ZklBVzVZLzhpUk9XRytCRC9NQ2RVdGFHd2VycW5UVmJlV3c1TWphaHU2ZC9u?=
 =?utf-8?B?aXg1VXRpdExFRVJwSzFQU3JudCt2MmdUS0JtWENwbVg3RGpoUjB1LzhWRHVy?=
 =?utf-8?B?akhGRi9QeDZ0dXB5S0xnQkJxdGxMaTI0a2FKQXJ2eHNVUm1hL2xLdk41U1NR?=
 =?utf-8?B?UUVtVG1WelBRcm1TM2ZXRWZkTTBwa055b0MzeGVwbTFNMFZLVzF6SVdZTWNS?=
 =?utf-8?Q?pQJiRd52Q1E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFhGQUxzYzZ1RURwN09mbTM4Z2ZTMXMvR1dvK2N4Uk5JSElVYUw2b0pkWGg3?=
 =?utf-8?B?YW5TVlI4ZDd0UUdabVBZMzk1dnN2SjNXUlhoc3N3WUVyZWgvV2Y2MERiaDJo?=
 =?utf-8?B?MEpQNjRzVjNjMXBGb0orOXJHbVNsSGNaQi9MSVRyRlRucEp0L3RzVHphdHFt?=
 =?utf-8?B?TVI1N3J2cHkvTFNBS3VYZHRYOCtsMVNFS3lvNm0wVDFNL0JjOUs4Q2J1UVh2?=
 =?utf-8?B?QkVibFMrMjN1dnNBbTQ0bW91ODl3K1lJWEV1QnVWaDV4OW9QMmFjU0NWanFS?=
 =?utf-8?B?UGxNcWhnVTVkRDk4QnFQM1M5QUM1czlaSWh3RzlYNUdZcnplVDBlY2loYnRY?=
 =?utf-8?B?TmtUZmR6Y0RpZ0N3ZE5lekxlYzZEZmE3S2ZUQnNtZ2dQRFAvUkU2cWdLaXJa?=
 =?utf-8?B?Z0dqb0FNYmQ2Q2w0R2JlZWlzR1hBMWJPR1pscEpDN1NPbUdwRWFhbFpTaGtL?=
 =?utf-8?B?amw3U0F2UFVoaUhRNEZzMFQ5WWdmWFhaYUVleW1tVnZ5ZE5ITm9PRTlHS1cx?=
 =?utf-8?B?RHZUQlFnVG9UcFkrQ3duTHpMSXhlTmlJQ011a3ZraUxHQ2tTSTR4MjIvSGx4?=
 =?utf-8?B?TlpiNE05TEcyQ1gyRDlZeWxSblRodnlaYVk3RFZoRk5NRUxEYVhWNUp6amE4?=
 =?utf-8?B?dHJ0Q1paYUJ3RXljOUx1YjZiYytrYzhIY2RBWHV4Q0ZDbmFMSU14ZUhvNUQ0?=
 =?utf-8?B?UklUSTQ1S1dNSlIyaHRXWjQyL3MvUGhEVXk3Y1RvTWJxaGxkb2JSYVZLWVNq?=
 =?utf-8?B?a1Vsb3VKQ1lhem02WjUydm5GTWMvTEUrMHBNakh2ZmxmS2RKRmpYMTc5Y3Jq?=
 =?utf-8?B?K0FnclZ6TEloRlNOa3R1dlpOZy9CbzhyTkNwaEFZTUpJcGNUQ0JxRWxYbG5m?=
 =?utf-8?B?K25qbFV4UVlZOFlkcTZxVVNSaWhUNi9VU1o1Njk5Mk01Tyt6QVo3YjJwaTJw?=
 =?utf-8?B?Y2lIcmFXZkp4d3VEMVlia2ZVZHBKN3VGZ1AxZXEwdUl2YUoxWDUwNlIzYkZl?=
 =?utf-8?B?ZVQ2dHhFZ3Z4V1ROOG9FUUlqb2daOVpTSUdFZWpHMkdXL2x3QzN2dDk1QzJH?=
 =?utf-8?B?WWhybzdtZ0pQVVRxRlkrSWNiNnNsSHVLdmZIRlVaQUIvZ1AyWW1NRytHQVZV?=
 =?utf-8?B?YThsK2h4YWNqSFRuVGFHSGw3RXN5dVVkSUhyZXRNSmxmeGlMRURQWkFUdUt5?=
 =?utf-8?B?N2diT1pWeGs5MWlwWm9wSnpxTVMyYkhIVEcrM2xadVlJZ3dpZlBxclorbVNS?=
 =?utf-8?B?VGd6MTRkWHRIL3FHSWFkTG1YcGNYbVRPTzAxQy82czNSR1dlYWZOYWo3REg1?=
 =?utf-8?B?TG1YcjdGbm54em5SZjF4d3FHVDlwejQzd05TTCtGS2lyRW0rZU5nRjYrSGJG?=
 =?utf-8?B?c012dXI1Z1ZKOHNoQlViNktRbkNYWHNGeHRPbTBsbVBZeENrTmhZM2ZRRHhO?=
 =?utf-8?B?UzRsN29qS2lzb0t0YzA4QlppRnd0YXgxTmFWOVFKYmo4NXMrM0xVMUhHcVVo?=
 =?utf-8?B?RzM3bE9yNlJzU05ZVjVrZkYzQzJpRnZMUlRzMGgwTkFqSTl6dFRrL1NtSExP?=
 =?utf-8?B?YkZxekdadUJrdG5UTGo0N0xveDIxalYwc2dSUE5qbUVQOHVJS2VpcDBwQ2pn?=
 =?utf-8?B?UWJjdzZFMTVoRG0ycGNucnpyYU9veFJZSkVvUTlUREZxSVRLQlZJanFHNjAr?=
 =?utf-8?B?dExyeFpGUm1XU1pXTU1FQ1h5c2EzQTQwazdpUVQrYVFSN2NDVjgrazR3UXFB?=
 =?utf-8?B?MHFhTWVtZjJVYjJRVnZGbUtUbTBON0RYb3BCOHZHMERLZmZnaHVzV3NGaGNI?=
 =?utf-8?B?dlg0eWI3WXRaM2NxZEFhcGJYVC8zYm9QMld4TlEvMnNZSXBSYmcxbjA3aUZ0?=
 =?utf-8?B?czZGbjc4amJsc3ZJZXFuViswR2piSHVrMHJpc0czME9TdkN1THFBTldtSC81?=
 =?utf-8?B?dWlaSG9kWlRnL1Jtc1FqZklzM25OKy90ekUvMHBHT2M4SllHUk5PT2Q0UWh1?=
 =?utf-8?B?YXVzbitCRnc3MzRaaWlGWGp5UzVoRzgyU2pzeWhSZFRRZXFYbzB4ajhMWjRQ?=
 =?utf-8?B?Tm4xZGlkc0NET0dmNUl5VjVPU1RlbDNWUkhudmVkUHpPckpVSUVjSkVUbnhB?=
 =?utf-8?Q?Qtcd1lQFau4BpWLVXOZVtOwfV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd005bce-b8d6-432a-3391-08ddfaa2e55c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 13:12:49.8225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NN+bt1SZ62yXtSUemp9ew+DzmT9DEnjYeuecPm8sKOjyYlDxVHnMfEOa6S38fp6v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9730
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

On Tue, Sep 23, 2025 at 02:45:10PM +0200, Christian König wrote:
> On 23.09.25 14:15, Jason Gunthorpe wrote:
> > On Tue, Sep 23, 2025 at 09:52:04AM +0200, Christian König wrote:
> >> For example the ISP driver part of amdgpu provides the V4L2
> >> interface and when we interchange a DMA-buf with it we recognize that
> >> it is actually the same device we work with.
> > 
> > One of the issues here is the mis-use of dma_map_resource() to create
> > dma_addr_t for PCI devices. This was never correct.
> 
> That is not a mis-use at all but rather exactly what
> dma_map_resource() was created for.

No, it isn't this is a misunderstanding. It was created for SOC
resources only. I think HCH made this clear a number of times.

> If dma_map_resource() is not ACS aware than we should add that.

It can't be fixed with the API it has. See how the new VFIO patches
are working to understand the proposal.
 
> > We have many cases now where a dma_addr_t is not the appropriate way
> > to exchange addressing information from importer/exporter and we need
> > more flexibility.
> > 
> > I also consider the KVM and iommufd use cases that must have a
> > phys_addr_t in this statement.
> 
> Abusing phys_addr_t is also the completely wrong approach in that moment.
> 
> When you want to communicate addresses in a device specific address
> space you need a device specific type for that and not abuse
> phys_addr_t.

I'm not talking about abusing phys_addr_t, I'm talking about putting a
legitimate CPU address in there.

You can argue it is hack in Xe to reverse engineer the VRAM offset
from a CPU physical, and I would be sympathetic, but it does allow
VFIO to be general not specialized to Xe.

> The real question is where does the VFIO gets the necessary
> information which parts of the BAR to expose?

It needs a varaint driver that understands to reach into the PF parent
and extract this information.

There is a healthy amount of annoyance to building something like this.
 
> > From this thread I think if VFIO had the negotiated option to export a
> > CPU phys_addr_t then the Xe PF driver can reliably convert that to a
> > VRAM offset.
> > 
> > We need to add a CPU phys_addr_t option for VFIO to iommufd and KVM
> > anyhow, those cases can't use dma_addr_t.
> 
> Clear NAK to using CPU phys_addr_t. This is just a horrible idea.

We already talked about this, Simona agreed, we need to get
phys_addr_t optionally out of VFIO's dmabuf for a few importers. We
cannot use dma_addr_t.

Jason
