Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928BAF7CDB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF3810E1A7;
	Thu,  3 Jul 2025 15:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lUI8Cler";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7796210E1A7;
 Thu,  3 Jul 2025 15:50:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejHgs5Xwe33kQ0MN+aa2F22veDNeGBg3JR1FKWIJy7jY5D6yJ/HR6pT7/Lw0EplFveduMyouvA/yforDIOdcKgcIkFmjm0vd53cVkl6fNkw/giUekEKaE7GXKepjtZwqOOeLheGERpXAt+Cmzj89h+ZG8mvwOZ3vzhFzfbtUZzv4YMLJ4XRvvnAkFgKR/n1hvx3eEFO50qeoSy0MqnFCD+bmqF6OKic8mRlzNzKH31AWrfM/ZArmtzC08xKjkhENtQ96zXELLAHbMPlV0tu6FNwN262et6yzpUaG1FsBxmbOY2BJfwl8Sik6w7FhQl9a+qrgUwOJWgSZXkiGakeU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVYqSZfEgDO2rOVpEaM071+xsBDZ4TJjWndPiX3+WBA=;
 b=bInb1KFhxCHjmBf5eYFefC/D8rQNMnJwCEBzw5In1SaZagBreuYxpUQq3z7U32Elkp31aXNRWNXECcZRVP44RcgNX+Ep0rL9l7wD8gixBb5Pck4pOJRQfTKXuWL/6tt9vUsi4jm1fHxpLk+VUGwX25Sqe8tP3QNDQkRiWVAXKXpF53VvKZcpTAeavJtXk8SveIhjF4ZMTbcP7gyYjCo73vRp89KH26srIjB+y6H9CFpWNTCENRWtN1rcQ0WBJl/sB7mFRovQqXcWhX2giXXwuFc1qzN1dYLwQOTe99oU/QwUrR8eyrZDVY0FElVHIxI7zY+ooa28sPrMCSNiYPgDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVYqSZfEgDO2rOVpEaM071+xsBDZ4TJjWndPiX3+WBA=;
 b=lUI8ClerZMDpJG/QHdv7VKjNM5xi/tuamwDcWwSV6pwtOKXYKynQKbNFOikHbkyODKbOCThNAt3wEF8Viirqx4eEfFiaELXEUNLd5iwO0zB771sL2CqRI2eerY9iWzG8Z8XgTBqf2gFD9uHfUnMzLdINiJuErwNwn5w2Ex/zAlMlYF58ncJfMRMTGoR3ddT0Yq1bNqZzTkhWeEjn5eQI/r+vQTlkHYl1idI15wOAoHty6YJm50isHTcA9FztQ8Lmh5ecgWEcGoUkWkE9fglTK36yqMD1zRj8nd7irDCVfJWye98RfU3Tm5VxobgNjb2pvusgCnIv5Jqg94v9eAfopQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB9501.namprd12.prod.outlook.com (2603:10b6:8:250::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 15:50:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 15:50:39 +0000
Message-ID: <c8e566e2-b937-4f53-afd4-29a39c9d1231@nvidia.com>
Date: Thu, 3 Jul 2025 11:50:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] Documentation: gpu: nova-core: Document fwsec
 operation and layout
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-6-f362260813e2@nvidia.com>
 <aGXN9C_ouM6ylzyf@archie.me>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aGXN9C_ouM6ylzyf@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0040.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB9501:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fd2b5c-51c3-4a96-0a32-08ddba495bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHVmNXNuSnRhUTh1c1EzQ2FXL0NjdEg3ck01UitRSy9mOVRaVmFEZ25laTVo?=
 =?utf-8?B?WHhJbENJUUl0MzN5RFB1bGxhNVlmYjN5NHlPQ08xQSthMTVNeW1EZnJ1UXRk?=
 =?utf-8?B?NVYydWZ3S0Jaa1RmQnBqRHg4QjVrd0xaajQ0M1dTbWMvc3NEM0k4UlVtT3pz?=
 =?utf-8?B?MFVpRFRLZStsTFRRMzdoVzRWTmpuZjBabjlBRHV3N0ZKdDhlVlhXWStXZ2dO?=
 =?utf-8?B?bUtuTE9IRjlqUndhWDRRMURIZ1Z1Q0oxc2w5bFpldkRLS0tIUVN0OXR3eElZ?=
 =?utf-8?B?TVg1b3NZaHJKRkVqTXVjNnN4SDFrVnM0N2ZUU2lJMk9BZ1JyaDhaSTNId1Uw?=
 =?utf-8?B?bWFJdmhKZWwwWVRuL3FEL1FBQk1waCtobDZHTlU2ckJCaUtSbkx1eGtpeFFO?=
 =?utf-8?B?cDQvMGhCeVkvMHpldHJuVmlHdWFCaG9POXduR1ZHRzRBTnJMVmpwVGxOSWtk?=
 =?utf-8?B?MlJnWnBjUG5hM2YzczQ2b3NvQWR3OFFETUFhS1pjYVR6ZkNLU1RwVFp3S21l?=
 =?utf-8?B?QzlBTFZCRTkxY2xpZ0I0c3IvQUVRc2d4dWxEUTk2MDlOaWdiM1dvT1pwbUZi?=
 =?utf-8?B?QkJTYnJSUGhhU0tyZEdWc0didG5FeGFTQ29oNE05UndSN3BSUkZ5cDE4R3VQ?=
 =?utf-8?B?b2ZiZFg3QzNXYzRON3d5dG4rOVpYSGc5ZHdFdFhRL3hsS3U4cDNSUkFRNjd0?=
 =?utf-8?B?T0tRWlhYc2xQTUZ1UFB5MWV5VVNWVjNRZ0VHYVZzbEVydWRQZzJMaVRFYlk5?=
 =?utf-8?B?VUozOVpNcmorSVFRa1IwL1BJS2VIWTJvemJITGZwYW5BMVg4VHhjT01VcXlR?=
 =?utf-8?B?ZU5hcXhUR0xIYmdPeldEWDJRMWxxY0l2eUJIQXJpT25iVVc2SUduTGJrUEFO?=
 =?utf-8?B?UDJWV2N2eDNiT1pQbW9SYTQ1MjI2QytMdUNXT2NlY3ZxaFN0VHg0R1pkeGMv?=
 =?utf-8?B?Z3NWS0VMSCt4Y2piNVFIamlTVjNHWW5IS2VsRE5uRmlKMG1MRzYyNE1xeFhs?=
 =?utf-8?B?ZXArODViYUQzbXFoS2dJNHpESkIrc0pORnJENndNOEpXSndiam5GMzRWOWxx?=
 =?utf-8?B?RDNmMEpEKzVmTERXSEdwZGo0M1haa3RucHgxSmtDL2tweDljMVVtQm9RY0pi?=
 =?utf-8?B?ZHFBcWRUNFd0VS9IZGxLNG1GZWFxQUlRbXFuQlBISzUyekI5NXRoNkREK3Aw?=
 =?utf-8?B?OEZCSEE3N2s1VXRBM2N2bVZrR2g5eGVtQWV2OTdBelJsYytJaFBpSE1BSEQw?=
 =?utf-8?B?NXIwK0pMSEFWeFhBM3RkQ0wzbWdHQURaczBmWXFBWkdRdUx3akwwQ0VZRTVq?=
 =?utf-8?B?Yys3dlZkYXVaTUhtaUlOMzJ6MWNjdmFKVEw2bUNOZVdiSlZqSW4yZkdCNUJC?=
 =?utf-8?B?aGVCZFpFL2VYd1FOVjdQVndTVC9USEhUN1p0TjlZNWpDbTJXc2c1Q2F6Q2Rj?=
 =?utf-8?B?N0RVeDVEV1BNd1oxaTEzTmtmMkdqTTBrWmVOZEp2VTRMMU9oc3lBRFBwbmpv?=
 =?utf-8?B?T2NFSkNVbG5aTkZVZXJzakprNTMvVGVtNGt1VFIxamxDaFlNT0FZakIvcmg3?=
 =?utf-8?B?NStYMk1wcHFrWVhhSjU5ci8wNUVvcGNydzVUSThlWUcyRTJBeVczeWx0UkIw?=
 =?utf-8?B?ZlFVN1ZObU5EZzlhbnlnczdLeUJOTUFJZlFRNytpZ2ljcnNaK1pqN1hoS25o?=
 =?utf-8?B?N2VwWVBTdlVUWWpieDh3akplTUNZTkFIdzcyNDM4enpQbStmTnl2QWk0ZUNw?=
 =?utf-8?B?ZGRXZ2dZNmJ0ZGN1OC84RWpDK1hrZXBGZ3pJSERJVFFHZU04b3BnbTlXeWhG?=
 =?utf-8?B?cWt4dDlVcVdwSFRDSEJQUWJqdHBSVEtTQm94YVE2UWI4blpubzdSbDZFZC9H?=
 =?utf-8?B?MUpRL3ZmTFRoRVBxTXFDNFJtcDZHM2o3SFdRRE5uMDdnQ3VjZTh2UDNseUZW?=
 =?utf-8?Q?SMxQa6p5MWE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U05mS0o2cVdLYlBtMXo3YXIzakJSc3c2bUZhaE5uNlZhY3d1a29XcE1uamw1?=
 =?utf-8?B?RlhvT0Y5WW5GOEl4TFF0cW5MZzhpMnMzVWh2Y1BIUi9lcGd1VFlISDZZM05I?=
 =?utf-8?B?OC9OVndVdHlUOUM5UCtkQ05nQkpqeVBVaHhyT0lOQTlZMjJYazYzWVhmeG50?=
 =?utf-8?B?NXR2SjRIWjcrcGtURm50ZXJmRjhRZjg4ZFVjbGR3aUxhZ2xLdkRwaEZsRitv?=
 =?utf-8?B?MGtaT1FlakgvaUhiaEdZanRXWmJlQ1hNeEp0UVRQdWJGVCtPQ3NzN2dZOEtZ?=
 =?utf-8?B?S3h5RWx4dG04eUlVVUc3cEpSWWtSdmRRL1hVYkRTelBONGM0WnByRFFQdXR0?=
 =?utf-8?B?K3dzN1NoeDlldU1sRnBYZVJabjdoN1lLYUlDMDY0OU9ObXVGR0V6NHNHNm1l?=
 =?utf-8?B?ZmV3WmR6d0pDNmFjV3o0b2xkZ1ZaQjJiNlc3eUR5bWxoc0xHMy81TW9aZksv?=
 =?utf-8?B?VXIwL2RqTzJ0dng2RFVwRWpjSHB4YlRmOVV1TExwWm1HTkFiTmU1dm5jYjB0?=
 =?utf-8?B?d3l6dk9PeTdjTmp2b2FTenorQ1I2RWw0QTIvcWR2T0lNTm9TeW53RkhqcEE4?=
 =?utf-8?B?RkM4cy81OTZzSml5U0haVDRCS0hZMkU0dU1aakdOR2dITEtYL2dkSnZabEdI?=
 =?utf-8?B?TjVocFViMlJkS2w2LzFTekY1RDZ6dEdvb2pYWFhrWnd6cU85eEFpbEtoYTRo?=
 =?utf-8?B?Nng3dWxZd1RpLzFaYlRjNGtzR2RGT2h0ZnA4RjdGek5URGlRU3J0Mlk3dHha?=
 =?utf-8?B?NUlSTFZvSVdkOU9rWjdKbGJNRUoySjQ2b1ZZcWEzYTlRV2FtMVFQTnRpdVMx?=
 =?utf-8?B?aGpjekpKc1FDUFcrSjA2dVpKZFl2QkMxajZFektQNThkaUdHamRXUGVybHpy?=
 =?utf-8?B?a2FXazFDUGlEM0kydjJjY25uZGZxMXZTWUxwUjRtQVIycFB4U01DZDZYdjJT?=
 =?utf-8?B?V3pmU3VhdXdVazA5QzYydHpuQjFrOWNOdFlCM2J4c2oxQXAyd0dLSGt5UEho?=
 =?utf-8?B?YUFJU1RiNExDdXZraXdDbUdNS3JPL0NwYmdYQ3ZabVNZanBJYW9jYlU0a0tm?=
 =?utf-8?B?eTZKdkpyQTQzNUpQMWRzY2VDRnpxSVF4a0Z4UThrSWFZa2RMdFF1WmlhR21E?=
 =?utf-8?B?ZzA3b08xM3RKYWI5YTN5ZnUyRm9oczRwZVhmaXYwWmZLWmlRM040NnE3VzQy?=
 =?utf-8?B?blNCdlJYRG03aE43MUVGblp5Q090aUdFRjlJWWFDSk4yVHdtR2FlYUhTa0tn?=
 =?utf-8?B?eWp5cXFyRHE4bFJadW9YTGlha3VwVnNjY3ZBSlZqVG5EQS9xWllDMVF6WEZX?=
 =?utf-8?B?eUNEeFRWQXZnbWhFQXNjU3BDS2ZpMmhTdXhBNkFYUTIzRnVvaUdJMWNxUG0r?=
 =?utf-8?B?V2c2UlFWVlNSdzl1eWZIQks0MEdxTU1FR0pVR2lxSXpZbEVOajQ2OE1PdHVO?=
 =?utf-8?B?UEtxK2RtWTQweFViUU1haWliTGFGb2FmQmd6Ylo4MFhxRUtoUDJyS3Yxb0l4?=
 =?utf-8?B?a2M2ejdvaE83RWZneHQzS0lveHR1RUs2eklSTUNUQWVQRFBFU3pJOGttTUtX?=
 =?utf-8?B?Sm5jUDBLSVkvbzRDYW1rVmFiUEpvZnhYUjA1RTY4dU9wb0V5MjdIbkU0eGp6?=
 =?utf-8?B?bHRwR2dPSUZzS3Mva0I2enZja1h1MExOdGpQSElFc1V4MTBuN2lmNnJlRkxZ?=
 =?utf-8?B?VkpNdkNNRXdJb1o2YlR2QmxaM3F3czlBT0t4UXZVbHNNb0k2RVZuWHpQdUg2?=
 =?utf-8?B?TG5sZzFMWTJLa2NCQ3psQmljODNHMFJGc1RmNklOa3ZuOXF4U1lFQWxicWF1?=
 =?utf-8?B?N3RxK0lLZmpNWldFS0Y5dyt2VjZONEhONHB1QXhwRFRYNEQvT3NvTHJSWmIr?=
 =?utf-8?B?TTVEQkFYV2J5dGdQeVpYVHR0b2p3bjFIZjNnTkR3RnpvSWd0NVNLODNkbm5u?=
 =?utf-8?B?T21zQ2dWdC81UVQ1RTlRNWE3VEdvaDQ3bHpyRmdHNWNaMFRWQTlLZ0JJVXlh?=
 =?utf-8?B?WEpyVTRCTHNjUWYxSHZXV0RjdEtUQzRUNFVPNmlsT1BzaE5TanZiTkFPMEU3?=
 =?utf-8?B?ZFFUR0Y5dlc2U1hLemF5Q0wwbnRCQ28xRnhhOUpYelQvNHhsQjV6blFGayt4?=
 =?utf-8?B?aC9nS2hTM1oxZjM3Mmx2dy9BNVhrZzlkSUF3RCtGM3hsS1VNTXRyaThrOVZx?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fd2b5c-51c3-4a96-0a32-08ddba495bbd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:50:39.1929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HElMZlY500MHqyjyO0yLShlDFylhuBiWKnh9a3IEAryjCklK5AAxCVDhqV2HVvyGmcufnJUCX5h03yHlRkZaKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9501
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



On 7/2/2025 8:25 PM, Bagas Sanjaya wrote:
> On Wed, Jul 02, 2025 at 08:00:43PM +0900, Alexandre Courbot wrote:
>> +FWSEC Memory Layout
>> +-------------------
>> +The memory layout of the FWSEC image is as follows (this is using an GA-102
>> +Ampere GPU as an example and could vary for future GPUs and is subject to change
>> +completely, it is just provided as an example):
>> +
>> +Here is a block diagram of the FWSEC memory layout::
> 
> Above sentence is redundant (as it is implied by preceding paragraph).
Sure agreed, the "Here is" sentence can be deleted.

thanks,

 - Joel

