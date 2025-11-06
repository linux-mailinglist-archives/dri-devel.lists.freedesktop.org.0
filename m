Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55447C3CB69
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 18:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C08110E98D;
	Thu,  6 Nov 2025 17:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dTq6G0df";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013059.outbound.protection.outlook.com
 [40.93.201.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB7710E98B;
 Thu,  6 Nov 2025 17:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+IzqVHFoTM0IkSWO+q5oVBeWVkUbq94N1/+PcKFvhnkglZ9RGVqcoyj40w1kYIjORK0XWSCr5XHdIiA12tWcs5KAFpwbMybsT+obYsezyegQSUW3feBRaEVUMS/gmhGnOKpx/9cU4iSBO2CYUIpcPKZsQsn8GWIA9/Jqg3yEik8L/XymwyI/TDx3iyXcXIHMOTjNn6IOCp8eIeOQMoQPIzMg2XgFTOQ+bbtstgYkufQNT4pjbvvbwZKKItinj27WlNOJ3NbFQkfgkZgxc92vP7qm55GEEtQcJG1FlYNbT10crg4/xS8XX6qU+OUtpZ7SQ2zGw+PzUO3mrrGhueXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B58jlvDbfDHkjY/hdRcLrK8VNZLl9Pz+ji7l7GUOPxc=;
 b=NlWd8mn4C7AyHshLtUHPGh9+fd/JWKSHh77JrSHYvdMWvk8fm3OFtQXlai1VXAdoyGa/XgbMdYhy+T6aq+o3qLqSUoBQLcQvHRjCuwHnEZJacPmeOGurfMvlhYtO17MNJd6sunN1/M+Sg/I0KUt1zEmdjTDbFDgcWdLb+jNDPmUk9ePB9J7uHQhwygrQf3/HoGd21qrZ+TRwc4Hw3USZNIsJDZHq0xNNub4bbg5jtrDVHXN6mu7XiRCt3jF9ALAaA270DwpkUXxsOtgCzGEAJNgIWtvG8PYjfVIMSPOqfYUPtyepn0xzdxnBFlxWmMsmwsRbp0/9+WcIWkN3LCrz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B58jlvDbfDHkjY/hdRcLrK8VNZLl9Pz+ji7l7GUOPxc=;
 b=dTq6G0dfe2iy75z0ZACi6pdJdkhnDKSqlLOgnIMzigbLzJnb5CGgvIYeSssGVaI7q+7eHqYf2a/xtpXuBn314pUBLb4aS/d4oZIi8cQULXdDJoCbrTBnxwZ9IUEMCSgL42KuJiXR2lOq6CB0uyMJvK80FsCoiDog1s7eAfXEnro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 17:07:39 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 17:07:39 +0000
Message-ID: <5ddb1da4-84e6-48f6-a9d4-10560f58ab90@amd.com>
Date: Thu, 6 Nov 2025 12:07:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] drm/amdgpu: fix KFD eviction fence enable_signaling
 path
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-12-christian.koenig@amd.com>
 <febe733b667c1700333044bce8649c6520d69148.camel@mailbox.org>
 <5a770cba-9fbb-4645-a987-afe25e446942@amd.com>
 <887de3dc-f6a8-46c7-baef-862fe1acaf02@amd.com>
 <9484fec0-ca36-4968-9edc-ca517825fe68@amd.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <9484fec0-ca36-4968-9edc-ca517825fe68@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0189.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 20435c89-8b77-4d7b-df0a-08de1d56fdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?em1xOVdBWWJFYk1iZkhTdmw0RnRrMEs5eUg5Q1pzQ0NLOVhSOEROT2xUWW9E?=
 =?utf-8?B?Y21MeERNcm9wYVBkc1E1SEFXTDBsVGd2aFRGNmlzUzlUMldBVmFaT3gzSlN5?=
 =?utf-8?B?Qmk2bHZWU1dYTTgwc0lxMTExTEZUNjkyTVhHQVoxbTU1S0x2emtvbURPSmZs?=
 =?utf-8?B?NlNvMjc4RHprMjMxZEZTNmV3d1dVTTRYVUh5a3lzMWh3c3FzTWNkbGhBNk54?=
 =?utf-8?B?L0ZSSlVhUWJJenBuMEhEK3VEaGRkL0o4MitaYzZOekJkZ0VETGVsWEk5WHRV?=
 =?utf-8?B?Wmw2N2c0TU5XU3RtR09RK1BMT3g2Z20wQjdWU1lWOCs1Z1NMZmllZmY4dWRY?=
 =?utf-8?B?cFZCeWdpV1dwcTUzU0NIeW5tUUczQ1Q2bERpczQ3VUw2anpyWFo5Z1U4bGRn?=
 =?utf-8?B?UWZaRXNQTDYyMHZaWnQrSUlZQk9aRXM2cFVSRUtBSitNQkxBdW9ScmxCUXRE?=
 =?utf-8?B?Z0lwSXNRbjNMdmVGTW11TjZ4RUJrdnZiZWFSNkpmaVBmcUZLbFg1UnhCWGwy?=
 =?utf-8?B?Z1hVMnJoQklESlZCemx6WFFNWkxWbG1VMGJSMkpUS0VzamRKQ1liMENsS09p?=
 =?utf-8?B?VnEwOGtMRHplWW1CUjRPYXI1ZzVjWndHMWJ5S2VBODl1dlA4R1BhVzVxQ0pR?=
 =?utf-8?B?QWN1LzdDb1VwZEtYWERBS1lXR3Z3bHZhTVBXQTZwcXM2cjhUamFyZ05scHhJ?=
 =?utf-8?B?OEV0QjVvWnplYWpJaGtWVHo4UzBRT0hRYmVXNmdNQ3BtS2l6SCtiS3JrZFFX?=
 =?utf-8?B?WXMwVk9DK1NleHNNb0tzWGwxUHhxamF0ZTZzeWdZcDNPVWhTb2pVdnV1QVB1?=
 =?utf-8?B?NHZzeU1saVNqKzdmdkNiUVMxY2d6WTlQY2NFeXVhbStXWEFiOWpVRVVhVVdm?=
 =?utf-8?B?dkE2c0RObHk4a0VyNDl0a2oxRzFKWi9tTWxIT0F2Uk9lRjFDOG5jellaeU1t?=
 =?utf-8?B?SEtMSG9qdExVL2ptbC9XQzdZakFwNkFyNlVyeDFlL1Z3dGUwVW5XRmlydzUw?=
 =?utf-8?B?WmdONzJ0Yi9lL2E4a2libzUyc1ppc2FIc2dIYkovTjkwOVpUd1FRbStTZ0l5?=
 =?utf-8?B?VWdMZUxHT3NQZTFoTGlCdFNzNDB6VThYcDB1Ym1mU1hTK0RwTExNaHpNUHlZ?=
 =?utf-8?B?SVc0aVdpVkhTckdERTkvNUorUTJhaGsrRDhTakM0bjlQcmtIc01YTmFsMDNG?=
 =?utf-8?B?cW9ZaWlsckt3bWk2RlI1QldsYVA0UXZzSnpKV3k1cVJETm5vb0Y4d3IwZ0xl?=
 =?utf-8?B?RUZ4ZFZ5YTRwSVNuOURxeU9uR09OSHNrcVJqSDBVRXhYSVZBWjF4RG5IZHZ2?=
 =?utf-8?B?Q2wxVzBlcWVjTjJuZlR3Zm9Mbmp3MXQxbzhJUUlzSWMyZEtnbldSZlRHUHJG?=
 =?utf-8?B?YU9LVEQ3b09Wa0Vpa3NnYWo4N25WUm96blFqRytFMDIxTG5tWkZoREdLYlRM?=
 =?utf-8?B?dWlDZWN5dnBjQjY4WkdOb2tTd0xNeHdieng2OVZCendxL1JWVXNiYktkdXQy?=
 =?utf-8?B?UkZZd0d3Ni9mbXIrVGx4dFlkaHBnc3NZWUVSTG9sVk5RSFBDV0pOM2trR00w?=
 =?utf-8?B?SjVFRHBTNUhRUEMyb0lhbzdGU0czRmZLZ09lckN0S014VlhkVU9xa3dUbTVv?=
 =?utf-8?B?WmhRWkRGbzlxdVl0emNhMmJFcm1Ub3BNK3VlSXRZNk1PZlVtcVQzdXBsTzd1?=
 =?utf-8?B?NE84SnZjcVpLTWZaT0Y1cWhKN3gyMStnTnJqbVBkNGJFUUo3cTh3VUZ0eVRW?=
 =?utf-8?B?c0RVVWxzYnFpSUd2Q0Z6ZG0zUTEvMkhlNVdtTllQZE5UMUZlYVRkd3pqV2tk?=
 =?utf-8?B?amJuaW1abkl0UUxiZHRWTVk0RkdoK2JWRzY5eWEvU1N6ZlhlcUpPc1dFanhj?=
 =?utf-8?B?U1pqUWlCeWxmYmVwdXEvUzQ2bjNicXhNUUJzclJPL3V6N1ZDTUZjVzlWeXdR?=
 =?utf-8?Q?EgirHbDHzGY5GtI3ylzUJ7W+d7E9STUc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNQSVk1RHZrNDhhWnZyOHJ0ZERiRXV2NzhVQk1WN2lZak1USVFadkFjTm4y?=
 =?utf-8?B?N0Y1bnJIK3drdXUrSlIzLzFDbmx2ZFdrRkFsWVMxODFmKzNXcVo0OGhVTDdq?=
 =?utf-8?B?YTB0c0xDd1VDUVVFaTNZNEhNYmpFU2JCYWphOE5WS2pCd0I0WGhIUFpNUUQ5?=
 =?utf-8?B?NnJVVFBlVTZGNnhLOVZWWVNTaWs4Mm12N0tzZWM1Ty9JVUJVd2puaHhVQzh1?=
 =?utf-8?B?VGFMcUwwd3lGd2hob2NPY0V3ZVVtdGwrcnFPZW85eUNTNGdaMUZMOU1zNGlB?=
 =?utf-8?B?Y2pCaGhNYUNabWM5Z0QxUlFscVMxL01DY3RmaGY0aXJoaEdIRUVhZEZyVng1?=
 =?utf-8?B?dnZtMW9XUDlPTmphRVRMY2dHaU5QRFVrYml2eDRFM0JOaXplU3hIazR0NFl1?=
 =?utf-8?B?M1AySDBOZTEya2MxS0dNZ0tWelRDRzBLMGFNM3FEZ0xNMnVnOEEwUTZreDE3?=
 =?utf-8?B?OW0xcmlSQlpvTXVRQWJlRkZUcVN5U2xiLzZheHBrYklnMGsvNGdMNFAzdGp2?=
 =?utf-8?B?U1RpNGgzdFVEWDM0U2M2L25FbW5OWmpBdFBVR2kyeDdGdjJ5NVpLVVNGSDRj?=
 =?utf-8?B?YmgvdW1SZ3FlY2lIaTRXYlRXY1NLbHAxYlZHYng5WkNQSDJ1TDJVYU5XOFVF?=
 =?utf-8?B?QVZjYUtaeU9yUjErZ3MyZG0vQ3NyMmYxMUFQRE15YkhYa29LbUFmYlhrSW5V?=
 =?utf-8?B?TVcrTjQ1T3RlMTVaT1VWdWgvbjRIWDVzRVNiQ0JjQUFVcEJUWEM0Z0NJZUh0?=
 =?utf-8?B?ZDBZMklIOUxwaEFNVlEzbnRlMTJCb3gra2ltSG9OekFRbUVIV2JRTkZ4bUlP?=
 =?utf-8?B?U3hUVkxNQUorM3RLZW5CNTNuOEw2M1I3N0U5UjlFSXRaaGZyUnE3blpaN0RO?=
 =?utf-8?B?eVFGWFJac0YrVGkyTGJvZ09CMHlyRWV6dFZ2MXZLTkVKNTJXUGZzUFFqb1pO?=
 =?utf-8?B?TU1TSy9jT1p0ZW5Cc09jT0Q4UTYvWHVUYncyeWtyMTNvSGh4c3hTQlFySFdK?=
 =?utf-8?B?Vzg1NSs1L3V1TVV2T0VVVlROYjFkdm41QW1DY1pVcU41THJ6MzBzTWFzWDZu?=
 =?utf-8?B?RXBQZ3ZEeXo4VDlGR1UwWVo4NjgzajJZdzdBdzZVU3N0RGdIbldVblVXNkt3?=
 =?utf-8?B?SG1teW40bmhzWWt2ZzN5d3BDRHBmNzI2QkNKdlhsa0tGU1hQWStQYmtXUzZE?=
 =?utf-8?B?NXBqTVlET056OStleS9sdGozYi9rMDBib0N4MS9MemtMWUpNMWd2ZzRzQVZs?=
 =?utf-8?B?KzI2U2Q0cHVqd0lWRkI5OUdBa0VHdGhEL0xBcGRIL3FNcmp6dzIvUmlxWkVC?=
 =?utf-8?B?aWlTREozSDVYZ3c5SXVKc3JaQXVmTzVMeC9OTVpBNlFlbm5QMUs5aUEwMHZB?=
 =?utf-8?B?NlZiaEVScDBYazArSnIvMk40Mk1qeVd3d3loS3hpTzlzOTVnejZOSlR6TnVD?=
 =?utf-8?B?TGNJSmtxR1UwU0UyT1paa2hZWnhEZjRqdm5KVWdXUm00YkVlVDhCUDRRdmxH?=
 =?utf-8?B?NkI1Q0tSTG1WNHZNNHlJNmhnVVpIVkpId2xudDg5eUlnVGhKZ1RSOW95ODBs?=
 =?utf-8?B?ZU0yaGlObHE1R0ozZlRYeWVYakFJSldlNzM5L3VxdEl1dW1zZDR5VHV4aFFD?=
 =?utf-8?B?SlMxOGxIYitxZ2NWc2xYb0ZDcjlseTZuRUpJbEhpK3VsVkJMeXMrU2VpdXJr?=
 =?utf-8?B?SVpvbi83V3VDNlF1OXJhM0tpcXBQOU12aHpucFlnMzM5aXBOdEVkVDNWZWd4?=
 =?utf-8?B?YVpqQTZ5VDRqcEtTV3dpeUYwK2dJbnBiZ1Bid21JdXRGcVFTU01xTktjMlI5?=
 =?utf-8?B?Y3hnVG00RXdWM2RQSnBZZk5IQlBXd20waHpBa1Fjc0tqWjhUbmdlSUZQZUVw?=
 =?utf-8?B?Yi9nRTBLYnl2OTFlSjg4amZTcHVkaXIrZHoySHVvazJOWGNxeldhNWZYVURT?=
 =?utf-8?B?VERnekpVNVQvWW1PWGp3QjZBdWd6WitRZm1rTTVIK3F2cHRsRWw3QTB3OXc5?=
 =?utf-8?B?OWJ0ZjFPR0lvRzVJaHdZajh2YmxEeGw0ZmhZbEZEUkFVTXdIcm0ycUFsS0ds?=
 =?utf-8?B?NUJHbm1iM3JNQVVVdHpINTBONTA4djN0TG5nQzk5MUdFL0VRWDNFemEraXp3?=
 =?utf-8?Q?M/rjK/cWXKkl+i7S/WR9ewlbU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20435c89-8b77-4d7b-df0a-08de1d56fdad
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:07:39.5216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHcECwFZfCQJjA5vDAoly6OtuSiVQrZcEkyJ380PBSeodYdQhAG8XnJYQVdcV7tJkZ/ONx5yxzHxshH5PggRvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032
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


