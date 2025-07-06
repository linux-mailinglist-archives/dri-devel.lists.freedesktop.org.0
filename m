Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73DAFA281
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 03:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D979B10E248;
	Sun,  6 Jul 2025 01:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ad/AQrp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF6B10E07A;
 Sun,  6 Jul 2025 01:25:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u77C9/GPKyjJLPnS/d6pUVHrfu1F585PlG1i4C7Yordgif5Y8kvkmpEqh/k4Ft+mM7TJhCBSk3N97GBu/8mtbxjiEdgAF2ALhIszKdhhfeZ7frVMlUWO+2PsvVYPqPuwjh6MH1UmPdId3zdQ+ablT2qq4Jnkhxqbi9xp3lviPDXPZZyskCie6kGha2IQwnLVdpPY+5Qxdf8q1B5JHOG7Pqujdc01ovHAKuZth413VJMs8BXXkW6GX7ZJnHBk64WpH1Lip7mudQXYqNHQHx9DtrQtUhzqrwyn3vIgvKLWXe7vk0aqKTjF+Ri3GPSNu6yJnf7yICNbvmc0abLOwnEmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQX5/btPVN5xw2fo3ZKFPzjWp2bmg3tmHLG+OTLScho=;
 b=eVQefQnwTot5y6UiiRQXlJZARph10X9xfY4N3QSzQO21m6WWBFb1lk+S3k5BOhBaSvi6JaWm+LHQtyc75GWTGg8cJEypGMpk41ky5aCmwHwH6dLRUc7zsDS4XVQstvl4evizxEc37mHU3uz5yKK477bbwLNLWJj9Xb8dRTN+fUCcwplLkt/ge1fBJi1dDb61xxIXR38t37RjBPP5ZvC1fw3leO2M2NCRZgQgNGogGDUlo2nG5fjV1NYmDXW9kWU9OrTyMcUbdSuVePtCSIbURNBfLYunH1LJiUmZ+yiOagvrg7RKvBknOtNIp8bEcz3b0YLRXgjcnixsh+anKH8jeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQX5/btPVN5xw2fo3ZKFPzjWp2bmg3tmHLG+OTLScho=;
 b=ad/AQrp796L1G3zqU58kU6eAXmgwg6hM/Tx4MF1muMaX1OsXddqyQT7/HPbDh/eRHRYJ6nmM3GUW6azVKYxKZf1VNMwaIudD+DGQeFawYEU+4p6k3u7aIQaCBu8F2xZ2axcYRbEOHvRFyltPCZWcMnjVQKe2Uvhc1r7lrhzREdTRFikdAFojYSTPoIrxXn0g4pK4aTF+7GRGuJUx+R27k6FUVMK3UEd2llhMtmJQj5YIGJwLx74mNNhWC2rmKDmBjJ90ZbYggmbmqj1Mv8cfAK1zS2hkbVkpllHzNpdROB+sqHb9whDRvLs1dRSOK016Riu825KIGvz+IF8FGB7COQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Sun, 6 Jul
 2025 01:25:39 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 01:25:39 +0000
