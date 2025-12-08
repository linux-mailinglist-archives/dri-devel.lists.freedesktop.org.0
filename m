Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F41CADC9A
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 17:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B07810E494;
	Mon,  8 Dec 2025 16:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G5paVcPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EB710E035;
 Mon,  8 Dec 2025 16:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uI9N+egXw4W+l33badvomJDXG9EnDp6Hh8qknCBwvrmaKSymUso6oLxZFpqPRmBR3wDKKlHALws6Tjic4Kme1/p5OiilufurCK6RYXBY7UH1sTY+HUGqNWiNSxzGSSRCaoIK4M/nEv0cXv/VmGLKbZDPNxzM7Jmz3GZBlPYF7upwP04cxPhaKmBimH2JUOMbTq4P7UQBNIydTvxpvIiOb0gcdK1ZpsefFwchFLG/h2VzjNgEBvfVimcUOYFFIaUCDW1r6UGFt5JczgDxjXWl9GnAj27KDmjYpcqio//5XsG6riAAbMc5VugKNxq8RJw+0/x+kHVC9KFjcMzL69tWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwFz1H1V/emH0f10C202UH0gBZaciuzGvqonHoIY1f0=;
 b=c52569MII9swFepov8xR2OHfe7pRwCYDgkz72+WUVTuBi4TZWPwHvNEsW0ofigWwwNVO8PJetksrZKnQnikxFdYCND7ADYLGkSwTLTBZWPecy7F3EqEB/xhrxkW6BAqsmN9iKjfdEIHJbvXBguY1pg6aEMUr9+cOjtii/N8TKKLRTGRyI0F39QEDcnRe9x/aDUy2+cEcIGkYf/6+4PgH1rK++KvuqE+5F/kxI+JIHdwca2J1Q4C4SzPwOExRa118Sy+Gwzx687XYKaCdOIj3rr5tHnRdbRy1GGVqYKVL/NHHwFFohu33j7OCJ2e5E/ToZAS98xSGI1h41SpotaJgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwFz1H1V/emH0f10C202UH0gBZaciuzGvqonHoIY1f0=;
 b=G5paVcPtxyE5vxsXwQOsDcljxNfOe7iPoSImIfizLQjDNeJbI1R7pPiPPWKX+Zkho16eV6trkRKWekOS8yUKoebxmdLK4zWamCz2rY0t+Jgckr5T1AguPxKH/LYKpUg1nDDtgZGoSGIxP3/3X0AoJKZBKFMOz5CLdV3kAkkeldDa/rxFv8LzWHj1KdrHyKA/Se+qbZakGI+MYDbqsouJPTymW7EVGrPCi6GqV0xdjUMXvzISVBBvfsuNQ28MBtfRzRyrOQbQvlsa7Mk7oYFL+sBuL27RBu4RVno9fE3Iw3G4HZ5VThR81larRlD+XRsStjJ9NbN60Pd2kRjvdCeBNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8573.namprd12.prod.outlook.com (2603:10b6:8:162::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Mon, 8 Dec 2025 16:51:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 16:51:44 +0000
Message-ID: <835a223c-e738-4804-b7db-2b24ad37410b@nvidia.com>
Date: Mon, 8 Dec 2025 08:51:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require bound
 device when unneeded
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
 <6da7ff0ff31c1f4250b8d6cd1b535bd69322d0c9.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <6da7ff0ff31c1f4250b8d6cd1b535bd69322d0c9.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:a03:331::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cc23a7-e1bf-46ea-a1bf-08de367a113e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wll2c0pLZE0rV2Q2SVZDNlUzY3JVeUQzYkZ0ZEJzdGdEMXE5Y3FHNStNclZZ?=
 =?utf-8?B?S3VGSVBydFpFdU5TUWtEaGUwNExjcUlTeW9PaWpHUnRqRllhOWtRcUZEOFQ1?=
 =?utf-8?B?b1N0Zkx2SXRDVHhBMnU1Wjd4YlYxWmlpMS84M2I5dFdleW1QUy9YNEtRYW5G?=
 =?utf-8?B?Z2kxOWt5eFRSTXlyc0VlUm1kKzYzcUVHOHBKZWJOellYOEpDNnR3WUlRUDBW?=
 =?utf-8?B?RERBbzM1WGxtMmlibDJzVjlVeGtnbzRORDk3MnFPclllemRKN1ZucHQyNUx5?=
 =?utf-8?B?OHk4aGhUUk9lMXFyeXRhVklZOWh6eC9qRmt2SWVnZGV6dmZESnBqZ1V3UTM0?=
 =?utf-8?B?ZEo3dVJzU2lnN1d2b2VhY3R3KzJDTTVlMXczdzlsUGxBWHg0QjNkZ214a2Nm?=
 =?utf-8?B?VGVCeW1nTjFqTkFMbFBOWElHMXNLL2Q1M2Z0R1d4S080aTYrVWFoWUZiSzY1?=
 =?utf-8?B?dWFsc2FZWkRtLzlYL1RjQVZoRnlaMVFkdEtiZXRDRktOR0RPSUlLZGVtSEd1?=
 =?utf-8?B?RHc3S2pOSkduN05wMDdyMW9jTitwVzFkajFoMHZSWkUwcSt6NjJqMjFvQlVK?=
 =?utf-8?B?REtMTU83eXpnVWZBS293RnBmOXd4QkM3NEJiVWpEQW96eHFLdVh2Y0QrTUFL?=
 =?utf-8?B?a083aCtIaXBMVFM3d01Xd1Bucy9lR1VzQW5oSW1WNjlQNFFBYzBKZ3V5UHhr?=
 =?utf-8?B?T2h3WW5ZdWxzSnE4RGlHN3p0TDhLVlJHMEprc2NnazFOVVJIVFNGbEFOM2Z5?=
 =?utf-8?B?d3ZoNy8xbTg2YTBYN2YvZzJjNHB6Qk5TeG4wNHdZdHV5UzZSNUE5akp4aStq?=
 =?utf-8?B?SS8zQ2pvYXk0d2JYa1ljSU4vc1JkMTN5TTZnb2NuTjcydUp5RW9QM2dFVDZQ?=
 =?utf-8?B?aTdXUHcxNmdyQ1N0NURCdGZ1Q0VCd3Q4N2crc2RBSFE0UGo3VWFBQWtPTWd4?=
 =?utf-8?B?KzFlejlrSkRjUGFEaTFMNmxoUldpV24wOGk2VUxRUUNwcFBtS0NId3krUW1k?=
 =?utf-8?B?L01wcUcwNFJRN1MyODQxU3ZkSXhOWXJRaGpaNFlsY1R5eVdpTExwSWN0UEZx?=
 =?utf-8?B?djVXQVcwajBmdXlXamsydG0xUFRkYkpmOE1hdjlYK1JIYW0zeTd6a0lYTzNs?=
 =?utf-8?B?ZFFSYnZkOHpsV0lUL0hvK004TUZzWUpCS0JkYTlpT2p5NFFBVHdVTVZIdnZM?=
 =?utf-8?B?MzBQNGc5WUx2WGpabDUwOXdBcnN6SFZIMWVlc1RDOXdPV3h6MDd2YVdOenJZ?=
 =?utf-8?B?alEvYlY0MHFyUWZncUN3N1ZSdTZJSnVta1dnUm1BNk1KV2Q2Nlk3QWw5cmFw?=
 =?utf-8?B?NVdWU2E4SGxXVE9lQVpKU1RtRDlxMVdBVUcxQlVHWmh4aWRLU2pBSmJLWWVh?=
 =?utf-8?B?SWlsTkxzOFlRUHU1dnh6TlVSaDFrUVNyUkpuNG1NY3hsakM0YnJpV2cvV1Ux?=
 =?utf-8?B?MXZSYjd2bGJjWVJsV0p4aUYxWWNRMmNzS0R0QnkrcjhCOGtTQ0xjNFhUeDRn?=
 =?utf-8?B?NzFDRExxWnhkVWZwalNONjJkL3o3blNBOWRxSDFqdm5hM0VxVlVYdmtScnhm?=
 =?utf-8?B?RXZNMmdhaml6YVB3SHpTZEQ4dmRnMUhHTDRkRWRGTDZmR2JiNjYzdlFuODRw?=
 =?utf-8?B?OU1XcklvMzZnV0VHOXN3cWVhS2JOaXNCK1YwVkVPL0hWVmRlNWt0OVQrcWx3?=
 =?utf-8?B?UnN5a2ZiRVFwNXdLb2YwcmdhSWVQWXJmNzVnRmJBMG5Ta1dUK05DK2F0VG1N?=
 =?utf-8?B?QzJRaWhXU0krODlOS3lNSE5YYWdGOFdoTktZQW1ZcEk0UVlwQTZOL29GeTJ1?=
 =?utf-8?B?d3ZzUDF1eEExZk5ubU4yZzlVeW0zbTlYczBFMlNpd3JVUzNad245aS90czZJ?=
 =?utf-8?B?VENITUlSd1BJekFnZnZqUklaZFdlUU1IcThCOE5YdXRwUVU5QWlxa3UrRWNt?=
 =?utf-8?Q?ES6uZ4R8jxO6dwvEVhYRF7QhdKCZIooB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBiVGg5Qy8wZzNSK28rbWFRTzY5UFpYOFRhT1B3Y3U2YksxNVJEV1o0cEpq?=
 =?utf-8?B?dlVUNW9nYXNqaFZqeEJobE1oMHJsczdUSnJsWldWWU9Ub3Z2K0J5QUcrYWEz?=
 =?utf-8?B?OVJ0UXJaYlVCZTVZUDZDYW43cnFIcGhlWklsaFNLNnVqODdTWGtYRkRSMlRK?=
 =?utf-8?B?dVhvVkpwaVJrQWxhUzlLcVdKRDJFSlYvSnFBQk5HVU9BQ2dJYXNFQmZ3Y1Rm?=
 =?utf-8?B?T20zUWYwN1JUZE4vcWlpUUJBOUNyMUJGaERhMDNjRGFmcEpFVnVtZ1BDbUNP?=
 =?utf-8?B?NTg4YTkxejNTWG5CSnVLb3NJS1huQU5tdnY3VmpvQTlVRkZnZFlvbE1Kb1Mr?=
 =?utf-8?B?ZW82ZjZDYmd0VVI2YnhZTGtSVEtzUjFxbWhVZ2Y4MVpmN1RQUjR1ZDRJbXBC?=
 =?utf-8?B?M0VhZWpaWHVLWkxJSFhuODhmZTRNZTBwOGpYeVo5NWlPV3RwZ201TDYwdkdU?=
 =?utf-8?B?bUJEblJzOFptdlFPbFJ0NDJmWmkwaGM1cmxlWXVuKzg4d0k2ZWZ5MThWeEFp?=
 =?utf-8?B?YitaS2ZWV0VjYUw2R2ZObnBnVGIwSXRJbHV4dzlzZ0Zndzh2R3M2SmZoMUVI?=
 =?utf-8?B?UW5ZZDNsSkQ3MitxYnEwMVMrK0xmT3Z5cEtGQlhPaXdWOVA1c3FTK0VuN0pV?=
 =?utf-8?B?ZTloOVliWnRvZnNVT3hkU2gxR0JwUmtNN0dqNHpPZHRCVTF5VUxSM3JEVHN3?=
 =?utf-8?B?UFRucDl3eVk5UyszWGdxMTdQS2tjemlYcGJsK1BJYUdTV3gzdEc0ZVpjNXpz?=
 =?utf-8?B?czNTNzBtQnZ6NmhYdWxFMW1JMXJaRjVLVk8zQXkvcVJFOGtnVm9XZzJiaFRu?=
 =?utf-8?B?SzA5dnhicFJHSnFxUFZGWTEzMTZLRXhvcDh0TVFKR1hGMnZ4ZE5SblVHZ3Vm?=
 =?utf-8?B?RXVUWTU3UkdWVFBBVVg0dGdFekpWbUpTcmxSU0FTSmtHREZ5UC82QWV1cksv?=
 =?utf-8?B?T1hXUko0NTJSNG5KbGhKV2hPWHR4WnFBUjlPVFpQOEVKNlY4SEg2TXlyT2Jw?=
 =?utf-8?B?YkJMM1pwcG1kc0IvYnpsVXNtamJBVVhZdk1vQUpSdC9vYVVib1UranJIejZR?=
 =?utf-8?B?OVlZWWluMnJLbEZLMGxFakhqVGtrREV4YkhvOFo5Q0JKOGRUakozMVgvY1VG?=
 =?utf-8?B?Qk1tbFZYQjlEU0JHakViU0ErUWFLdS9OT2I4WVVNdkRvYjdyemlOQk90SEcz?=
 =?utf-8?B?Si9DOHFTUC9nS1lqNCtvSzh5aFlwUWhkM0VUUDVLcTNnUjBaQXRpVnBMV3VL?=
 =?utf-8?B?M25WYlU3V3VhM1U5aDJiSGtNQ3hNV2FOVFlFRFRVQUdST1V3L1dNVElyd1Y3?=
 =?utf-8?B?djVuUmN4ZWxRMWhGd2grL2U4Njh5NHQzYnVOVkd3ckpHV0gwTlV0WVRuS2lz?=
 =?utf-8?B?bFEvTGdEanBGalB5eUJ1VlE1dndORjJkSUJ3SHZJWHU4M1JIcEdWM25QaUUw?=
 =?utf-8?B?TGlOVnptODJSTk4vVHZrUEFMeHFIQUI4Nk1BbEU3SWhFVmZjbEVxTyt2c01a?=
 =?utf-8?B?dldlRTloa0RLQnhCM3ZhZ3pjVUpzQktkcnBCOW9rWVo2SjNHWHFVWHpSWVR5?=
 =?utf-8?B?eEQrQ1VDcEZTaHlZZHRYWkxMYXpZU1BLS3AxcDgvblFxUjViM0dORmNKWllr?=
 =?utf-8?B?WWFxeUVhYnZNeEdCTWtZSms4R2huVGQzcVZ1YU5lbmUveXMwVTNTTHEzVUtN?=
 =?utf-8?B?VEMrcVpiRkQwMG9FbDU5SlFIK1hybzJKTUdjcEFIUFRKWjJYZmtobWJRQlQ0?=
 =?utf-8?B?Mmx4T2hxY0VFUHFEeEp1MWNJRVppV3RwUGVlanZIMzNRNWFlbWR2bmFlQ2NR?=
 =?utf-8?B?YVFtTmpQYlJJWlg0clFtVjNzOTNkeTA0ZjhUSWNXa0VNRWNnY3lQRmpKeVhQ?=
 =?utf-8?B?MTBiZVlLaTBtS0ZKOVQ3NmsxMXA3UW9hK1IwN0VEbExDTTlZVkpGSlNBcVNt?=
 =?utf-8?B?OXpKQ3RvbmI4c2p0VGVVUmZkSTZXOURiUWJVWlE4NitRVTUzN2x5ZUdsVm5L?=
 =?utf-8?B?clhualFLTHY0VUxCQ2J6UXIvNXFUVkJxT1hTRnRiTWx6QnpSTzRQcDA3QnNV?=
 =?utf-8?B?b2JGekdhSzFETHRITzhJd1lrZVI2a3lEcE9hMUY1T0dZbzRoVlFwMU1GcWxv?=
 =?utf-8?B?UUxiWElITmNGL1lydHlpVlhhaUsrSlJhUENOQithWFRMVkpnWTE0Z1gxWUIy?=
 =?utf-8?Q?Q92EVK2+mmgMd2v0K/v7KaOZ6o7vwtu8A9783IwaUZwR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cc23a7-e1bf-46ea-a1bf-08de367a113e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 16:51:43.8640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8UHPYBCCRrxN2K5rwYH2Wfmq68UIZuvbOJ0OiPkrWYxqdsr06EkAjtklMyLIY+meoghy9c6OdRoyPWak4izEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8573
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

On 12/8/25 8:18 AM, Timur Tabi wrote:
> On Mon, 2025-12-08 at 18:26 +0900, Alexandre Courbot wrote:
...
> I frequently see patches that, when they change the function signature, rearrange the parameters
> from one line to multiple lines.  Here, you are doing the opposite.  Not only that, but it seems
> unnecessary because you're actually just changing one parameter, so you should only be replacing
> one line.
> 
> It seems to me that some people have their editors configured to prefer one line, and others
> have their editor configured to prefer multiple lines, so whenever there's a signature change,
> we get diffs like this.

Nope, what's actually happening is that (nearly) everyone has
their editor set up to run rustfmt(1) upon file save. That's
the convention used in Rust for Linux. (Failing that, one is
expected to run rustfmt before posting.)

It is a little jumpy, as you can see above, but it does have
the nice property of avoiding formatting discussions, since
there is only one way for things to end up.

thanks,
-- 
John Hubbard

