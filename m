Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2282ADFEC8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 09:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BB310E9CD;
	Thu, 19 Jun 2025 07:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EulV4F39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B854E10E9CA;
 Thu, 19 Jun 2025 07:33:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGnp4dh20nG4L5f3WDl9bgCL2QjnU7kjKNECoN80cb5URL0bznAT35+xN6GJdSHlLii5n7jSXp6S8YdLwpGWra6eejacKk03s7B8C4BMjMAp3gMhyjFU1+41CWs8UUxWvOoGPKxplU+hCtg7afDoT9D1/D9EzOzEhG6t8+r8+UE0qPgsnZ70nf2FLY7RqpcYjrwqw7yRUwXVMLHzzbW+KBARmVyTdqf3O6hkpqbl2YImTmmnh7jy0RgQ4Lpqqilo6brZBCNuug2BdjuhBpo9uH9hBBep2pgYosOzOkE6slSCmB+MkuoVEBuYUYx9ToPAyUlh542wC5sdRlad7rKoRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSPJIn9/7YlORPVjC/k9hTZ/NjGD3Oh189LUt/Ldfz8=;
 b=CDhp/N8wKF3u3ST4Y5itNbruzgaST4VZeGzqVNfT69Ck82zZPlcZ+/XmEcXwG+IBLKqeMoINOxkaAEQWBZPoyuIVJIFYEwgQ8UXa++gsJr8pkBS8Aj8tl6HwuQvfg9t9OwhDusV6JObdC+Tut2FcTH86uvYYxX2d3yZP/48KxtwBawQkgS7YnPdIvCqW2sVJ8gz/VfKylm7OHX7T89qzaD8cR3rkRuPuFb45JEwkJdXlJNvqdHMIa1FwmtHaADBact0vGTGMcvLiImwYORDtzRaWRUcOSNnLHsVO6X2NO8/vCw1oWl1tAImgsNSO8wbAqF/EYh9EXM397zAYn7CilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSPJIn9/7YlORPVjC/k9hTZ/NjGD3Oh189LUt/Ldfz8=;
 b=EulV4F39tbyBCFSoBYR1q3oFDXJAoVYj9CNQQP7VMqiCBHn5ryGEXTbJg3GkLWmFses3uEYbj60cE7FrN1U9vjAlLGZZ2ZA4dxZbZRfmzt6/0cCy0fJkrIppvDQyVcJogyDxL4qVH9kKIk/XzRDAs8me0TpAYQuDBP42MjkhzXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 07:33:36 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 07:33:36 +0000
Message-ID: <dd5a1e53-28d2-4dda-8686-a42b99ead3fe@amd.com>
Date: Thu, 19 Jun 2025 13:03:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
From: "Khatri, Sunil" <sukhatri@amd.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250618134747.3893138-1-sunil.khatri@amd.com>
 <752cd912-b4d2-4ca1-84f4-70aa95c4e97a@amd.com>
 <3e1b9a3b-9a38-4f48-bbae-26faeeed6f42@amd.com>