Message-ID: <cc07f0f7-0b94-4b6e-ac5e-c83a31101f5b@nvidia.com>
Date: Sun, 6 Jul 2025 11:25:32 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/11] THP support for zone device pages
To: Zi Yan <ziy@nvidia.com>, Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <Z8oq10LQBGnqpjQl@lstrano-desk.jf.intel.com>
 <6a8d6234-9d45-40b0-9038-e09f1084b229@nvidia.com>
 <aGfcrmyj5soCZCDx@fdugast-desk>
 <D84BBE29-5600-48A3-9900-1787C5B3C8BF@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <D84BBE29-5600-48A3-9900-1787C5B3C8BF@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: ab98f217-fb17-407a-a523-08ddbc2c03ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGhXMzRVYVdtbzVlYWErQXJqelBGc2F4cUx0TndRWFBmYVljNTNmOGthUW5J?=
 =?utf-8?B?V3dTQXJadkF5a0xVYlpyVjRoT0VqT09XVWVKUXhUdjJORDJxZVJhZHU5Q2hr?=
 =?utf-8?B?RGJzVXlnZXB1cnI5aDM1Qml6K0tzak4ycThqSVErUDNUY2pYZlFKWGpGOStT?=
 =?utf-8?B?ekVrT0RHenZWZ1ZhRWxQVmlZMWl2YVhYNmY3UnZWWmhhYnljNjdXTmQvWERU?=
 =?utf-8?B?bm9HaFNFY2dKWklLM3U2VjBZUUorMDcxVUxjSzJ4bFN0VThXaVpCUGZ5cVRR?=
 =?utf-8?B?YVdVT2xSWHNDeEM5cnNkNkllTUVHcmFLaUpEeDVlelRDenJLY2tEUHNCL3BR?=
 =?utf-8?B?cUMzNkgvK3RzQVdNQUpFcFBLOEc0K2pGRG4xTVo0ZjQ5dlZNNFg3N0RMN0Jp?=
 =?utf-8?B?V3doNkFYR1RrdjU0aldDdi9YNTdmQ1ZkSGdjMDc3c1NIMWZBTVhFRlY4ZHgy?=
 =?utf-8?B?d0dORGwvN1pXR0dNMlR1c1hYTzU2UTExaXFHNTVaOEQ1Vk1HSmJOSStIckxl?=
 =?utf-8?B?TlVjdVI2M2ZSRFBKeUtBY0I5dFB1cmVDTjFxMDgxVC9LVW9yZGQraW14bER5?=
 =?utf-8?B?d2UvN2l5Ky9uWFh2Q0tOVVVIdldZVUV5eEpiL3hDMGI3YUU2em56ZjlMcm81?=
 =?utf-8?B?UW9helpIMThyT25lSktRTlhJZXJ1MG1iWDVRV3NsYnRqVEl6Q0haZC81OHll?=
 =?utf-8?B?aEVKVGxwNEFiazMwQnpzNHNUN3pYZlEzelZyR2lKZ0JkLzM0ajh6MUJ2K3Fx?=
 =?utf-8?B?dnJwRnJWOUl3N3hMK1ZPR295YU12Z21lenJPbVFEUjBoN3JhQmlsaXBOTWJx?=
 =?utf-8?B?eGxlcE1oZm0yNDNjTzVxa2I5M3BlYkw3SjNWR1dWVjRXWXVhOUdxck9EYVlH?=
 =?utf-8?B?cVlCZ3JJSzQwa1EwVlJGQU1jY0NLZDROVUprczJDcTFoSjN3QnVLU1ZzM0Nh?=
 =?utf-8?B?YW54WElWV3NtazhuMFdud2tNclAzOThDL2JIRGp3VHJuSEkweXFZcE1iWHRq?=
 =?utf-8?B?Nm0yczlZQnQyMzVaRmlmM2pUblJQTUREZEh5SVVtU0tnV0Q3YWNMRFhhYmRE?=
 =?utf-8?B?a3JMWk5heXlibDhENDNLcGJheGVjVkYrQVRuK2NybzY3VHpuNldjVFlwa0cz?=
 =?utf-8?B?a3dlc0NzY04yUkNHbzhGaWY0UzJ1bHgxT1M4allpMVhndFh0OGF5N0J6S204?=
 =?utf-8?B?TXR0WmFmQTFQVDNjQkRKRXJoaE5Hd3NEczlONTZYSFJvLzNkME15VGZZcFVl?=
 =?utf-8?B?YjcvQWZNZE5EWERFcXdSRUFzZUxVWFNaanhhQTVTcGNKekphWVpJNHFnYjl1?=
 =?utf-8?B?clFwRktyZC9oUUdZZkRXNmVQSFRCOVo2WVZ3ZGNZZHBPRDVFalhzUWthT0VV?=
 =?utf-8?B?cWpDdlFvcW5qTFJPRTVWeEI3ekdDdDVSWE5hOHNmMTU2V1RoUDBHaU43R3l6?=
 =?utf-8?B?czN3ZWExSGZ3L3pScVY1d3hEanQzV29JSUhRcklta3R1RWlYeFhzOTNrNkNW?=
 =?utf-8?B?V2JFVWowSmh0K0tCdTFON1MwM2FCKzA0S2QzZlpCeVF2ZE5nM2hhbXp5a0NF?=
 =?utf-8?B?YXdzei9Id3BwaTZSU01kWXZzbG84K0tSb1V2RVBxVkZRZXJMZUtpYW4vVUVG?=
 =?utf-8?B?czltTFI4Mkd0WTlzTzY2Z1dXUy93UExtL3lvc0taci9MQi9Db0dTQTNkZHJM?=
 =?utf-8?B?SGdpNmloS3pHam9Udzh4Qzk1SHJ4RnpIZEpEbTNUUUdUb29lbFRQMWtpeEdr?=
 =?utf-8?B?SjcxWXVrOWFITFZWSG1DeWVTTC9MbStsRWJ3SEFWekdtTFlEdm54VGRsSHpE?=
 =?utf-8?B?TE0wVjA0QkdYNCtJQlZ3bjl4K1lMWGhmbVR4TTJMeWMwVUphdVUwSkpncTBE?=
 =?utf-8?B?dEtWVXB2T1NkS2RiaVNVYWxneHFyaGJaZDNtbm42d0t1QmVUUkI3MEFZY2Rq?=
 =?utf-8?Q?U2etyAj6Rvk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU10NzN2SUxhUmQ2b2IyVkNxamJGSE84cUk4V2ZTSE1UNWhqdHlYcDJsK2dE?=
 =?utf-8?B?WWpZcEFGekt6Y1ZBK2hhZGRSS3dkR2xNeWE5WCtKaGNsMUVkQmZWM0dhU2Mv?=
 =?utf-8?B?bUJvL3MvdXBFN3c5cUZ3TDdybElwMzk5VnhET3ZTcFFRcXl2SVE2K0NIak9m?=
 =?utf-8?B?NnFoc0VFdXRQRk9UUjNRNUoxRWxNTER2SFZMUnpYT3FwRWQvZXRxQ1FoL0Fr?=
 =?utf-8?B?a2Njdm8zRUlRaXlOdlRzRUpyTWhDQmVCeXYwU0FuR3h0RUY5UTBZQ09Bcm5y?=
 =?utf-8?B?YlRkWlQzckdXOTBsY1dGOTc0Q3djdC9paUdxeGxpeloxZXR0NnpJSTNRQ3l1?=
 =?utf-8?B?MW52VVM5Mno1ZzR3b3pFOGJEVUVEQW4vMGFmemlaL1Z5Nlhvc09qblU4bEwr?=
 =?utf-8?B?cnNmVk15L2pvbFBXVU03UDdrNlhiQU1PZjNudW5vYXR4TTVvR0M4dURQeSs2?=
 =?utf-8?B?a1k4ZUtqNlZmV0E3V0pTY0NhNmhOay9Dc1E5eE1yTDNVSHRsRnBMY1J6WnF0?=
 =?utf-8?B?bjZYTzVFeXllakIwNVdFc0lVeHlseGZrMDl2Qm1rWkJSZlRud1ZaUW5LUFNF?=
 =?utf-8?B?OFFUbDFQOW5sQVNERmF3YzBJY3d1V1VlUndheFdEMzI0K3BqbndRTE83RHJD?=
 =?utf-8?B?VElhbDY1MzVNbi9CM2E3eUtBa2lqL3g4YmdWczBGR01vZi85a01vVjR5YXNt?=
 =?utf-8?B?SXNpeUNFU2JMUTVadkN0VE9xcWNIbk1EZGQ0Vk9DRGVKaHo2Ukc2Q05iYTN5?=
 =?utf-8?B?WGZuMFF4M2FxZ0FWejVuN2pDOVhITERFQTZvelM1ZjJRaE51UDIvcFVVd3Uv?=
 =?utf-8?B?K2JRejhjUmJ0QVgvNVpqLzFMQXhGV05VNVdxS3BuRXo4UEdTZktCNEhaRVZH?=
 =?utf-8?B?WUg3UzYrcmxtSVdQR3RQN3Rkc29PaDltdTREMSs4TVhyOHBpOFZzeFk1K285?=
 =?utf-8?B?di9mV2J2UzFqZ0k2RnduVTU1bGRzbTQ3S0xjOVhabkFOTklPdkIwSDR5dmhJ?=
 =?utf-8?B?UVZFcGhkcmxVUXlUT3pVK0VXUGtuaDVpTEpjZzZNaW5ML1laK0xHU1N3WTNU?=
 =?utf-8?B?UkpxR01UdVdwZWVlVVA3MzJieUhUalhZZFRyQ0Q5aG5BYTJrYm9WQkRaSURS?=
 =?utf-8?B?cXRxOFd5RnVyQldBTnp2Wm0vNWJPMUxCTjRzNG5GNGxZbGlkcE9nVmVvTVl0?=
 =?utf-8?B?endKbHlzaGlmZ1paYWtFeVVPN1ZRTi8xV1Z1K01SRFBNV29WTkxKL0l1NHl5?=
 =?utf-8?B?RkRId0RuTVc1d2VGY1hDbG5WVW50QnJUV0dvT3pJclpOdW9DeG5XQ1ZlQmxW?=
 =?utf-8?B?SlhDai84ckJFOW5zQ3l1UEdOTTdaaWRTM1JwSlptMWZJbGl0WmsxZWVlaGxS?=
 =?utf-8?B?Q0NiL2FDeU1xV0dlTVJiWUNFQTFjK3BMb3hQemdMQXNJS0ZLTDJsQlA4dmxQ?=
 =?utf-8?B?VUFId2tVWUxSWUhFTmcyYXJHT2w5bXZnVSt2Mjgva0p5dTErSW9pb0lnUkxi?=
 =?utf-8?B?MlBUWDRYSGNUQ28yVzNGc1RmV2U2ckVSSlBVK3NndGFLVVUzeTlYUWhBZWJk?=
 =?utf-8?B?b0taWXBJWWphTDNOY0c1Z3p5ZUxPaFQ4TWgzQWtMQ3BMdHZHUWlScDVVY3Vz?=
 =?utf-8?B?SUsycC9XMTErRWVIOHZvOGY5N2lBUVB6eURudkN3SlBUcVpTZmtnUlRGUUVG?=
 =?utf-8?B?MUpvelhZMDd2RHJ2bEtpN0NVTjZEbjJ3OEVQYmdBczIrbkpHY2NRaW1JNzdp?=
 =?utf-8?B?anlzOUtsRXEwOXZ4NHdrZHRSUjRkRVdTOVV0ckJ3WnFaN2xxMmdISmZtOEl2?=
 =?utf-8?B?NE56OGlvZkZpQSttMTVGMm5BcWdPeU5DUTg5MTMxemFiazdOWEpOUnpOL202?=
 =?utf-8?B?eW9TdnF6UFNtbW80Q0ZjSWdXcmVGSU9VbG9ZZmNIbS9EcVN2WXdYNFZMMnY0?=
 =?utf-8?B?NEp0OGtCM3FReXFmTmZ5MDBGRDJSSTlyRjRzQUo4bTVPMkhaZTBad2FtN0ZU?=
 =?utf-8?B?aVJnamRvTEh0UDVFUys3UTJFcFRSa0RUVTNIUE01MXBicThjKzl3RkU1UjJx?=
 =?utf-8?B?VHpxTVI5OWxmeFJTMU9zTmFXOEltSG9Ja2tQNTdacG9nSU5GUVBha2lXdFlR?=
 =?utf-8?Q?mBkG3Myfow6xXa3p4VTAQSKhy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab98f217-fb17-407a-a523-08ddbc2c03ff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 01:25:39.3169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qavxBPtrFpV5Tk0/MySOa7F3qEGG0F9Y65JaMWA+eX/B4hFdETuYqgs3d25Y1e8Erw5kExlcItnEEuuSZQH6QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226
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

