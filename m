Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B476B96C82
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 18:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F9F10E1F0;
	Tue, 23 Sep 2025 16:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IoqreTlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D31410E1F0;
 Tue, 23 Sep 2025 16:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qy2TO3B7Ubv7q79oU0IiZCcyQzEopfObBKkmbNZD6SrkWMyDA1Qhxv4fVJCSsWz9Gmf+WhNMHznKa2k68EpJgzqV31wM03mQmWcOPV9MJVgzrygUAjcO9uOCKDfBdYzL/9QGkYKWagaDW9H4M3WIa9Bb9yZECjx0SnmPr9c4Q48P6Cl/B31taSQOA+n8tVg+FRZnjhDZ3+t88yh+0JPHeabjezKkHUeaY5nw9n/NoFpoGfhhXz/7sZEw4gLShpuXf8X6He3qys05PfdvsQvu6u2TrueJ5fXpNXnwgtL1SpcaS/+88O6wA2Zf2d296Wxeca4RxBju3SkvaoB06Ay0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wShlEuZOKNbktGEeHELP6DgVAopjq2aDhXTP72l+fGc=;
 b=qRM44SCif2E6GtxuOs8PuExWre1TjvsULhiNwstdxBwsHmphZxOytoO1arVm6jZGCsU1vVl8mSwsFRRV9gAO/VAAlP+CVeSOOkIN9stWipUyk16XyY6x3hQ1MgIMMHXjqs1tVXtjGqyZFnCHHtPI/QSE0+T+LYE7U0UrqFyRRz+Vsr4YbnwPa+3J7Tb6WYMsUauK4oHJ1amDKH7j5kBRn5ZRdlJd7bF2aJ4BcLwuEyfkQkwt3+LKFHkqoJo3PEs7kN94y0YBt8XF5YmTl+is/aQhFCgWhphkA2kc6nFFNos4OXlgtwcHK+Fzs7JhNgNJr+L2j6ddmo3uBN5dysyYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wShlEuZOKNbktGEeHELP6DgVAopjq2aDhXTP72l+fGc=;
 b=IoqreTlC9OWJsV0pwtkGBiletWTFYZ7k+kodv0XS1Cc2b6YlqxbeDuNFQHhX2p9pDhuTu7IQDAqm2C7ngihn03tuuQQ+MXbowAvFk1CjJH2QeJVc+X2wRdyZXOi/cp6ov7/W9W9k6K07qG/dCkM5wOaHs3L40TOSTQMlc3MYPhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB9737.namprd12.prod.outlook.com (2603:10b6:208:465::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 23 Sep
 2025 16:16:33 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 16:16:32 +0000
Message-ID: <1c7158fc-db72-4ba0-81d2-8bfecf36a2c2@amd.com>
Date: Tue, 23 Sep 2025 10:16:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
 <20250826120306.618c275f@eldfell>
 <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
 <20250918114036.454735e9@eldfell>
 <7abe9596-1d85-4b14-94ab-97bd4dfe0977@amd.com>
 <20250923105918.41f832c2@eldfell>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250923105918.41f832c2@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4044e5-6687-4cdf-30f4-08ddfabc8f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjNaaWd0Y3dQSFhpa2pSL1l2bG1OdHFHellOOXdVbmdJdjZnaW5Nb3VmakJY?=
 =?utf-8?B?NWZEaU9VcjNSTzV3M3IyemtaTTNEeHpJUnZFRGxJd1V2MnUyckNRdXovaXN2?=
 =?utf-8?B?WFpoMjFodElabjBCdldoandDYzNvRFVHbmJpb1JrWW9VTi9aUDNiMnlSNUtE?=
 =?utf-8?B?bXNSTVAvbW1Iek9KS3ZBTk1zalhMeDhrR05hdzBPclZBazA4RzF0SlJ6dHBq?=
 =?utf-8?B?VDVBNExZbTU5U3BFUjVDc0ZaMmNnbG55THdScTcrZnZueGNrcm93ZUhRUXlh?=
 =?utf-8?B?N3dVcldiQUdCWWFkdXp2UHl5OEh4eHhtNnNEQzlDemt2S1B0SlJmVUFaNE11?=
 =?utf-8?B?aTN3Tm1KVzdZZWN2b1pDS0tjQUs4Q29KN3BtaTlzUmtvSHhaS2VFVkpiU3Fv?=
 =?utf-8?B?WExPWGxkOVh0ZmhYcmgvb0gvV2t6bUQxMUt5S1pWOXBrK3dKNW1UN0orK214?=
 =?utf-8?B?NTdPVXRtWGIwYlk4ZFFZUGVVaDU3NWFwT0lFM1hBRGxsTW9VemdSMXhMeU1O?=
 =?utf-8?B?eHo5UmFlUnNuMHE2NHVySWYyVysya0kva21xeG8yYUZvOWREMnVQNTljcE5j?=
 =?utf-8?B?RkJLNW9hdWp3L1Vpb0haM2JZNUtlRDhxYUoyMXY4TkVJVVNDRXVzUGNHTThn?=
 =?utf-8?B?d1ExUU9PcHA2b0pYWWFYQSt0WWZpSFdyOGdWMUhiY0ZTdXBvNEpNQVpnOW5U?=
 =?utf-8?B?RC9rcmgyTnRXMWZ0eU1WKzVFTG5LN2ZBTzMvTUYxbGtsb1BZZVBLYVgwVWky?=
 =?utf-8?B?dXVFcmttRVh4WThxWm0wcUcyM0JTbVZnbWY5bzBpbFNsMEpJKzNBYUlneVYy?=
 =?utf-8?B?S1Fld0dFMklaU2gzWEMvNkFxUjAvVHpnRkkrcERsd1JXNS9yT3orMEgwdkhP?=
 =?utf-8?B?VkhZRzh1bUhKeEgxYXh3VGFrakc1ZnNib3ZTOGJOSEh2Y2RnMlMwT0pJTnRH?=
 =?utf-8?B?dnNYeWN2MlJ0cWtQQnhoaUVHUTJNWUptMHZHc2lvTStHZTBtTkg4b0M2S2FC?=
 =?utf-8?B?d3ZTc3RzSkNGM041cDkwRDdGVStBZDlPZ2JiN0ZQNVRXQnlEcS9Eb0NZS2NP?=
 =?utf-8?B?RFdNQk4xK3Q0R0RZRlFQK0gvaFVmbkpVTlY1eFpVZVdKYUFqV0YvaytPK2ZX?=
 =?utf-8?B?MXZ6WW1GRXVJbmlSSkZ4QWkxVlZzLzh3RTJmRnZ1ZFBvaVFyNVVjZnNjL0lr?=
 =?utf-8?B?RUwrZy9KS2RhMW1CU0p2S2pIUWUyVVVpTC9XQkVJWWlISTFRbnBqWGRVNFpn?=
 =?utf-8?B?ZExIRmhCL2N5MlVVL1hnNmpveDkvQ3VaQXBRZzN0ZnR6UCtBL1hLcW8yaGVk?=
 =?utf-8?B?NUpmdDRWcDVVSUtISWFCcEJPb2Q0NFRTRUhJS3VteHEveUcwNm90NUxOL3F1?=
 =?utf-8?B?N1ZXZjJHakRwN2IvS0NQVzlMNkR2L0tEbWorVk8vTFFnODJDZ2s2aTh3aDRC?=
 =?utf-8?B?OEhTYmdubXR0OVpaR1VYYjZ6Yy9ST3pPaGw5NXFsQlZxcGlIWVBvZFNpeTFn?=
 =?utf-8?B?dEMrMkw1cWJpeUhueThYUnU0MVpjTHpJdStrR3dmaWFyNlRJbkE3NHZ0N2M3?=
 =?utf-8?B?eXFWNzE1MEkvSEtaSWNwTFJWOFNZNXd4RlVYRnFZclVKL1ZrVDUzS2VWQld0?=
 =?utf-8?B?UXRpb2xqay9DN0J2cHZnbXp2dGZtbU1QbldQQWViZDBTMXUvZ3BmU3g2dGtn?=
 =?utf-8?B?YUZJdlRGMHJkR3hnUGZoNWhmTHBqUlVWbnNlT0NTbHdzRjhad2k5c1ZIZWdu?=
 =?utf-8?B?Mm1RZlhnZFZuN2FBMnNWb0tRdjFqUHpETFNxTjN4V1FwYUh3VGM1cXZOeW5M?=
 =?utf-8?Q?+nFJlia9yQjX9+7yYtw34d99zz8ORfrLOM/Qc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHJHekdlQlk5ZFFZWTN0eXZ5YkFaR1lxN2RkQmtEMkxmTnp6eHcrQW9wbDUz?=
 =?utf-8?B?dzVLUFNxNnlkN1lRTGc3MFp3aGtQcUZyVVRxcTJXdEVEU2NlZUNUNGszaHBT?=
 =?utf-8?B?QVlsV3l6S0EwelYzL1F1dHdPWFRNTTJQaXhicUo5ZTlyeFhtZGlKTnhLcytS?=
 =?utf-8?B?OUtFakNNV00zQyszTmhHT0FQWVVHMDZDbWMyd2ZSMU14andsN1pSRnMyaktl?=
 =?utf-8?B?WFVtTXdZa0dzc2pBQnVseERpc2Y1WDBZNzNFWTRmQVo3dWRyL0s4Y1pKYnpH?=
 =?utf-8?B?czhJTUltL0QrRFZLallQYlRSQmtlOGJQa2RQejU5Rk1UTUl2eVpDQkp5alRP?=
 =?utf-8?B?dmQ1NTNCUm85WlNUeFdOaHpCdzlITk5sOXZLaDFiVno0cmVlWXBzU3lvL3pu?=
 =?utf-8?B?am56a0FEYmFxUjE3YUROQlE3VWFBeVBGY2VIS0d4MHdySmx6UDdtMTgyWFZX?=
 =?utf-8?B?ZUk0RURzS0YzTWcwVFFGUlFhdTRLWEhFWjJSK3JTcEV3Y05IM2IrSHZGSlZv?=
 =?utf-8?B?QUN3T1ZFbDIwREFsT3NxN3M4RE40RHd6N0FZTGJzTW1xTzFzZHRjL2R5UnBU?=
 =?utf-8?B?NFAySUlHNjJQK003OXY2S0pkUnBLZEhEMlhvUmNDL2t5VStUNWdnR2hqZTcy?=
 =?utf-8?B?Lzl0aXMwc0wycEduZ3FYMDM4NVdZazN4eTZMNFJXRWxDL21IcURucFY5emlO?=
 =?utf-8?B?UUxUQnNodWgyU0tUV3IvUjBmb1gyWmxwbnR2dUprSlJCU1FoWDAwSzRNdHhx?=
 =?utf-8?B?UHZlRFQrdVdUWlpENmcvUmVPRHI1YVRUTDRUeEUwUDFUbUVlWFl1ZlJCbmNL?=
 =?utf-8?B?dnYveW1BK1A5TUFYOFVyQUtkd3BDNFNBU3NBUnRkWWVhMUZsbEtkRlJWc0JV?=
 =?utf-8?B?SkcydGxVYklDTFVvMm5vUC9YVWREOGk5T0VDWXdlTzRkbHJKWThaMGFpNElo?=
 =?utf-8?B?WitHUUFaM3BQUVpzQUZqb3k1WHk5MWVieml4MXgvOE1jWlhIcmQyVnQ2WHJj?=
 =?utf-8?B?eVVCQzZMQy9iNXUxZHNjWEY0RGdyOFR3VUdGamQ1Z2pCM1NUU01vZ1RpWGR3?=
 =?utf-8?B?WU9Qc1BuSmNFbktMMGFoc1ZIeitTcGV3d0UwbUhoL0NFbVJFa3ZraCsxbEF4?=
 =?utf-8?B?QytPeGFrNU1CVUNtVFNhTlErZW5meWxibjI0b3hVRzlNQ3M4SDdTdmZwczFj?=
 =?utf-8?B?SkQrMkNzZ3hUaWc1dUh5Nis2d1cwUHNneDFieE9hd0ZZemNic21YUmdlaTlx?=
 =?utf-8?B?VzgyUnJtamloL2Q4VkU5N0o2SE4xRWo3MlM3OUJMenVTeGpMeFU2d29jUjg2?=
 =?utf-8?B?QUM4aHhObWo3KzBDL0YxVHhoQzlDd0MwTzJ6c3FGQUw3OUQzcWRWTTUxbzVW?=
 =?utf-8?B?T0o3MmNJSXg3a3pNZXBTOWhseVJodnFCY1R6OUVJa290bGd6RUkyMnhVelN1?=
 =?utf-8?B?VWV4dGZHYUovNmFaamtSN3l5T2wvd2ROOVRLY3BhS2dCTTdOSmpJeGVod2Ry?=
 =?utf-8?B?d1hDWUltOStZdDNqNGFEZ3p6MTZVMnozTmI0SWFaMXBOaEZsWnRGbzVDejFS?=
 =?utf-8?B?TlhVYVEwSzJZSGxuMnF5ZnpzaTM2R3UvazRqR3BtOTVUQkU3SmlHMnpRS0xy?=
 =?utf-8?B?Q3QzR1JtZ3NxbWhVd05KWTBRWitScStUeTlQTSt5TWh0TGZmRGdSNExJbCs1?=
 =?utf-8?B?bCtZYStKYXJoNVMzbEc0QmMzOWpQSVdBdTQzMVFBKytBV2l1TUszNlNPVHVh?=
 =?utf-8?B?N0NUc29mSmw5LytXTXpmSDY1bW80TG43VS9KRXJJS2J2VFJNeTRLQWc1MWh2?=
 =?utf-8?B?Y2hITlBNUlk1clV4YnFYNVFGdU5oZ1ErZGJtTStCcUltNEhkWGZCQ1NvMnNF?=
 =?utf-8?B?ZnpkWUp1c3pxbHdsUW5wcmRNNi9NQTdKQWE4U0FQd1U4RmJPSDFsMEYvUFRI?=
 =?utf-8?B?b2ZxQXhvVXBDMW45L29yb21uSCt2UDQ3QlMzdm1ibWFIaktsSHBsS244djJ3?=
 =?utf-8?B?aDBHdzEzaHRCNzRzN2ZHM0dIR1VTMkMwdFFUc1dkTlhRUlgxcGpRZlFkZWN6?=
 =?utf-8?B?YWNvU1puOTEvZ1pyNUxQZkFvcDdqeUFhdUx2eVFyYkFqZVhHemFrQVhiMmxO?=
 =?utf-8?Q?P3/r85chP3d7/rEM9tF9U1E/W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4044e5-6687-4cdf-30f4-08ddfabc8f7c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 16:16:32.7378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gx2FUjViRMF+sI7h+pnfly/VTE5e7DaEykqePWshjJ5JiemXUqxdjJ+qevWfclGTbw33AfP0eHWi2zGRiOOzkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9737
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



On 9/23/25 01:59, Pekka Paalanen wrote:
> On Mon, 22 Sep 2025 21:16:45 -0600
> Alex Hung <alex.hung@amd.com> wrote:
> 
>> On 9/18/25 02:40, Pekka Paalanen wrote:
>>> On Tue, 16 Sep 2025 17:01:07 -0600
>>> Alex Hung <alex.hung@amd.com> wrote:
>>>    
>>>> On 8/26/25 03:03, Pekka Paalanen wrote:
>>>>> On Thu, 21 Aug 2025 11:54:32 -0600
>>>>> Alex Hung <alex.hung@amd.com> wrote:
>>>>>       
>>>>>> On 8/21/25 06:23, Xaver Hugl wrote:
>>>>>>>> We user space folks have been convinced at this point that the sRGB EOTF
>>>>>>>> is actually gamma 2.2, and not the piece-wise function. Now, if the
>>>>>>>> hardware is actually the piece-wise, then that's what should be exposed,
>>>>>>>> but I'm a bit unsure if we should do that under the name sRGB EOTF.
>>>>>>> Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
>>>>>>> hindsight, the naming of "srgb" in the Wayland protocol caused a lot
>>>>>>> of confusion, it's better to be explicit about it where possible.
>>>>>>
>>>>>> I will leave this to Harry to comment. He is taking a few days off so I
>>>>>> will check with him later.
>>>>>>      
>>>>>
>>>>> "sRGB inverse OETF"?
>>>>>
>>>>> Strictly speaking "sRGB piece-wise EOTF" is not a thing AFAIU.
>>>>>
>>>>>
>>>>> Thanks,
>>>>> pq
>>>>
>>>> If an extension in future after this proposal is merged, can it be GAMMA
>>>> 2.2 to be [DRM_COLOROP_1D_CURVE_GAMMA22] = "GAMMA 2.2" so it won't
>>>> conflict with current name?
>>>>
>>>> Meanwhile, do we agree to change "sRGB EOTF" as "sRGB Inverse OETF" as
>>>> the following? or do we still want to add "piece-wise"?
>>>
>>> Hi Alex,
>>>
>>> since my previous comment, things have muddied further again. FWIW, we
>>> intend to remove the use of the name "srgb" transfer function
>>> completely from the Wayland protocol as confusing:
>>>
>>> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/442
>>>
>>> I would recommend the KMS UAPI to similarly avoid the term. I would
>>> recommend "gamma 2.2" or even "power 2.2" and "compound power 2.4" or
>>> such. These names would hopefully not trigger intuition and make people
>>> look at the definition harder. Or any other name you can come up with.
>>>
>>> I agree that "piece-wise sRGB EOTF" would be intuitively clear, but it
>>> may provoke people debating what does IEC 61966-2-1 actually define.
>>> We've had these kind of discussions for Wayland already, and it was
>>> suggested that it is better to define the actual mathematical function
>>> in our specification that to leave it for interpretation from standards.
>>>
>>> For KMS, this should be even easier than for Wayland, because the
>>> hardware implements a specific mathematical function regardless of
>>> where it might have originated or what it is being used for.
>>>    
>>
>> Do you mean the following changes? Userspace use Gamma 2.2, and display
>> driver can decide to use either sRGB piece-wise EOTF or Gamma 2.2 itself.
> 
> Sorry, the driver cannot choose. The UAPI needs to define the curves
> explicitly, and the drivers need to implement those curves exactly(*) or
> not at all. What I propose is, let's not use "sRGB" in any of the names
> for the curves, because that name triggers different assumptions in
> different people.
> 
> (*) "Exactly" is a little vague here. I assume some error tolerance
> needs to be allowed, e.g 1 bit on the electrical value. The maximum
> difference between the two-piece and power-2.2 curves is several code
> points for 8-bit electrical quantization, and that's too much error.
> 
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>> index e1b2b446faf2..3a6c64285d9c 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list
>> drm_colorop_type_enum_list[] = {
>>    };
>>
>>    static const char * const colorop_curve_1d_type_names[] = {
>> -       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>> +       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "Gamma 2.2",
>>           [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>>           [DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>>           [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index 3e70f66940e0..e39379f1a61c 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -48,7 +48,8 @@ enum drm_colorop_curve_1d_type {
>>            * sRGB piece-wise electro-optical transfer function. Transfer
>>            * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
>>            * to H.273 TransferCharacteristics code point 13 with
>> -        * MatrixCoefficients set to 0.
>> +        * MatrixCoefficients set to 0. This can also be approximated as
>> +        * Gamma 2.2.
> 
> The problem is that "H.273 TransferCharacteristics code point 13" a.k.a
> the sRGB curve means different things for different people (two-piece
> vs. power-2.2).
> 
> The difference is minor but visible, and therefore I would not make
> two-piece and power-2.2 equivalent nor have one approximated by the
> other.
> 
> They both need their own entries in the enum. Let's leave any decision
> about whether substituting one for the other is ok to the userspace.
> 
>>            */
>>           DRM_COLOROP_1D_CURVE_SRGB_EOTF,
>>
>>
>> It is also possible to add GAMMA 2.2 in addition to sRGB piece-wise
>> EOTF. But if I understand correctly, DRM_COLOROP_1D_CURVE_SRGB_EOTF may
>> not be used at all, right?
> 
> If hardware implements the two-piece curve, then there is reason to
> expose it, especially when it does not implement power-2.2. Userspace
> can choose to use it as an approximation when that is appropriate.
> 
> 
> Thanks,
> pq
> 

Does the following diff make sense?

1. Change "sRGB EOTF" -> "Piece-wise EOTF"
2. Add "Gamma 2.2"

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e1b2b446faf2..823e39b8f3fe 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -71,12 +71,13 @@ static const struct drm_prop_enum_list 
drm_colorop_type_enum_list[] = {
  };

  static const char * const colorop_curve_1d_type_names[] = {
-	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "Piece-wise EOTF",
  	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
  	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
  	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
  	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
  	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
+	[DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
  };

  static const struct drm_prop_enum_list 
drm_colorop_lut1d_interpolation_list[] = {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 3e70f66940e0..3428a27cd9ad 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -43,12 +43,9 @@ enum drm_colorop_curve_1d_type {
  	/**
  	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
  	 *
-	 * enum string "sRGB EOTF"
+	 * enum string "Piece-wise EOTF"
  	 *
-	 * sRGB piece-wise electro-optical transfer function. Transfer
-	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
-	 * to H.273 TransferCharacteristics code point 13 with
-	 * MatrixCoefficients set to 0.
+	 * sRGB piece-wise electro-optical transfer function.
  	 */
  	DRM_COLOROP_1D_CURVE_SRGB_EOTF,

@@ -108,6 +105,16 @@ enum drm_colorop_curve_1d_type {
  	 */
  	DRM_COLOROP_1D_CURVE_BT2020_OETF,

+	/**
+	 * @DRM_COLOROP_1D_CURVE_GAMMA22:
+	 *
+	 * enum string "Gamma 2.2"
+	 *
+	 * A gamma 2.2 power function. This applies a power curve with
+	 * gamma value of 2.2 to the input values.
+	 */
+	DRM_COLOROP_1D_CURVE_GAMMA22,
+
  	/**
  	 * @DRM_COLOROP_1D_CURVE_COUNT:
  	 *


>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -77,6 +77,7 @@ static const char * const
>> colorop_curve_1d_type_names[] = {
>>           [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>>           [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>>           [DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
>>           [DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
>> +       [DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
>>    };
>>
>> Does anyone have comments or concerns if we use the first option?
>>
>> Alex H.
>>
>>>
>>> Thanks,
>>> pq
>>>    
>>>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>>>> index 1551b86471ce..90a216c0b6ac 100644
>>>> --- a/drivers/gpu/drm/drm_colorop.c
>>>> +++ b/drivers/gpu/drm/drm_colorop.c
>>>> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list
>>>> drm_colorop_type_enum_list[] = {
>>>>     };
>>>>
>>>>     static const char * const colorop_curve_1d_type_names[] = {
>>>> -	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>>>> +	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB Inverse OETF",
>>>>     	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>>>>     	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>>>>     	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>>>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>>>> index e4250b7d8de8..ce85c52c60c8 100644
>>>> --- a/include/drm/drm_colorop.h
>>>> +++ b/include/drm/drm_colorop.h
>>>> @@ -43,7 +43,7 @@ enum drm_colorop_curve_1d_type {
>>>>     	/**
>>>>     	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>>>>     	 *
>>>> -	 * enum string "sRGB EOTF"
>>>> +	 * enum string "sRGB Inverse OETF"
>>>>     	 *
>>>>     	 * sRGB piece-wise electro-optical transfer function. Transfer
>>>>     	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
>>>>   
>>>    
>>
> 