Content-Language: en-US
In-Reply-To: <3e1b9a3b-9a38-4f48-bbae-26faeeed6f42@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::14) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: b0409719-5fe9-4515-c4b0-08ddaf039a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDI1MitFTCtxdjlHN3lNY1VVSjhQZm51QjdIMmt3a0NQVHYyZXF0TWpqNGxp?=
 =?utf-8?B?Wi9yb2xHQ2tLa05KTGRoTElsclNZSDM3V3UrcEIvQlZiYkpBUnpBRXcwTDhu?=
 =?utf-8?B?bEw2Y2JIUjU5OFdkUWEwbkNWZU5HR2RTUisyR1crMXJiTUpESFFmK3JFN2F6?=
 =?utf-8?B?QTBWSU1nZnM4WGpSUWl2SDZseUJtMjJ4V2RQaHlJTzRZRUp3bm1rWkpFb1k2?=
 =?utf-8?B?MlBKNlk3S2dMd3ptUlgwKzdsYW5wUWlzMno2SWlVQmhST0VVakFJQUVZRGpl?=
 =?utf-8?B?YU9VS3Q1U3AyM3M1cGkyTmVrTmJIYkM0bmE1cTJEN2J1Q2k4TGpWTmNpNlRD?=
 =?utf-8?B?UWRRbTkrSkErVm5OWmo3OWZFTGkwS1NtTElLOEV3dCsxdGwvVzBzWjVjbmdh?=
 =?utf-8?B?WDV4ellwcWZtZEs2MWJVS0ZWcFE1SkMxbm5ESHhKaklDM3VtVkJTc2VzbXkv?=
 =?utf-8?B?aUh4dG1LNHVYUEhDdDNMdnJkZjA5dy9OZ3QyUzdOSllPaW5LS2djSk85WFd5?=
 =?utf-8?B?V2pVQXY3R0dzMHRrZXVvSk1DVS9VeWRkb283dFc0b2lMN3g5Njgyb1phT1Ni?=
 =?utf-8?B?ZDRBZ295YmRleDhCeEVQYW9RN1czQkZZZUZMM3lqU3ZKV1RLYUhvYTQ5Qmlh?=
 =?utf-8?B?NEFSSnMzNXREbHE5ZXBxKzlvSFc2S2pWY3ZQVEFEcE5uNWxzdzRscG4xV2g3?=
 =?utf-8?B?NUtyNWU5N2Q4QWgzL3ZsZGxpbXEyUk9mdmZUb3pqckt3WldYeWZzWjJkbGdp?=
 =?utf-8?B?WmdLTFAzKzU1a2E0NFpCSE1zakVjamhLSmlWandUYXNwTzA5TVBoWmZ4QVJP?=
 =?utf-8?B?eHVRdk1kcXpDUFRwNVhKS3g2MFRUZ1V6V01WeGc5L083U1A3UGJ5d2hWZmwv?=
 =?utf-8?B?OEw1TkpGa2lBUGkwVE5pdW1sSTdYd2RBNElkUVBmVTcyYytFQVFmRXRsWDlh?=
 =?utf-8?B?d1NMc3JUd1BMVVVpK3hycWN2UFNTdXd2UldYYVdpdUp3Uk0xMGlrT3ZhaFZ2?=
 =?utf-8?B?dHI0YjE3OUhCVFEreEhNYWcwTWxNMDdyNjJVYzNDWCtLNnpWZXFCNURxT1A1?=
 =?utf-8?B?dG1UbFBZaEMzQjhIUW4rdEt2WU9OSlEyNkYxQWNuSzN4dDhTUjg0WHNZcEM3?=
 =?utf-8?B?NUxsdktVakRGSEo5YWk4emltZnVneHFXMHV6eS9TY2RwdXNaUEpWLzJ4ZktW?=
 =?utf-8?B?cG9HS0tiWmtCQTdtYVpsYWRlU1NHbUdaOEtlYzhwUkdFRS85LzZER3dWT2No?=
 =?utf-8?B?RHJaZ2xPOWNOdzZ1WkR4MTlHaFJrT3BHUUk2eTlXbkk2NHhPZDErL0NNeWI5?=
 =?utf-8?B?SXR1Qk10d09Rb0U1UWo3UWx3VWF5TXVlNjFJZXBkbWNlcVo3L0NmeTJjZUgz?=
 =?utf-8?B?b1haY1kvUUUzd2J1WlNQUGpQZGJGODdUSzQ4a2dkZVZtRG53WjVNRTk1NExa?=
 =?utf-8?B?dlJnQURabEhUekp0QitHTUdKN3p1U1dvSlBSOUV6NUtGejVvYXdoY1dNeHNh?=
 =?utf-8?B?amVUTzRDcVZGcjBicVJSc1cxOTNtMUhrenhKdUNnL2xWQmV4WXhEY0wwT0VM?=
 =?utf-8?B?bEhyM21xb3cvRnZSaUVEcXBlL3lrb0s1UVhDdXFFVTFDNElYNFY0YThzeExl?=
 =?utf-8?B?RGppTUgzWEtNY21sSm1VdWNCdG9MemJ4ajUxOTVQT3pkSi9LTUIwckRSRHRa?=
 =?utf-8?B?L2E1TjNEYVFqNTByNkZJVXlzMkJpNEZvY3p1bW0zVzNybWVYQjB3Sk5HenRR?=
 =?utf-8?B?dEZhZGRSd2pnaVFwMmFhaFpCdUl1b0pVN3RHL3dCVC9XSFE2b3VZRFZSL3lP?=
 =?utf-8?B?N2luRFFPcHRqNTY5Mmh1Y0Q5MDZCZDJCOGwzMHBrQXJFOEdHaDBFbE1GK2RP?=
 =?utf-8?B?TmhVc2YyQmJUdDJvdU16WGxTWjFjc1RKbDBkK1ZybnR6L1hFdWUyZmJSUk00?=
 =?utf-8?Q?gXdJ+w+ewVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlJheVJqWmpqWTNTZnFhcFZBMXlmdHp4Q0wxMEc1ZzdqbGlXZ1lZSlM0cUxI?=
 =?utf-8?B?OXh3QkJMNmNOcHNOOHBhZ3JoTm5RaUdBSTFuNE13dkoycU1TY2I4ZWNzL2Z2?=
 =?utf-8?B?cnhIMnFORHFTY1pDRjFrVTVLTURuUm1JM2R4dUxqT0lVY050UmJqak54czhx?=
 =?utf-8?B?REwvTnlQQTVPVjA0dUtQRkxTQmJQbHM4ZStoTWNKZGNCcE4vZk5kcDhzYS9i?=
 =?utf-8?B?U20vQ0tGd1FpQUhxYlpXQjBmSlZBWFh4MmhMb3lRVmlwZGVjOWs0Rk1RQzNV?=
 =?utf-8?B?NjFtcDArSzd3a3h6cGdYSFdPaDBHM3hyZ3hBQm90RmE5VmFieVE1OE1Cck5q?=
 =?utf-8?B?dHZDTWVLcXVmUEpsaE14NDVyVG1NUldXdTU3SStORmllYUdiUU1EY0Y3QW9q?=
 =?utf-8?B?bUVrc3NUVjRka0RpY2ZXMjk2OGZDYS9VY0RtbkVTVkZ4ZWNOQWRtWUpHNnFl?=
 =?utf-8?B?YTlPVDBQRW1mdHFSdVBqSnJMVm5IVzQ2ZTdFQWRRVnc1OTdYZmlOaHJjV0VV?=
 =?utf-8?B?Q1c4UWFqa3BVa3RUbC9La0JCTnhoYVVvdkREUTRVSmJNcmlVdCs5NEF1ZExO?=
 =?utf-8?B?d2RrZ2hQNGRzTWNoVlhaNnVyUVZleVJNTkRXNEIwQVRVNEtQMmxtMzJYREJr?=
 =?utf-8?B?bUJLa2ZWU2hrL0lYR2laVG84SmpDUlFRVEtEMUdkUzc5dlZSYXFWcnBxNU53?=
 =?utf-8?B?L0RLNHJmRGRpRDJvTlpST2NZOUEycjNZUnZHR3hneUVTUjBOWEpYTGQva0dN?=
 =?utf-8?B?Y3hhMEc4UEhDcVFTTlBFSEcrQWp4RnlqZHBEUjdXTjhCYmF0NDRLYUlYUit4?=
 =?utf-8?B?c2UwbHdJb055RzBwYlRhY21GUXFPYzNYUGhHL3RMalZvUDFtRDdwTXZSYWFP?=
 =?utf-8?B?eE1XdnNOby91K3pCWlNCWWFIakIwK2V0Ni9xdkhIUE5kaGhGZzUzRXZwSVJH?=
 =?utf-8?B?ZWMwNFVBR2hyb21RcUtOM1BMd290MUJXWlkrcXdqOTZrSGdRcGtUWG9XWjlw?=
 =?utf-8?B?dm1SRmVMY2lFWlBxNzdPaHhlanY3bWdBZ1pBNTN0cUwxckpRTWsza1M5bWhO?=
 =?utf-8?B?aFdmWFJud3F0Y2tLUk9VcDEzNVZzbnJmaGFkTzcwQnhKemlBME5yYWMxbFpK?=
 =?utf-8?B?MEhRLzhjMHlFYmd5QWJoTkJyelJWVUZpZFJjTE12eWNkZ0h0cjdZMWYxMWw4?=
 =?utf-8?B?VEoyVS8yUllnMTdRM2lTQi96QTcyNHk0RExiSXN1azVqSk94aHQ0QXVYdGxP?=
 =?utf-8?B?NmdUTW9ZTGMzQWVaUTEySk1udU1kTytQTUhJSWIzMlNnK05JQTZBckFwdFY5?=
 =?utf-8?B?UGcvcTFXblZ3TjM3Y3JvSkNTZGorMWgxQTVuSllucFVqcVB5WTI0blNyRUw5?=
 =?utf-8?B?K0h3M1hxOERrU21ncTVGZDF3dkduZGlJc3JNOTBpN3dNUGNjMXo0d1ZueTY2?=
 =?utf-8?B?bzBKNlBvaWZ3TUdCMlBJRzQzUWhQcHhCcFpYeHVDUEdTOGV2RmQxR2Y3MVZZ?=
 =?utf-8?B?Q2JHbUxLMERER252TDdlNDZYWWM4bzZlVmljYWRNOUJ0T3BCN3ZlNFYrTWph?=
 =?utf-8?B?M0M5UDlUZlFpRFF1YUczcUpyRUlVNGlKRGRNQUtKcm5od3RwK0NCbStvbHBJ?=
 =?utf-8?B?MlM4S0Y3SU5NOWJ4a3M2VUw5OUIrM3FFZGh5dkpnMWF6aHAxZEZtQTZqL2Vu?=
 =?utf-8?B?QUNRV2g2NllYR0sxUm5QckRyc2lLN1ZsZHhvTFVJWU91eHFkc0FUdDBrZGZH?=
 =?utf-8?B?U1ExN0QrV2xTVDZZVFBaQVVMR1V6aTU2ZTErSXJVeDE2Z0JIdHlXY093WFhI?=
 =?utf-8?B?cXdMSXRLNHMzMHRTcXhKWmlIN0xaUzNJSmhIZGJKdFVlN0M4MmUwVE5mUDgw?=
 =?utf-8?B?UWl3OFJuMW5kYlVHY2haQitYSU0xYWwzQjRlblUzMVF4L0QvOVJKb2hHSVB6?=
 =?utf-8?B?YXU5Z0ZhQ1hUN2Z2a0JXU0s0K05tMW9aREJUWXV0RE9DcEc5MTlQZXl2TjRQ?=
 =?utf-8?B?M2VDclI0dmlTS0dITi9IQmZQdDFnb2ZJRktBVEl2ZzdKaWZaelRGaTQ1QWIr?=
 =?utf-8?B?eFRraWliSU1ZKzZlNmxOWnFxSHRGUis1a0FQSEYrS0x0eE1hSk1BRDB4dmVZ?=
 =?utf-8?Q?1lNSnO/cXLpHcqpiN3AQteKj0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0409719-5fe9-4515-c4b0-08ddaf039a16
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:33:36.4453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEm1C7qFVRQvo6z++zis8yMEasbii+bsu9p7PtWt0Eycu4rG5AIk9yv6epxGrsTh9bMZ+JaIzqJQjFrLWtyMAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146
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