On 7/5/25 02:17, Zi Yan wrote:
> On 4 Jul 2025, at 9:52, Francois Dugast wrote:
> 
>> Hi,
>>
>> On Fri, Mar 07, 2025 at 10:20:30AM +1100, Balbir Singh wrote:
>>> On 3/7/25 10:08, Matthew Brost wrote:
>>>> On Thu, Mar 06, 2025 at 03:42:28PM +1100, Balbir Singh wrote:
>>>>
>>>> This is an exciting series to see. As of today, we have just merged this
>>>> series into the DRM subsystem / Xe [2], which adds very basic SVM
>>>> support. One of the performance bottlenecks we quickly identified was
>>>> the lack of THP for device pages—I believe our profiling showed that 96%
>>>> of the time spent on 2M page GPU faults was within the migrate_vma_*
>>>> functions. Presumably, this will help significantly.
>>>>
>>>> We will likely attempt to pull this code into GPU SVM / Xe fairly soon.
>>>> I believe we will encounter a conflict since [2] includes these patches
>>>> [3] [4], but we should be able to resolve that. These patches might make
>>>> it into the 6.15 PR — TBD but I can get back to you on that.
>>>>
>>>> I have one question—does this series contain all the required core MM
>>>> changes for us to give it a try? That is, do I need to include any other
>>>> code from the list to test this out?
>>>>
>>>
>>> Thank you, the patches are built on top of mm-everything-2025-03-04-05-51, which
>>> includes changes by Alistair to fix fs/dax reference counting and changes
>>> By Zi Yan (folio split changes), the series builds on top of those, but the
>>> patches are not dependent on the folio split changes, IIRC
>>>
>>> Please do report bugs/issues that you come across.
>>>
>>> Balbir
>>>
>>
>> Thanks for sharing. We used your series to experimentally enable THP migration
>> of zone device pages in DRM GPU SVM and Xe. Here is an early draft [1] rebased
>> on 6.16-rc1. It is still hacky but I wanted to share some findings/questions:
>> - Is there an updated version of your series?
> 
> Here is a new one: https://lore.kernel.org/linux-mm/20250703233511.2028395-1-balbirs@nvidia.com/.

Thanks Zi!

Could you please try out the latest patches Francois?

Balbir
