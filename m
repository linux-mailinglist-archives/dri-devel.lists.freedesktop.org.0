Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6681AA9E37
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 23:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8F210E323;
	Mon,  5 May 2025 21:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WluRtubD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21B410E33C;
 Mon,  5 May 2025 21:37:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFjoTf1msKL9P0h+IvEkOEx1aD/i6vqwkoLD4roH34fWMF5J0hOMI2AB7ndFGFvGIE2EsVWLUTD9rW7yax0gNQeDwycoJLdqv1oovjtT0JXFDpw0PItF/f1UoAW9AjnonzCTVAL5lBR4LYnI7mmsuTntjU3h4AlKvudpTUK3dytfVwbvpfsHzCVK8+ChaXpzMiBkx/Yf3TpUDiKLJlwlUfCH8HUYkEmDsS7XacsGdxUsdmZNxZCKphibFsQnoWZoCQyHdB/mBrrHGv12ybGp6wwFE29cmZTxAjBN3PMd8KJrNFoeHmqOVNUWb+CfN/ppgTp6tR8rvuYA8dVm7r3r4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDB0vJj8LO3XLS5sZ/SZHEgalNjewOcWMXc32cvBkEk=;
 b=jloW6ZmgFjQds3cdXxkKTfm7KYwK3aLOEcJ0N675pltxQCum/hDDA7UbH2LqzB+weFl7ovMPBUVumsxuVemVzwUzHckDYQtfL3fUa4JhrEsUAKnHeHVvwVIeWHAUWe287a8p7mlpDWbGHMa2D71zF0ou0HnwKJ9RP2CJbQEBmHxVQzB2Gb+PvCNzyt+6URr5O63ixxArxRwT7ijUVphBcYhPzCXVr0lZ7gfFLpOoIwDFZy3iEybvou/RlgTKooRBcfsiJBpsGDu7vOef6flYW8IngU6H5ui9MeEQBSAKb1I/5jWPeb25zJbtaSqK07ztslCh+4Ex+HXlR3nCNZvHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDB0vJj8LO3XLS5sZ/SZHEgalNjewOcWMXc32cvBkEk=;
 b=WluRtubDIwrvRVeM7vsYvqbP39i0FRIGgtBaDO/4ZZQbQx2MuhquUZ3ACiHUBEfvc+2AwW+Q4Ggahv7emZ24JIsA1Rj0cJZv8gvfF9TLaYuh/OJ5ikCGhxrNH1xy8cLUPzmioV+uhqjEVB0qEDgRDAzOzkFJ42VlKk28AtGyjHu+I1vF3celOu6lNtaVKNcn1HCEHbxHZI9tFHvnNgAq6bgCDzdxmflGzNMa3avgPdKIyRJFM5S9gLMb0+sE0dpP4uu0wRnJJHLC4HG9l1+Sr0TWDEsJs7pIa+xVR1ayP3ficeBuRuMVERrxjsSFp146GzvuZWmhDJrMZqxIeH+7zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7547.namprd12.prod.outlook.com (2603:10b6:610:147::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 5 May
 2025 21:37:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Mon, 5 May 2025
 21:37:24 +0000
Message-ID: <c1d417f2-8340-496b-bdab-0ae54d0b499d@nvidia.com>
Date: Mon, 5 May 2025 17:37:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] docs: nova-core: Document basics of the Falcon
To: Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-7-joelagnelf@nvidia.com> <aBg7CUoAo1xyYlo8@archie.me>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aBg7CUoAo1xyYlo8@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:208:52d::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: ebba5f8f-6576-4e8d-6790-08dd8c1d05eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHM1cUFhTXJrS211TkM5eDNQcVRoWmdRWEt3UENaNytMRFFBczNqTnJpSGtI?=
 =?utf-8?B?dE5JOTY2Kysrb041d3pmN3dSdXA0bytrMFE1L1N2S2JXeUNCWSs3cFYxYngv?=
 =?utf-8?B?clgvalVRNklvbGpodXc2TmN0UG4rcy9rUDgzbzZWaTBvUlVBZWtzWXZYdDFY?=
 =?utf-8?B?Tzg4Z1NZdjJCVWx3bGR3bVVHazB3M3BiaVJIWFJDVVFQZk94RGxHOW5SNW5w?=
 =?utf-8?B?dUtrMVk4L2lnQUpIY2FMaGlxTHd5VDRNYWdLNTQ3cTZpUTdaS2pFOEwxVDcy?=
 =?utf-8?B?UkQrNUxuUUltMWFiVWxUMkhkVE51ajF2WnBxczNCWXpqMGpObW5kRWVNTCtt?=
 =?utf-8?B?R0xWSVlYMlUzZkYwdzNKNTBRMG9LemZVUDVSVDRTN25nZWR0QnJJR0RCRGoz?=
 =?utf-8?B?MmxIUmlManpiSDYwdTJBcG5sRzB6cnFPa1Z2a0QrbHFzSGM1VmhkeEIyTjc1?=
 =?utf-8?B?WTNTczk5Yk4xdlZTeS9Fb0dqNEt4QitYcnhOL0lLT01nK0krSWRXcU9ZVmFN?=
 =?utf-8?B?VjVaZ1NVajRwOU8xS3h4aUhHMGNscDRremE0S0VQRG14WS90WTBUeUcyRGcv?=
 =?utf-8?B?ZGtHRFdyTHZCOXVwNHViblpHRG4zK1BONXdZR3VBWktIK2FFRG9uRG5EaFhL?=
 =?utf-8?B?SFRZSElkRER5T1ptc3BGanFuWEprVW9rSlQrWXh5dThJVjJiRS8zTExWYVFC?=
 =?utf-8?B?UkNURTEzdjFwUVZFVG9FQ2FIMGxRWW9jNkRxK292bWFwdGRDTGs2SjltV2ZC?=
 =?utf-8?B?VWF2OURzcnFGbWJqTHdUZFpodGJsUXJ5UndSQzMrV0lrQytWdmhRWXZyREpm?=
 =?utf-8?B?S09vY0kwN3UzZWlXdzJFYVhiaUJYNElZK3lsWmhGZnBhSXZmOWZtaTlXRy9w?=
 =?utf-8?B?NHRNRFpHNkU1bi9IbU9FOFFxeXF3bkpETFpvMjJ4clJwUG5BeCt6TG1HTk9U?=
 =?utf-8?B?anhNRU16Ylk0Mzg5bzF0RGlFaHlBT005ZmtFL3p5aXpJaldhcDQzWHV6SjYz?=
 =?utf-8?B?YTJ4RGdmNi9Yb3d5WXZlS1RvblV2eCtwME1kUUNvZ1R6RGZNMlV1V1Nxbzhv?=
 =?utf-8?B?S0hBTGxyRHY3ZWNBOTRsZ3hlWVUrcXQwWnhmVExLU1pyNE9SUEtQTEJWTno3?=
 =?utf-8?B?bHdNNzE4TEQwM0lmZEdHcnFXRHlWZjBMWE1TbEtieWFoZXNMa21jZG9rZTQ0?=
 =?utf-8?B?am9pN21yWWhwbkJXcEdtY3Myazg5eFc4Yll2T0hNZGsxcDAyTXZTNnRDbjhr?=
 =?utf-8?B?SmtIdVdGMUJkKzloRDg4RVV4MGdOMk45S2hvaVZZV2dURnFET2lYUmhwQnlS?=
 =?utf-8?B?dWtURjNOVWZQMlhkdU9TRmlMSUF6YzF0VU80MTZoMnQ0QjZ1TWJ2emZXQUt1?=
 =?utf-8?B?Y25MVFEyWEJZS0YzdjJJZ3AyZ2JhNHRMNGFpOHJFQjBiRFBRQkgrZGFOQUdS?=
 =?utf-8?B?azFhSXorUm1jKzdlbmZvZjNjNTJ1RTg2TlhmRmY3RjlkcHlEMnp6WmdMUzhp?=
 =?utf-8?B?cFVlbklyeTJRc21RODNKYVQ3eXlzTXIyekVibVJGVjlQdTdlRlEyNmxsc2dE?=
 =?utf-8?B?Q1ZWOURKeEsyV3ZtR0J6MWU5M1dPcWZ6YXQrUUduOXhzTEZMR2JncEg3YmZv?=
 =?utf-8?B?L1ZwbXJuUlFxRTN3ZStJaThLTVVNS3VQWTREdE9mRzJ4OERrY01ZY3B2dmhy?=
 =?utf-8?B?UWx1TTBRL1c1dXZiMURUWCs3b2dQSEtIU20xRktGU1J1TE10WHBYZldveUNW?=
 =?utf-8?B?N09HMmZGU1VNVFNWRFkvQXNnTmJKazNaVXRWbmJGTDVKM0JNN1VXenZQd2Nw?=
 =?utf-8?B?NkppQis0S3p4MzJBVzZtZHYraWpFRklDK2NFQXdjUldKQ1cyWmY5VW9Sc0FM?=
 =?utf-8?B?THNmN3hIalM5eXBNQ3FaOUMyUnptblF4cEorZ1UyTEtkRTJibnZGUEZ0bzZo?=
 =?utf-8?Q?Xf2fz1LdUOY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0NFNC9JK1NqamUvcUVhQktORlM3REpPME8zU0VEaTVSR0ZGR3lRQ1BsTGxQ?=
 =?utf-8?B?Uld2dVBtVHNwS21hdG5Dak9zZ1R1U3NHQ2lJN2hGNktpWkMvNUhyZW52NVZJ?=
 =?utf-8?B?U2p6WnZtR0ZnMDAvRUtSR3FUSzUxM1VnVnB0LzFWdlh3R3ZVY1pTaVhxSUNk?=
 =?utf-8?B?Z3NjcjdKb1ZDY09iYmNGZEdqU0g4RG84WlJUVHJ1cERZNHZiZWMyL29oUG9W?=
 =?utf-8?B?OEl4Q1JpR3Z2ZmZuejJZL1dkcll5Ung0MlUwSytPckFCV3dpRm1RczViNlFW?=
 =?utf-8?B?T3RoN0lDdDFpeDRzNGk3dmNqMUZyaFFaWEhTWDFIcFQ0T0tOUFYydC9sdk5B?=
 =?utf-8?B?Wk5hNkZoNlBKYllHVmlIRkhMbTJCODlJWTA2cEFqd3hSS2xxVks3RW1scllF?=
 =?utf-8?B?K3pFN2puMFRxZW9GZnlHOEZMMDhyYXBMRFVBYTBYbC9qaXBFU0RkcHQzYThS?=
 =?utf-8?B?NUVhcGRsOUNqTE5aeStkbjM2TkdLVHlTWVBCNFRldHVTb1E2cS9nUnB2TWxP?=
 =?utf-8?B?c2s1Tk1SYTJKdGhIbTdkYnhGeUtNTjZNQlR0d2pabGtTUGhuYjB5d3hkZUNQ?=
 =?utf-8?B?bkhaNHVhb0xsYjRyUCt4S013YkpLTnYyREl3N013ajZqa3ZNSThkUkVVY2hu?=
 =?utf-8?B?Tm5DQ1VyejlNbG5NbGhnbjM2MFljdGoxYXE1Q2lhc0lOclRnOGU0b082VGxs?=
 =?utf-8?B?OHFESzlNL2Y5VWRkSG9uUURLNTcvQWpKK1h2MnV6WDZQUSs1SzBnY01zQXlx?=
 =?utf-8?B?ZkFyUUE4N1NSYXY5SkkrNWpDVzNsRW44cWxIcmNqaUpRK1hGZStYc201dzVT?=
 =?utf-8?B?Tmt2NmthTmtHUzUxSTA3OU1pUVRFcDZORVAxNGQrRTcrMTJhR3J2RUJnVWhX?=
 =?utf-8?B?ZGhlaVBRenB4SU1temxoclNKMDJOa0o0ZE1ybHR0dVhvV3VKQ0c2dW9kVjV0?=
 =?utf-8?B?NU9MelhWNVhKZ1BHZGZlZFZvQnBDc1diaWZReHJGamhwMG1KT2Y4ZFlCQ2dj?=
 =?utf-8?B?cG5tZGNJRWVhcjgyR3lybk5rM0Rsd1RuRVAybzZJWVpEeWN2WEl1TWx3bFMw?=
 =?utf-8?B?d0EzbXQ5MnEzVGI4T0h6SEUzMXhjSU9zVkVQRUFMVmdvc2kzMm9WUXJMbml0?=
 =?utf-8?B?WkJTaWVKMHB5MW54dTlZbldkT09FV1ppL05VQlN3ejhaMkNwS1JSYWhjclVT?=
 =?utf-8?B?WXQxT2ZMMFA3UlNNZ0JXNHdsZzQ5TUozUkVGQUFjejQ3NjNDQmpyYXFOT2I1?=
 =?utf-8?B?T3Bta3dJY0tPNGRDQTNvM2hMV3c3UmwzL0c1ZWo1ZkN2enVUNHZVWXhobGI3?=
 =?utf-8?B?RlJpZmlCdW44T09wdE5ZdjkzdzY2dnJJVDZudTVVOHpMeXZCU0RxMzk5TUI5?=
 =?utf-8?B?K2VHSk05U2RicnJNWW9aTU1ROC9DbUd3VGx6eGllbVlVd2doRWhDUHZVUGRR?=
 =?utf-8?B?Zk13ZzBONzRFaHJ4M21QY3VQL3Z2Z2UvaUdvUlJEUStIRTZ3bHpDRUhsc1dE?=
 =?utf-8?B?enZ5NWF2VktteERBSnNpUXVkUE90bmxMdFBuRWRydmZ0UmJVL2d6WWVRVS9x?=
 =?utf-8?B?NXFWNUxNSFBabjFTMUlBOXhQRS9ZckJMLytESHR2ZU5xNzhNZjhKMmhSc1I5?=
 =?utf-8?B?QnNHK01ESVVhOTZwUG1YMEwyNnF5bTVJR2wxTStiRFFQU1g1VE84RktTZmhX?=
 =?utf-8?B?Y1ZEQUlka01IZ3pjT2NVblg2RjB0c1Nyb2FVQVFUWCs1QUlneXQ5VnpaUFBO?=
 =?utf-8?B?MmdadkpMbWZSSGIrbWtMcExrMEd4YkhLWEFaWnA1MGxmMDlrY1RxUFJyT0ZI?=
 =?utf-8?B?R01ZajIvZld1dXllckxnUC9YMTVSK01sZU9NY0FVejNlZXJaUFA2THV2ck5j?=
 =?utf-8?B?ZFNoQlNZYWZqN3NEUUMrdS81SUxSd0lVcnRYeXhIVitMWlU5S1hiRnVCNnBn?=
 =?utf-8?B?OHR2QWlwTlNNVDI3c05zM1ZUNmVCNUM0NzBpMUlwdXFoTlk2TDgrZWgycGJa?=
 =?utf-8?B?ZkI3ZWd3WXU0UHVIdndtTzFveDRpd3hvNmt3b1ZXQU9lK3NUamtVRnhnY1hR?=
 =?utf-8?B?SEI1MVFXSjdZL0U4aVVFWHJXV2NTRjdpVzVURlY3QzNDait0ajhCRUo2d3lT?=
 =?utf-8?Q?eRK5gu4tL49AAwRwweVHDLLVz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebba5f8f-6576-4e8d-6790-08dd8c1d05eb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 21:37:24.1348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sBtGaOszZoBSxKDOQFixRR4G/m9erKvkhTKSiZyjeoZrp3bqfHh2XSdIfvx9i5e6idSDXoF7mpVsgk1QCsEsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7547
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



On 5/5/2025 12:14 AM, Bagas Sanjaya wrote:
> On Sat, May 03, 2025 at 12:07:58AM -0400, Joel Fernandes wrote:
>> +Conceptual diagram (not exact) of the Falcon and its memory subsystem is as follows:
>> +
>> +           External Memory (Framebuffer / System DRAM)
[...]
> 
> Wrap the diagram in literal code block. Also, note that it can look messy in
> htmldocs output with certain fonts due to box drawing characters. Consider using
> ASCII constructs (dashes and vertical bars) instead.
> 
Done, thanks.

 - Joel