On 6/19/2025 10:37 AM, Khatri, Sunil wrote:
>
> On 6/18/2025 7:38 PM, Christian König wrote:
>> On 6/18/25 15:47, Sunil Khatri wrote:
>>> move the functions from drm_drv.c which uses the static
>>> drm_debugfs_root as parent node in the debugfs by drm.
>>>
>>> move this root node to the debugfs for easily handling
>>> of future requirements to add more information in the
>>> root directory and one of which is planned to have
>>> directories for each client in the root directory
>>> which is dri.
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_debugfs.c  | 22 ++++++++++++++++++----
>>>   drivers/gpu/drm/drm_drv.c      | 11 ++++-------
>>>   drivers/gpu/drm/drm_internal.h |  6 ++----
>>>   include/drm/drm_drv.h          | 10 ++++++++++
>>>   4 files changed, 34 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c 
>>> b/drivers/gpu/drm/drm_debugfs.c
>>> index 2d43bda82887..5a33ec299c04 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -44,6 +44,8 @@
>>>   #include "drm_crtc_internal.h"
>>>   #include "drm_internal.h"
>>>   +static struct dentry *drm_debugfs_root;
>>> +
>>>   /***************************************************
>>>    * Initialization, etc.
>>>    **************************************************/
>>> @@ -286,6 +288,16 @@ int drm_debugfs_remove_files(const struct 
>>> drm_info_list *files, int count,
>>>   }
>>>   EXPORT_SYMBOL(drm_debugfs_remove_files);
>>>   +void drm_debugfs_create_dir(void)
>> I think we need a better name for this. drm_debugfs_init_root maybe? 
>> Ideas welcome.
You mean the function name drm_debugfs_create_dir ??
>
> Sounds good to me.
>
> Regards
> Sunil Khatri
>
>>
>>> +{
>>> +    drm_debugfs_root = debugfs_create_dir("dri", NULL);
>>> +}
>>> +
>>> +void drm_debugfs_remove_dir(void)
>>> +{
>>> +    debugfs_remove(drm_debugfs_root);
>>> +}
>>> +
>>>   /**
>>>    * drm_debugfs_dev_init - create debugfs directory for the device
>>>    * @dev: the device which we want to create the directory for
>>> @@ -295,7 +307,10 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
>>>    */
>>>   void drm_debugfs_dev_init(struct drm_device *dev, struct dentry 
>>> *root)
>>>   {
>>> -    dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>>> +    if (!root)
>>> +        dev->debugfs_root = debugfs_create_dir(dev->unique, 
>>> drm_debugfs_root);
>>> +    else
>>> +        dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>> Ah! That is also used from the accel subsystem, isn't it?
> Yes
>>
>> Probably best to move accel_debugfs_root into this here as well and 
>> distinct based on drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) 
>> where to create the debugfs directory.
I checked this code again and we could not use 
drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) as at that time as 
there is no drm_device as its done too early and done before any 
drm_device is created.

