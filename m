Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8028B94DB7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 09:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B02810E0D2;
	Tue, 23 Sep 2025 07:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ICcjIrK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010041.outbound.protection.outlook.com
 [52.101.193.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3469710E0D2;
 Tue, 23 Sep 2025 07:52:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCRi+KdrTg/th8d2VzAv+kfYGlEgNM1zjJdpWhUxZhdESerkro2m8P2RtpV97fPRlltL9Ns4h6eLLH6kriYqNdNBgqIeF2sBZsa/vex5KvIk31jnJiE/QhAyApQwzD/yPEo3/dxyK+o6haxnRt4CiEwfZwgF+MamFLedqIjGNCkKYP5eoAeoa/J8U7EuFzAUD+sbF3ovRfYV4gt2u025TJJRDGWjAl5lGJpSx41za/quLPxmIrQba6mWUVJ2vvLeKUyP2MdU5/f5GX/M9IYZCdNydHAM95rQaVQRh2F8JbZ7idwFxZSmaWWTIEZGlt0zY6MbN3YJMhoZJAqEc573wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBPeAnQwkgzS51gyA7o+2XNojjJDlGWLuFQRFkMBe1M=;
 b=BL4p2In/8wRQq8D0/pu/22ECZRPtK6NkNYD0BTtB5Edp+6s2N2xve/LEfhOh/2jFMaxiQ1oVdL3iEZ2rnVG7g4JUKJgDxn/hRZDllaupJkyK2Zk2Z6UgwO3knc5UMPzHd89DjE+rRnKYnYTm7Rdgp9I02FNXVHB/BDul0Sz4wroDorfeCpZle9svln1bvL6iznieBpAdCf2LKgHgjuWl2b0jCOSCgx52iQXt4nrIBjsba/JvdXOzD8bBarkwecotfRxukNk4Q9X5RvcQTOHLKSRdvSZL7OaIhzT9NM0lS8+CAc76jOZ/5LY78fbj31wgE7AOEKh+olbchVQHvsssBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBPeAnQwkgzS51gyA7o+2XNojjJDlGWLuFQRFkMBe1M=;
 b=ICcjIrK9ccH5HCHDl9p1erVBps05pAd/8ldktbK+DqFfsXKwgviJ4xQiK1zzD0xUbDps3tmN1tFvduS0XEFGlVQOVtPP37zuJeA8XQLCiafJWxdejPqBOScbrPQQqkt1NMU4AW2yKJnZqLmDvAXIkaIC5VoNOTJVqkVRRibM+f8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PR12MB9598.namprd12.prod.outlook.com (2603:10b6:610:2ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 07:52:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 07:52:08 +0000
Message-ID: <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
Date: Tue, 23 Sep 2025 09:52:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: Matthew Brost <matthew.brost@intel.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PR12MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e12350-4d93-4d29-1d4c-08ddfa7618d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFd4bG5WamhjWEh0ZVdFa0FkUzdnbXFqRTd4RTRPeGNmMmdqUlNKeE5wMThJ?=
 =?utf-8?B?SGhGU3RaZE05cDhISXZ4WEdvSFVvNnB2WUdNcnFxaElySzRSZmZVQ01sNWxn?=
 =?utf-8?B?TytzckNZb04zUTA4bVRSMEU3OExWRUxoWjY5Y1dFMlBGV2NleitYYXRjelRx?=
 =?utf-8?B?TXFVTTFKZUNMTXVpYk1qZTFFbjBhQVJ3Rm5WaXVpcDFraWxBbTN0cXZ3NGY2?=
 =?utf-8?B?NFd4SkhDbmhROXByTXY2dlNPMU1vWFVRWktSdEIweUVBaG9iME9nSjYzM2Nz?=
 =?utf-8?B?TDY3d2FEcTZ0c0VaVXN5NDRLdlh5L0h3cVRwWS9SbWJGSlQwN2lscTFyR2pC?=
 =?utf-8?B?VDFXZzZFUVZWWCthQnQrMTZSUFRRVTlORWc0ZFpHUi9XQXBqOFZRNWZGRFpB?=
 =?utf-8?B?NVlFV1BkbEd5YzhkRE9sVGRiVFlRUndSTXRYZURNYmRHVVFHREFOLzRnSVpN?=
 =?utf-8?B?Ump4aU96R3FyUDYybmVDdTZRUjJ4SzQ0M0E5Z2hzQStMUzdzdFU0VWdtU29a?=
 =?utf-8?B?TkRtTi92dm5iNm1uYUpjMGdaRWtxNTkxMUMxeFVnRjRKdXBLK1JYb3huV0tl?=
 =?utf-8?B?SVhnY09qNDFnTU0xeXVLMi9Hb2ZaU1d1em5XWVMwdytpT2Q0TmN1Q0RSaG5j?=
 =?utf-8?B?THo4a1JPdkxPSDVab1g0N1AvTWxMODRRenVLbVVTNHNrclFMd2Z0SUNGVjkx?=
 =?utf-8?B?K01WbVByYlYrV3ZNQ0p1REVyZTFGQm0wOXkvcXVKZ2djQXhKUTIydFMrSHJs?=
 =?utf-8?B?U1pFSTJKdUVhZmhreTFOQVF3MmxkaHlocXdnUHlnN1BsR2ovUEx6QlRBMzdt?=
 =?utf-8?B?emFCcFQ2aFhDcFJNeFFKeVJ0VTBpU2FrYzRuSTdrZ3J4Q0Evc1dwMWVKcUND?=
 =?utf-8?B?d21sYkRzb0NERWtYeEVadytTSmxtVGdpMkczdUs2YllqeU9XN2hLWTlOQ0Ur?=
 =?utf-8?B?azIzZEREMUtta2YrWVVESStsZWdWeUx3RVZETjh5RGQyZ3FybTc3eUZsT1Yx?=
 =?utf-8?B?ZnpROXVNNlMydTNjclJCVVl0YXhRSVVVazUzWG8yc1Y3TUdMcXRka0ZMMFQz?=
 =?utf-8?B?eFdUSjZPdGlOSTZUUUN4VHB0S0hYaUVnRW55Z0hTZkovMVpFTTZMU0JnYVpn?=
 =?utf-8?B?RFJrb2luSmxVZjl3R3l5UFN0bmNQZDduUGRrbzVHbFJVc054Vkczd3YyL05H?=
 =?utf-8?B?OUd6c0J2ZVVaaVJKeFZzS25JczFQRmljK3FyZTdwMWdja28zUEM0V2tVeGtu?=
 =?utf-8?B?R0o3c0U3MjFpWnloMWV5Q09KU092bXJ2K2J0c0p0Ymo1aEd4U01NMTVMelpy?=
 =?utf-8?B?WlNPZ2kyT2dibGRvUS91SlhDcThhOHMzQjc3TDU4SXNWd3VnWnQxQXVOaFVy?=
 =?utf-8?B?QXVjcUdpZXlPR3ljcmZyTUJQc2QrOXdxSFNkTDdmSzRxcXRVNEFZNlJDMmVn?=
 =?utf-8?B?WEx3aWJsQUNUSTMva3BkOUhpak1nYXpYOWZYNkQwbUtqWXcvdDJDS09pdU1I?=
 =?utf-8?B?cDcxYVN6L015eW04THF0RFpDTGN6bDBnUjA3eHpLU1o5UG8zUUoyRDF1L2pE?=
 =?utf-8?B?a3ZNcW9mMDh3SXI0QzlzV3V2VTlGUGtFMDFGSkI3UjhMRUk1Q1JWRVdkYk9F?=
 =?utf-8?B?ODBUd2pqOVZLTUFZZnR1cnBLUjV1TUZpd3laNFhTSDRweE1rbldYSEluc2NF?=
 =?utf-8?B?a1YrUUJoL3J3dzEwVzRJR3dVbFROVERHOGo1UFRYZi9XaDN2WkEzUGlqVjZG?=
 =?utf-8?B?Tk1BWkdHQlhwODVGMmxIbzg5ZWxaeVlJa1JvTFdaVUV1R3JvQ1BuYSs3VW9G?=
 =?utf-8?B?SHdqVmNRaFpyQ09jK1krdVBvcDJZQlVUc0Nta2lHakdNTTVFQVFWK05TWXlF?=
 =?utf-8?B?UkFwOGRzcy9TZEQ0U2hrclBxZlZTRE5ZL2Q5ZjVseFRQUkRGK29uczVXaVkx?=
 =?utf-8?Q?t4jk9DSz8zs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enJhSkN5dWxxMHJ0MnVjZ3JPWjM2MVF2MXZoU2xvT3RxKzQ1TzZialpjRkF0?=
 =?utf-8?B?RnJxN2gyMmJMVGEwalZzdmZNSFNPYW5Wd3R5alU5K0V3T0wxVTdXUXVKWVdI?=
 =?utf-8?B?a1FYUTU1L2hKbDRiSXJ3ZVpPdmtxUjVqcjRMVkZRbGFab1hqV0NPYlgveDdN?=
 =?utf-8?B?c1h3ZUhEQWpXSExOaUR1WXdwQ2tKVGg0SStaWlVzY2haVHlKc0VBZnJDQ0tZ?=
 =?utf-8?B?YnNLWVR6MkJLODl1RGJWWXZQRDhaWUhLeVlWdzJ4TlgyMUxVN0tvaGtQSFNJ?=
 =?utf-8?B?azM3OERvYXdwQlI3dmVTNnVHdXFuOWlwM3puNlBrNldINkc3SEcvdDRNY1dD?=
 =?utf-8?B?TGVHbW1mOWVjQUJRc3RiSWY1dDNVd1E5elBDUU5tZDZ6TlVvV0ZSREVDZlEy?=
 =?utf-8?B?ODNsQnNTSWxtNGovWmJzWUJLblp0OHFwclFTL2h5UkJ0VW92dlNDb0VYOWtP?=
 =?utf-8?B?WWRnUXlqekc0QTlzUXlEeWlEcFRrRFFyNXdCVklXNS9Ka0tmRTNDdVRnY1Rt?=
 =?utf-8?B?MkpwcmJRenVzT0NoMHFZUlFNQ0VJTE1ZOWd2L2psWXRpZVNRWTQ1MURZeW5n?=
 =?utf-8?B?ZU43Y08wbXdXTVpRKy9ZQXhmTlhGTTJxK2xaUmRKOVZ6VVF2UXlHN3ltR0t1?=
 =?utf-8?B?SmhSTUpWeVRUWTNISjBmelQ3QjlKRUNjQUs1YUE4VG82VnArVDhTVGNpajZT?=
 =?utf-8?B?YjRMdnF5LzJiSmRTQlBmblk0cG00SzZ6UHhiM244bjRIZUFLTUZ6dmMzM212?=
 =?utf-8?B?Z3BYbDNPM0Nnc01XUTYzUGlzUFBJbVR0Y1JDNjdlU3NLZXVHS09SZWg4cEV2?=
 =?utf-8?B?STNSb0tlNjNldzBkNmY2UTJpbkwwSXpNUTdiSXRZZkl1YzVvOEQyT3hCL3lD?=
 =?utf-8?B?eUljanlWM0Nxc003NWtZU0VESDFkeDRDV3Q4U2FVLzVSYmhSaGNQL3RtK25V?=
 =?utf-8?B?OEhDZ3B1UnpLc09zTkNUVFRuS1E2azBkMkNxbGs5Z3hlK25RZkF3cXdkblRZ?=
 =?utf-8?B?M3N2dEZWeWxIRkIwMkFYcFNzSE9mdWc4MDZxQVlQYVJWRFphYzJ3N2NwZng1?=
 =?utf-8?B?SjlxOEcxODJzWDU1TkhQS2lzUjBaN0l0K29icVJBVTMySXBUSjdOTGZsZVZC?=
 =?utf-8?B?STVNdzdmeHdUN1d3UUtGUnF2dWozcERzQWdCOFVRZGttK0wvSnpaOUxsZnNH?=
 =?utf-8?B?RE8ydjliVWhiWlcrTHpFYWpnNGJiRWVRcVlTWEVSZDVzZ0xCY2Q1OGVLNmdI?=
 =?utf-8?B?TTBJa3c1U21yY2JFU1pvQzNOWHFkUEdGT3hmaE5tOE45SDhWWUZJdWxadHVr?=
 =?utf-8?B?cWx0Wm9ZeXZJVGFDOVhsdlRIWnVocTVmR0FFK056SkZxMndsQmgvdW9JSnNT?=
 =?utf-8?B?OEQrQUxpcEhvSDFyMThsTnVDQ0JPQmp0dThocWxSV2dQVEVIVWpWQ2ZXdTgy?=
 =?utf-8?B?VDdUUitwZ2hFb0JOTXlmTXNXTWFRN3hFa0VQQkJUMXlsVkFlUWVrYlluR2Rr?=
 =?utf-8?B?SWFqY0Rxa1ZsUFRmZHJaa0tNTUZnS3VRajJ1OHVYNms2RUp6aFJxZTBZaHQz?=
 =?utf-8?B?TzhJSnlEVXQxdm5HMmtRVnp6S2k5UTNZbTNvNzl0RExCN1VvQU1QdVVXaFdj?=
 =?utf-8?B?R0FRUkgxYlhNV25nQXlmaXFvYlRMZ0hYSlExeDBPN2ZsLy9janV6eFJkM1U1?=
 =?utf-8?B?ek5hL0JGZGJhNlRDRW5uckFiN3F3VHFmN05Dam1LNVM0TDNoczNOaHdxOS9v?=
 =?utf-8?B?ODhNN1NpdnRmenptQ0hEMkprWVRnQUowd2dmRnc2bGJDcDVFOTdCeVNEZVk4?=
 =?utf-8?B?YmRoVWFoaXV0MzZRcDdPWlVIVVZkQktPb2l6WXV5Qi9ManhncG5wTmJVaGF3?=
 =?utf-8?B?WE9VYWZHZnZUM3pNSndPK0JaQmNaSUZ2U0VZc2ozNkROcDdKRVA4MWZBWFZr?=
 =?utf-8?B?UWNHZ1Nrd2VxTUFDZ1l1dzc5ZUk3ZGx5QXI1L3d3VlpqczdRVGZmaTBvNVY2?=
 =?utf-8?B?bDE2VUtMMVVZMUg3bDltU0c2bXBoR2lKUjVYNWJzeFVBNFUrQ1F1KzVkYmpS?=
 =?utf-8?B?ZEE0VWZhUC9yWVp0TDFRUk04QVNmTFVkcHdGSmI3NHF4bDJPOEZvcHFXWVBx?=
 =?utf-8?Q?wYVI4/65DFTV3aP0ai91GpzBG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e12350-4d93-4d29-1d4c-08ddfa7618d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 07:52:08.7932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9lOnPW3j/XIG3sgYSXM4nITz17jiog2wWl9NwotOntm1afdhicztcTT83n/5/mj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9598
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

Hi guys,

trying to not let the mail thread branch to much, I'm just replying on the newest mail.

Please let me know if I missed some question.

On 23.09.25 08:44, Matthew Brost wrote:
> On Mon, Sep 22, 2025 at 11:25:47PM -0700, Matthew Brost wrote:
>> On Mon, Sep 22, 2025 at 11:53:06PM -0600, Kasireddy, Vivek wrote:
>>> Hi Jason,
>>>
>>>> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
>>>> functions of Intel GPUs
>>>>
>>>> On Mon, Sep 22, 2025 at 01:22:49PM +0200, Christian König wrote:
>>>>
>>>>> Well what exactly is happening here? You have a PF assigned to the
>>>>> host and a VF passed through to a guest, correct?
>>>>>
>>>>> And now the PF (from the host side) wants to access a BAR of the VF?
>>>>
>>>> Not quite.
>>>>
>>>> It is a GPU so it has a pool of VRAM. The PF can access all VRAM and
>>>> the VF can access some VRAM.
>>>>
>>>> They want to get a DMABUF handle for a bit of the VF's reachable VRAM
>>>> that the PF can import and use through it's own funciton.
>>>>
>>>> The use of the VF's BAR in this series is an ugly hack.
>>> IIUC, it is a common practice among GPU drivers including Xe and Amdgpu
>>> to never expose VRAM Addresses and instead have BAR addresses as DMA
>>> addresses when exporting dmabufs to other devices. Here is the relevant code
>>> snippet in Xe:

That sounds a bit mixed up. There are two different concepts which can be used here:

1. Driver exposing DMA addresses to PCIe BARs.

For example this is done by amdgpu and XE to give other drivers access to MMIO registers as well as VRAM when it isn't backed by struct pages.

2. Drivers short cutting internally access paths.

This is used in amdgpu and a lot of other drivers when it finds that an DMA-buf was exported by itself.

For example the ISP driver part of amdgpu provides the V4L2 interface and when we interchange a DMA-buf with it we recognize that it is actually the same device we work with.

Currently the implementation is based on approach #1, but as far as I can see what's actually needed is approach #2.

>> I've read through this thread—Jason, correct me if I'm wrong—but I
>> believe what you're suggesting is that instead of using PCIe P2P
>> (dma_map_resource) to communicate the VF's VRAM offset to the PF, we
>> should teach dma-buf to natively understand a VF's VRAM offset. I don't
>> think this is currently built into dma-buf, but it probably should be,
>> as it could benefit other use cases as well (e.g., UALink, NVLink,
>> etc.).
>>
>> In both examples above, the PCIe P2P fabric is used for communication,
>> whereas in the VF→PF case, it's only using the PCIe P2P address to
>> extract the VF's VRAM offset, rather than serving as a communication
>> path. I believe that's Jason's objection. Again, Jason, correct me if
>> I'm misunderstanding here.
>>
>> Assuming I'm understanding Jason's comments correctly, I tend to agree
>> with him.

Yeah, agree that here is just an extremely ugly hack.

>>>> The PF never actually uses the VF BAR
>>> That's because the PF can't use it directly, most likely due to hardware limitations.
>>>
>>>> it just hackily converts the dma_addr_t back
>>>> to CPU physical and figures out where it is in the VRAM pool and then
>>>> uses a PF centric address for it.
>>>>
>>>> All they want is either the actual VRAM address or the CPU physical.
>>> The problem here is that the CPU physical (aka BAR Address) is only
>>> usable by the CPU. Since the GPU PF only understands VRAM addresses,
>>> the current exporter (vfio-pci) or any VF/VFIO variant driver cannot provide
>>> the VRAM addresses that the GPU PF can use directly because they do not
>>> have access to the provisioning data.
>>>
>>
>> Right, we need to provide the offset within the VRAM provisioning, which
>> the PF can resolve to a physical address based on the provisioning data.
>> The series already does this—the problem is how the VF provides
>> this offset. It shouldn't be a P2P address, but rather a native
>> dma-buf-provided offset that everyone involved in the attachment
>> understands.

What you can do is to either export the DMA-buf from the driver who feels responsible for the PF directly (that's what we do in amdgpu because the VRAM is actually not fully accessible through the BAR).

Or you could extend the VFIO driver with a private interface for the PF to exposing the offsets into the BAR instead of the DMA addresses.

>>  
>>> However, it is possible that if vfio-pci or a VF/VFIO variant driver had access
>>> to the VF's provisioning data, then it might be able to create a dmabuf with
>>> VRAM addresses that the PF can use directly. But I am not sure if exposing
>>> provisioning data to VFIO drivers is ok from a security standpoint or not.
>>>

How are those offsets into the BAR communicated from the guest to the host in the first place?

>> I'd prefer to leave the provisioning data to the PF if possible. I
>> haven't fully wrapped my head around the flow yet, but it should be
>> feasible for the VF → VFIO → PF path to pass along the initial VF
>> scatter-gather (SG) list in the dma-buf, which includes VF-specific
>> PFNs. The PF can then use this, along with its provisioning information,
>> to resolve the physical address.

Well don't put that into the sg_table but rather into an xarray or similar, but in general that's the correct idea.

Regards,
Christian.

>>
>> Matt
>>
>>> Thanks,
>>> Vivek
>>>
>>>>
>>>> Jason