On 2025-11-06 11:46, Christian König wrote:
> On 11/6/25 17:37, Kuehling, Felix wrote:
>> On 2025-11-06 08:43, Christian König wrote:
>>> On 11/4/25 17:28, Philipp Stanner wrote:
>>>> On Fri, 2025-10-31 at 14:16 +0100, Christian König wrote:
>>>>> Calling dma_fence_is_signaled() here is illegal!
>>>> The series was sent as a v2. But is this still an RFC?
>>> I think when Matthew came up with the XE patches we pretty much agreed that this is the way to go.
>>>
>>>> If not, more detailed commit messages are a desirable thing.
>>> Good point, how about:
>>>
>>> The enable_signaling callback is called with the same irqsave spinlock held than dma_fence_is_signaled() tries to grab. That will 100% reliable deadlock if that happens.
>> I guess we could use dma_fence_is_signaled_locked instead. That said, it only tries to take the lock (in dma_fence_signal) if fence->ops->signal is set, which isn't the case for these fences. That's why this has never caused a problem up till now.
> But when fence->ops->signal isn't set then why are we calling this?

There is no need to enable-signaling (and trigger a preemption), if the 
eviction fence has already signaled.

Regards,
   Felix


>
> Regards,
> Christian.
>
>> Regards,
>>    Felix
>>
>>
>>> Thanks,
>>> Christian.
>>>
>>>> P.
>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
>>>>>    1 file changed, 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>> index 1ef758ac5076..09c919f72b6c 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct
>>>>> dma_fence *f)
>>>>>    {
>>>>>        struct amdgpu_amdkfd_fence *fence =
>>>>> to_amdgpu_amdkfd_fence(f);
>>>>>    -    if (!fence)
>>>>> -        return false;
>>>>> -
>>>>> -    if (dma_fence_is_signaled(f))
>>>>> -        return true;
>>>>> -
>>>>>        if (!fence->svm_bo) {
>>>>>            if
>>>>> (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
>>>>>                return true;