I have something in mind as i found that accel_core_init is called from 
drm_drv and we can do something there itself. I will push another patch 
set and lets see how you find that.

Regards
Sunil khatri

>>
>> We probably need the same distinction for other use cases as well, so 
>> probably best to create a helper function for that.
> I did explore that accel_debugfs_init in file 
> drivers/accel/drm_accel.c and i dont think of a clear and acceptable 
> design. It is a different module all together and we dont want to 
> create debugfs directory for it in drm code. If the module fail for 
> some reason and also removing the debugfs directory is another 
> problem. We do not know when we want to init/exit the module.
>
> The approach that i used is that drm_debugfs_dev_init is used by other 
> module(right now there is one but we never know in future) as well as 
> drm itself. The parent node is passed by the caller and for drm itself 
> the parent node is defined statically.  So with the approach i took is 
> if parent node is NULL its an internal call within drm and we can 
> directly use the the static dentry i.e drm_debugfs_root.
>
>
> Can we move below call from accel_core_init to drm_debugfs.c although 
> its a different module all together for accel ??
>
> accel_debugfs_root = debugfs_create_dir("accel", NULL);
>
>>
>> Apart from that looks really good to me.
>>
>> Regards,
>> Christian.
>>
>>>   }
>>>     /**
>>> @@ -322,14 +337,13 @@ void drm_debugfs_dev_register(struct 
>>> drm_device *dev)
>>>           drm_atomic_debugfs_init(dev);
>>>   }
>>>   -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>>> -             struct dentry *root)
>>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>>>   {
>>>       struct drm_device *dev = minor->dev;
>>>       char name[64];
>>>         sprintf(name, "%d", minor_id);
>>> -    minor->debugfs_symlink = debugfs_create_symlink(name, root,
>>> +    minor->debugfs_symlink = debugfs_create_symlink(name, 
>>> drm_debugfs_root,
>>>                               dev->unique);
>>>         /* TODO: Only for compatibility with drivers */
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 17fc5dc708f4..8abc52eac8f3 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -69,8 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>>>    */
>>>   static bool drm_core_init_complete;
>>>   -static struct dentry *drm_debugfs_root;
>>> -
>>>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>>     /*
>>> @@ -183,8 +181,7 @@ static int drm_minor_register(struct drm_device 
>>> *dev, enum drm_minor_type type)
>>>           return 0;
>>>         if (minor->type != DRM_MINOR_ACCEL) {
>>> -        ret = drm_debugfs_register(minor, minor->index,
>>> -                       drm_debugfs_root);
>>> +        ret = drm_debugfs_register(minor, minor->index);
>>>           if (ret) {
>>>               DRM_ERROR("DRM: Failed to initialize 
>>> /sys/kernel/debug/dri.\n");
>>>               goto err_debugfs;
>>> @@ -754,7 +751,7 @@ static int drm_dev_init(struct drm_device *dev,
>>>       if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>>>           accel_debugfs_init(dev);
>>>       else
>>> -        drm_debugfs_dev_init(dev, drm_debugfs_root);
>>> +        drm_debugfs_dev_init(dev, NULL);
>>>         return 0;
>>>   @@ -1168,7 +1165,7 @@ static void drm_core_exit(void)
>>>       drm_panic_exit();
>>>       accel_core_exit();
>>>       unregister_chrdev(DRM_MAJOR, "drm");
>>> -    debugfs_remove(drm_debugfs_root);
>>> +    drm_debugfs_remove_dir();
>>>       drm_sysfs_destroy();
>>>       WARN_ON(!xa_empty(&drm_minors_xa));
>>>       drm_connector_ida_destroy();
>>> @@ -1187,7 +1184,7 @@ static int __init drm_core_init(void)
>>>           goto error;
>>>       }
>>>   -    drm_debugfs_root = debugfs_create_dir("dri", NULL);
>>> +    drm_debugfs_create_dir();
>>>         ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>>>       if (ret < 0)
>>> diff --git a/drivers/gpu/drm/drm_internal.h 
>>> b/drivers/gpu/drm/drm_internal.h
>>> index b2b6a8e49dda..d2d8e72f32d9 100644
>>> --- a/drivers/gpu/drm/drm_internal.h
>>> +++ b/drivers/gpu/drm/drm_internal.h
>>> @@ -186,8 +186,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, 
>>> struct iosys_map *map);
>>>   #if defined(CONFIG_DEBUG_FS)
>>>   void drm_debugfs_dev_fini(struct drm_device *dev);
>>>   void drm_debugfs_dev_register(struct drm_device *dev);
>>> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>>> -             struct dentry *root);
>>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id);
>>>   void drm_debugfs_unregister(struct drm_minor *minor);
>>>   void drm_debugfs_connector_add(struct drm_connector *connector);
>>>   void drm_debugfs_connector_remove(struct drm_connector *connector);
>>> @@ -205,8 +204,7 @@ static inline void 
>>> drm_debugfs_dev_register(struct drm_device *dev)
>>>   {
>>>   }
>>>   -static inline int drm_debugfs_register(struct drm_minor *minor, 
>>> int minor_id,
>>> -                       struct dentry *root)
>>> +static inline int drm_debugfs_register(struct drm_minor *minor, int 
>>> minor_id)
>>>   {
>>>       return 0;
>>>   }
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index a43d707b5f36..4e77a0c4a7f9 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -567,10 +567,20 @@ static inline bool 
>>> drm_firmware_drivers_only(void)
>>>     #if defined(CONFIG_DEBUG_FS)
>>>   void drm_debugfs_dev_init(struct drm_device *dev, struct dentry 
>>> *root);
>>> +void drm_debugfs_create_dir(void);
>>> +void drm_debugfs_remove_dir(void);
>>>   #else
>>>   static inline void drm_debugfs_dev_init(struct drm_device *dev, 
>>> struct dentry *root)
>>>   {
>>>   }
>>> +
>>> +static inline void drm_debugfs_create_dir(void)
>>> +{
>>> +}
>>> +
>>> +static inline void drm_debugfs_remove_dir(void)
>>> +{
>>> +}
>>>   #endif
>>>     #endif
