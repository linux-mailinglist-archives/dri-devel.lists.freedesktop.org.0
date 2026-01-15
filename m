Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63AD22EAF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D2110E6CB;
	Thu, 15 Jan 2026 07:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HtpuXbHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012037.outbound.protection.outlook.com [52.101.48.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8463E10E6CB;
 Thu, 15 Jan 2026 07:48:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5KOnDmc1X7ddQmMtFHb1s6Z65YR/UShmKu8IFVsDBb3nDdWrhM6D+K6RfpILp/HBk7nB9aGpXp/QhC5S4HSLJg2CzzFGbfQ5tfrnadorNTgql/oglH489/+Bg/0wZKmIvqQBsozd2Ghqg9U32NsilM01kEpFbeNiNhUPYkCeUizId0QrbcR7jIlGgNnQj6nJbCp3qyMhusIokS+UbWiv/FahUwzJnep8MuhbgVvfrJUS4uapleY5XbSkkVH6KDqm6k4Lz1g5tyP9XYYyKzBY2GxieXRLqLJ7ILXmgXhvHZ00YRdxalfAf4RurkhXUqNtKm6fLrkzrR4HwiVFZWZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BKVxX+v5peitlWUIYqVXQ/4ljh5K2RlSSeFuXw8gh0=;
 b=e9QqypDFXbLj2pDgHFtVBK3XhZcg6OAazF91wbEAWG0VqtaHKIAYzpwGFgPflcqJGF2qxgD6HYios3Lv5pXSGnbB5TZRZ+8vJ8YGuWfeYvV9+tmtl86bFNrtD29uw8lEYBraKMqaKekZMtsx/zx2nuxW7uV9Gi3AP/DJkz3S0arX9fgdi88nIRaPaKqJfhduRby5jVfptaHj4294IUtD2p2kHwP+dR6W6Qt5GqCMTwK0FEjeh1/qBDtbnBIInmvmwGKMHC9JFQwdBUSNG4Ah/emGeHpUD4PclyTA2hUar30KZwdqGI4IJYCwFNfRxeGPfCV4GGNvFu652wwG5h54tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BKVxX+v5peitlWUIYqVXQ/4ljh5K2RlSSeFuXw8gh0=;
 b=HtpuXbHKHEtvygivvhOOfRfHIa1vTkjjFgrp7+4eddlmBp7lmExSJis2rHiURDHVpydlqRO4YD+xLErOmiQlksZyGcyMjGUKE7tFBQAL24f2ckhp8nS4VqlBgufJYMvUrsurZyAhrJWoVRNXbYYQblntzR/WiQbLXlKfmV66z8mKSlRcis829zX9uDvHh3uY3D27elWvz19WAr22AuV6HMrcYaCqpYdJsFLgBfsEEyyQWJkX9i2wvCkupoTA+rvesnjR5epts9TgOwdhIJUSNrQkcK8oR+tBVurA4S+HQdhncqPfh+s8EfArFcGUhmuTL3wX9fKNB/fmUWaYmT4sVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB7422.namprd12.prod.outlook.com (2603:10b6:510:22a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:48:09 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 07:48:08 +0000
Message-ID: <1075ad94-3c8c-4e1f-be77-4bea9657d796@nvidia.com>
Date: Thu, 15 Jan 2026 18:48:03 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/pagemap: Correct cpages calculation for
 migrate_vma_setup
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-5-francois.dugast@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260114192111.1267147-5-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::7) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 48041259-082d-4b7e-382e-08de540a6cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG9MUDVoWXVyWkJyN3l2aE9BRit3NzBwSUd1dWlUb3RwVnNNMnZoREJqckJ0?=
 =?utf-8?B?K0xTODhiRzBHSlpKQXVPVzZhVUYxcExXNnNaa1c2TzdVeitCVTFOcjZDQWdm?=
 =?utf-8?B?UjNSaThCZktQTk9sa3pyb3duRXc1QXBHR3FDRk5GelFpVGFlc05YdDErQmtT?=
 =?utf-8?B?bkcwOXlpMlJxNUVVT2ttckg0Y095dk9nQkNwVlkzc1lwNEI0djBHbkZXOW0x?=
 =?utf-8?B?NStYdkZaRnJBNHZ2STVxL25ydkwyOEJ2V3V3UE5RMVpic3I4WUJoVGF0MXB5?=
 =?utf-8?B?ejBFamJscHZva25hUG8zWk0yN3E5eldsaGpZK3VHQlgxUWtqSjBsNjJBdnBT?=
 =?utf-8?B?QkFOUjMyTm1kVDdOOTcvdEwyRHg5MnlBSTZOVURrVGYwNXRGUjVad0lrN1k3?=
 =?utf-8?B?L3pxcU9HczhYclIzcWI2VjRWOXRzcEl2am9LS29EeWY1Z1U1czErbzNmVVVH?=
 =?utf-8?B?RUpWaHQ5dXNIVldiNDN6Tk9uOEVpU3p4OEIxK1MvZjMrVW5QUFBPalRqMWJE?=
 =?utf-8?B?Q3VPUjRZWnhKMHF1VGhOcG4vTHhBVGdmUXQ4MEtnbzNDYWN5b1l1MERaSXJI?=
 =?utf-8?B?UmI3K0JyaFBKcGJVbk1XT1AyMmRqZnFOMUVPemhMNnA2UmlZdjdjdzhWbFYy?=
 =?utf-8?B?SnhUNy9Ld05saDFnTFRyQ1BaQWNqQURodGZZNGliY2tIejgxL0RWeE5vc0JH?=
 =?utf-8?B?ckVuZGJ4T3VNZHlZWjdjbEZHWnZVWnpIQnE0VXUyNXBVZW9EVkROUGdKaEMv?=
 =?utf-8?B?VDhnMlNIclh6c0U0QjFqaUJ1a2lkVmdDaWZVOG1USUJ5bFB1TjVyQlZDSmo5?=
 =?utf-8?B?elRpa05FbTBMMUZPWklIUWhiVGVCQlBqZTVQeW5vaC9iOU0wT2pWQTFIUndG?=
 =?utf-8?B?RG4yU3VqK3V6Y3NLOXdvVmtSSGZDTHp2UFl5cmhXMENtbGZZVlduOEFHbWY1?=
 =?utf-8?B?dzhCNzdac0NnTEhjdmpqUndMM2twZm5ScjZUMFByT3Q5WE96aXdDSkJrNDF0?=
 =?utf-8?B?a1VySXlaeGptbXV2bnpWeWdicmNxN1pVWG5kZ0NNaDd0NnZOcm9YdStNbXFF?=
 =?utf-8?B?YTVRbXJLN3I4TG9NSUc0K2tVa0wzcWp3VlNicVhBRVRnZWlnNFNXQ2FZNXZ6?=
 =?utf-8?B?aHptT3RtVGhOVU0xMUdRN0kwZTZGTXBVWFNWWVFKcXBuR2N5clVwSFlQc2ps?=
 =?utf-8?B?aWZLMCt3WWdTSUxYYUwxemc5QW9PY1JOTWE4c1RIdk5GYk1yQjlsd3JkTmlu?=
 =?utf-8?B?ZHRCN2JXRE5EQ2FYcDhEaXpZejUyRzVXdXV5bUUxb1pqNDBEWk9tV1VEUGpw?=
 =?utf-8?B?T1dBdE5BeEtCTkFxcVRHRWx6Y2lkUXBQeE1PWWlOOHlHNTZ3SE14VnNNZmN4?=
 =?utf-8?B?V2d2Zk5COW9FV25MeWJXRU9OZWpkajRSdkRkTXd2Ky9ZREpXakZyaDhuWVgz?=
 =?utf-8?B?bS8wYll4TjA2c3pUaVRmWnNzZWlvb2F2d25NeWc5aFZoZ1FRRDd3SzBmM2Jz?=
 =?utf-8?B?cFZaRFpWS3BRUDd4T0huMU5XZXk4bVB6K2NBRE1sdWpUcHcyMmtnU3IrWHR0?=
 =?utf-8?B?L1JoUE1MS3d5TkhVVVg0TUVCREZmcUxiYS9YVUEzL0FCWVRIQTNmZFU1cXkz?=
 =?utf-8?B?VEJ0dlFjRlBNZFAvYldKU2lucVlaR2k5VG5UR2hOUXMzcDBZOWwreGgzL2d5?=
 =?utf-8?B?OElZQXlLdGlpZWY5SVYvbmtJamZxWjFIOFdSUXk2YlJWTTlBY2RnVHBBRWE2?=
 =?utf-8?B?aCtVZXRzNnpNWU9WTUxYamJ0VmtIRVU3VHUxZW9NL3dhL3JzcjVraGtoVTU1?=
 =?utf-8?B?MTFKcld0bGtPaU96L2VzUXlid2VIWEZtelMzRUo1OW9meVV3S2hFUVhQSUJQ?=
 =?utf-8?B?bDZCRHE2cEs1ak9EWHBiaXI4K3hOUU8vZ29weHBFZms5SGUrSlg4K0EyRHZ0?=
 =?utf-8?B?Vko5SmM3RWtnejhyNTM1NHJCUEFEdC9HUWpWWnhyUk9hUFp4NGIzam0xTUhu?=
 =?utf-8?B?T3Z0NzFBQkF0Z1pGMGRTUlVUWEZLMkkrNytaMzJ0VEtYNmJtbnBwUFdQVmJH?=
 =?utf-8?B?K3AwRVh1ays1U0IveFpDYW9SMGY4enJxZ2VrdmRrU21QbVcrdjZNWEZTRjBP?=
 =?utf-8?Q?/Hpw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzhZN2NvMUcvZ1d4T0xlcVR6eWgwemJERkVKVjMzd096eXlwTlBzVi9HeVhD?=
 =?utf-8?B?MEJhUmVmYXhNZXF4c01TYXNITkZJdG9VYmxQWWt3R1AxUzhpZmk5TGhRNFdz?=
 =?utf-8?B?WU9ONzMvRytSSVl2VXFwc1ZpQllleUpTcWEwcU1GQVFiRE1sUnVkVWJaU1dM?=
 =?utf-8?B?YVltc1ZlQVRRbHVBM1lHc3NJTk9hR3M3bXdZZmZpNDdDM0lCU2tBQ3I4SnQx?=
 =?utf-8?B?TitkMEEyRk9yYzcwSkVHMVdKMWpjUkgweFBkQnZhZENEZGFSK3lpZnBmOGFk?=
 =?utf-8?B?MWFOaVN3dE1PZG1abFBkc0NoanpaL0hoN3hGeVF2M2JwS1JWSzdOd3c0cDla?=
 =?utf-8?B?eTFJeGlZdzF5ZDdGc1JUd2ZUSE1ObU5xL0lKNTJrUjQ2aUptMFAzeVZkMFI3?=
 =?utf-8?B?SmNuUWJyWVF6eVVOSkhCTk5ubFRWNkJYRjFvSUFhYjBWL3VWNlNxWFhmOVly?=
 =?utf-8?B?T21KWndmU0UvRUxqUjMzSE9KbVdOa09YK1pnRmNCY29ndEhxVkVUNnhoQVJ2?=
 =?utf-8?B?RzEwaFczVmtvSE5Nd0tMK3N5eGVsQ2JoNEw2YWhzZDJCS3dqc2lJa05mSnUw?=
 =?utf-8?B?dE1mOFp5Ylh1UkVPMEIvQ3FJck9pSG0rMnBmKytINElLdlAwckxTb2VTamw1?=
 =?utf-8?B?d1lkWXJLMDg5NHRJNlFNTStNNlVqVWdUQVZqQzZNK1d3aEZ4VTVEVW90NHVy?=
 =?utf-8?B?bGpVTEp0N0dWU0VNZ2dKUjFYbVhHZDJtRDBGTk5wL1F5WFF5L0ZvNjlVelB1?=
 =?utf-8?B?eDlINlJhY1p3Y1hPRW14U2c2RW82QWNRcENMRDIrTUNlaDhOaHhtN3oyUzc4?=
 =?utf-8?B?aVdWTGtIcEIwNFNTY2tjRFV4TmdESWxqSk9XT0xpVGp5dXROYU5mTUlDc2p4?=
 =?utf-8?B?Qk9uZk80ang5YXhBajBmM1c4UGxzTHZjcHVib0Y2c0p5WWhtVlpBYlpsbHNr?=
 =?utf-8?B?UWdJZ2IyZUtnU1lzaEpJSlpXeW8wMU9uM1owYTRxSWFBVjZueGx1ZnlEbXhC?=
 =?utf-8?B?N2ZCdHdVVVJoZkJQWmw4cy9RMEFIUFVCNmRqaDJOcFpqODRPRHJKOVBWais2?=
 =?utf-8?B?bmpaU29OaTZLVTBmVDNzamQ4S3lvMzRxS1pNRnlqTjJrV0lhRURkM2dSZVVl?=
 =?utf-8?B?eS9aTjBzK2pOM0FkVm5iVkE2TnlpMWs4c05ETVQ3SSs5TUtvNFJiOHRjcm90?=
 =?utf-8?B?bGtwd1ROQkt0ck5DUTVQOXgwRkRhbTRDUVNscW1BWSs0M2d0S0JxSlBtWkg3?=
 =?utf-8?B?VU1wU3oxM29GMUNKUWVNZWg2VlVmdWUwZTFoQWJnRzRoQnZjLzRjOU13OVJX?=
 =?utf-8?B?RFZVN0M1anBRSktNWVpTcWFFZUFmSldrVVZORG9zZElvYUpQckxLcHhnYkp4?=
 =?utf-8?B?Ky9CeXc4OVIyRE5ydytRNkpveGlxZnFPcmtTYVluTGdrVUI0Y0lSaTVYcE1x?=
 =?utf-8?B?dVZpdzI4aGRHTGVtM04zY2dTdko3ZUhNMHVFa3RLZ2grTk9MVDZiSHNjbzgz?=
 =?utf-8?B?OUVXSmc4ckcrUXpxREMrUFVYc3UxMElpZ3pzTEVnZWlzQmpQd2VvV2JoSHUx?=
 =?utf-8?B?ZkwxclFQblp4OFBoUW53VTBzeW9ETWl1OHFqVDZ3R0lXekRUQW5UcUtFMmE5?=
 =?utf-8?B?VmloZ095dW5MRUhNRXZ4WmREaGhVYVpJMEk3VzZxWldSWUtBdTBkNlJPOGpO?=
 =?utf-8?B?aUF4SEZUanpsTFF2QkJWakphQnUrK2dNbGFOWkQ1SWRtMmUzV1YyWWtQaWM3?=
 =?utf-8?B?TGNmbUVQVHFlT0VtZ0dYKzVIaVc4d3BzL1NYOVNVU1Q4bE9XQWJTM29xa240?=
 =?utf-8?B?OWNnNjJEVmNlQ0M0RURpMTlGVFV1dXBGcXo0TFplY3RwNEZtWTZIblozUi9P?=
 =?utf-8?B?amx6dHhFQ1pKTFJPUHlaVTZjcFpucVpxMjlIaDl6aUIreWtibEo0NjNtTDBH?=
 =?utf-8?B?WUwzV1V6ZzVRYWRkZm5tZGhqOTgyT3VmVEJSSzNvM1grcUF3d3RXL3RJOFow?=
 =?utf-8?B?ODJJY1FZZXUzNmYyQ0FxVFJYQzZqYjNMcDdHeisyeXRDOFJVcDVTQU5ZVVU3?=
 =?utf-8?B?bUFLSHZXWjh3dExFbHJNSXFtS0w5clpTS3B4WEpVOW5QM0dGTi9ONUppUnZX?=
 =?utf-8?B?VFgrbXN2RW5sckVhd1lEWUlYWVI5TU0xdUE1S1NsVjI0RmhMaFIycURyYzUr?=
 =?utf-8?B?NnQ5ODdCVnFpVUxieXRheHBUU0lrLzRJQTFBVWs0WFBrbFl6UDN5Y2xpcXcv?=
 =?utf-8?B?bWFGeTRSUXZOdDB4MldzVnlQUWR2NFJzR3liNzFCZnYzTjdndG53L0xJK0I4?=
 =?utf-8?B?aWE0MGZ6NFM0TlMra3pGQjZnMXh1bUprUzJZTTBFUFNteFpBS2ZwOUZXT0pj?=
 =?utf-8?Q?7ETMGSMqBqzuBRLp8u2JK3GSAgWgE0iYy0oSLOuyF2zIv?=
X-MS-Exchange-AntiSpam-MessageData-1: 0gkRJ+P7ORWiJg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48041259-082d-4b7e-382e-08de540a6cef
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:48:08.8321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcJtayY82F/uHpMq7Qib6EtSEJoDlX4lW+wd/g9ZXfJPaB6qzncp5aWSDUGlHn0+0suBGK9ILgZt0OF95nH8tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7422
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

On 1/15/26 06:19, Francois Dugast wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> cpages returned from migrate_vma_setup represents the total number of
> individual pages found, not the number of 4K pages. The math in
> drm_pagemap_migrate_to_devmem for npages is based on the number of 4K
> pages, so cpages != npages can fail even if the entire memory range is
> found in migrate_vma_setup (e.g., when a single 2M page is found).
> Add drm_pagemap_cpages, which converts cpages to the number of 4K pages
> found.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: linux-mm@kvack.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 38 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index f613b4d48499..3fc466f04b13 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -452,6 +452,41 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
>  	return ret;
>  }
>  
> +/**
> + * drm_pagemap_cpages() - Count collected pages
> + * @migrate_pfn: Array of migrate_pfn entries to account
> + * @npages: Number of entries in @migrate_pfn
> + *
> + * Compute the total number of minimum-sized pages represented by the
> + * collected entries in @migrate_pfn. The total is derived from the
> + * order encoded in each entry.
> + *
> + * Return: Total number of minimum-sized pages.
> + */
> +static int drm_pagemap_cpages(unsigned long *migrate_pfn, unsigned long npages)
> +{
> +	unsigned long i, cpages = 0;
> +
> +	for (i = 0; i < npages;) {
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +		struct folio *folio;
> +		unsigned int order = 0;
> +
> +		if (page) {
> +			folio = page_folio(page);
> +			order = folio_order(folio);
> +			cpages += NR_PAGES(order);
> +		} else if (migrate_pfn[i] & MIGRATE_PFN_COMPOUND) {
> +			order = HPAGE_PMD_ORDER;
> +			cpages += NR_PAGES(order);
> +		}
> +
> +		i += NR_PAGES(order);
> +	}
> +
> +	return cpages;
> +}
> +
>  /**
>   * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
>   * @devmem_allocation: The device memory allocation to migrate to.
> @@ -564,7 +599,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_free;
>  	}
>  
> -	if (migrate.cpages != npages) {
> +	if (migrate.cpages != npages &&
> +	    drm_pagemap_cpages(migrate.src, npages) != npages) {
>  		/*
>  		 * Some pages to migrate. But we want to migrate all or
>  		 * nothing. Raced or unknown device pages.

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
