Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A883AD3913
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A348310E559;
	Tue, 10 Jun 2025 13:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2naHksbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104BE10E558;
 Tue, 10 Jun 2025 13:27:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cno49nr+IzDmyAD9ANPThtRfKG1qbwc77dXttraX45v9Kt7RH6d8TNMJt4xUZD4aIrogbCyNUiLt5sC9tcVXmWr2+1Rg9nXLChKjwmnCLBj9XD65nhBEcMXFWOgR1xCg8hndiYDuC4ip/4er9Ca/cDlK5qNeRRY2ZmH5w37kTbukNgbSfFBEgdIbkV4KR2ccdsWVq0ZFd1kFWfoJBbFNKbQ2mxOgLsGRrAD3UAUSflDajxtW2p3BB1F5SnJHN3ZBGpXqP3IoUMBraMtKtuwu+AQmc48DXWVZklo+v/wd9D9XdlD7Dkz76l2xO2q2SzFq7aFL3Lyh73PEZKh/CV9XcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3HsAzFRPiwRiQG8GjJGlZEhZ7xF/5ZkKz0b0dHG0uc=;
 b=bbbucOLvMjc8gWE28qwsv6bKz29c71khQz6mhK2N8c6Yvm1tX8sTj93yhw1gWJDMKt0d78Yhhsc3uaBpEk1Z0PavTcsmneos8qfdNEpjtYqnj0ZTzYQOFngXy/03Leis/zoZdB2A/RN6j4VGpSM0/rsYPL5KbEeXKyOuWs6AvnihczBGf8V2dQ0wNuvdAjeAn0lh6DgwAU6T24xq9TNxzUhA0Cc38J0plUfbf2901qW1pSDIFDFDzCybiMGIiLNjCSB4jHpD4imCg4XmUJhrSXszHm4QJzAMYt5vD3r9ot6I7aFxzyle50R+8KywtDDpfdKiSgE+xNA5dKY9zduyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3HsAzFRPiwRiQG8GjJGlZEhZ7xF/5ZkKz0b0dHG0uc=;
 b=2naHksbDaGpI7hXWu3rFnEy+GuJ3qPMUOgRSOxL1BrfmehVAf/hJcnZrILnLxVNkIUp0tGWJr0Us5sg023+/0/wN3/xgv1N2wVapJzseU+qjwJZ29diCAJdsicNLra4sL70126TMzYCy98W08WeTh8s2jCxlXF5BWJwgoups0E0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8555.namprd12.prod.outlook.com (2603:10b6:208:44f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 13:27:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 10 Jun 2025
 13:27:18 +0000
Message-ID: <3664bf87-2805-4c77-89f7-cbd1e6645bfd@amd.com>
Date: Tue, 10 Jun 2025 15:27:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dma-fence: Add safe access helpers and document
 the rules
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
 <20250609110330.74705-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250609110330.74705-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbc1e5a-032f-4ef8-0f31-08dda822858a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzB5Yi9tMTlXVGI4ZzhvbW1QNVJJNm1vdEJBSHBES1lSYzBsWDJ5aEpPcE9z?=
 =?utf-8?B?MVk5eTlnUFFwc0h4eVJkdnZVSzI2UUtxbkRUc2srOGNxdTd3RVFSb0dFcGps?=
 =?utf-8?B?dDNpWXBlNXpZTCs5QTNBdHRydUwrWUQ3NU1JREdCVkdFSWlDOElEeDRpZG1X?=
 =?utf-8?B?b24yOERVRGN5Z1FibHFiNit0VjlvenhyUlVYRlhxNXdXYXFPcFVHUnFwcUdm?=
 =?utf-8?B?dVQydGR2dm1mMFZmd2pGcDlFZkVsZ2JHOHpURndMMDVOQVV3Rm1tYkhjMHp4?=
 =?utf-8?B?UFlOS1BZTEczQVpIbXV6NzVMNGtnNytTOVdnNU5WSmdObGJQNVJVWk9DQ3Zr?=
 =?utf-8?B?NlQveHhTTFZhM3ZiVTZndDFaeW5iZVM3Wjh3QlZzVXd5aDR1U0RGd2FPVWdP?=
 =?utf-8?B?WXhDbFpNbDNnaDVKc1pZbkNGMlJhajR3d0RyekxJMEpGZUlGc0NYVGZtcEwr?=
 =?utf-8?B?aktTWnRoUEp0RWlhVEF5WTl0QzVJYjhSL0t5NkdNOGJMa1VtR0ZjK3pLWnpL?=
 =?utf-8?B?Tm1nNVR4UnhjZ1FDazQwZmdWUTVDV3F3NjZpN3NkUjNsZVFVMDh6RXdzeW5v?=
 =?utf-8?B?OWFpaEJlaWQ0c3o3MEhGUFZFeFZDWGNuM3pXTjNpU2Q5Vi9ObVBaZE11RUZj?=
 =?utf-8?B?ekpTdWpUQkJhaHBJZGhQNGZQVDMvUjdqQy9hT3E3MENSYVR5ZTRWcjFEaWpq?=
 =?utf-8?B?OW1rNVRpMDE2YzBWUmxiYTNSVGYwUEtjN0lUUHp1TW9NblRCVlN2RWRvMHBx?=
 =?utf-8?B?dEFpOVpQM3FZQmJVak52YWYvaGJJQlRHQUpDcEUvSFZaNytHV3U5T1gyOFlz?=
 =?utf-8?B?SS93V0N0NzVNWUR3MHcrTTM0ZmtqSWcrUmdCVEZBVmNUYTV1b1h0NzVxN3hj?=
 =?utf-8?B?cGhMY1F2SGN0RmtIS1EyVmplWDRpUlB4TWZnQStuZzl4ZFgwSTZWU2thSHhu?=
 =?utf-8?B?bHVlTnptQkIxL3dJdmc0a1J5OWVzcU0yWk9MRGJKYkpuQlZNYVBFb0lrTmhj?=
 =?utf-8?B?NFZ5TVZGL0E0MTRHY2JFUjE2R0JVVGoxZWd2dlYzV016dXdrY3dYdGZRSTRH?=
 =?utf-8?B?MEVlaEhpaUN1aXdmb0tvS1Vic2ZoTlNkQmNvS3BaSGVkS2F6NEE0L1pvcGxm?=
 =?utf-8?B?OWJObEpGL29qRmRCVkw5Ylc3K0hpa1VaQlNGK09uMTVuOWVRUjFOMUpyVG91?=
 =?utf-8?B?WEVNaHAxVEJUdWRBZ25mczRXQWJpUDNqem1WZ013SjJtU0lCMFhpZllka0dC?=
 =?utf-8?B?eVNDbytBbWpSUHhjNE9wNG1qcW55RmFwRVdObXZyNmY3TTgyRkJCTmNsK3VK?=
 =?utf-8?B?dWxVWVJDSTRnaDVPUVBaTnNPcmxYYXFpc3dsQ3BtVzJVeitHT1ZRQ25udjhT?=
 =?utf-8?B?ZnZFVHY4SDNVcmZEdDgxbVBtL2hyenZ6UE8wd2Nzd3NGTHl3Q2FIVENBSFNF?=
 =?utf-8?B?TVpvc0o0WkROTS9tWVNYS2djMk93djd3Z3lKOHNxbk5zM1ovZjcvL25mT2Ji?=
 =?utf-8?B?V3BEM0kraVEzQ1BMSklQU0ExZmlwQlRoTGJ5RjdYbDQrZm9IVW9xZkY1UkRY?=
 =?utf-8?B?UHZmNldTU3dKRWsva05PMytpQWRXR2NmSkJwNUlrWDNrYmJIRnZNck1PbXRJ?=
 =?utf-8?B?cnBBMmo5dkxtT2NtblRRblJ1ZjJNSlhEdExNQm8xNmtqeFpoRTVJOXpsZXVw?=
 =?utf-8?B?NW90ZzhIQjFRakxoeHJtd0xLZENDT29zQUIyUHhXdVlYaFZSS2VFMis2QThR?=
 =?utf-8?B?NGlCZFdOQmY5ZFZBbVNRU09Fa1RKWlNxZFJLbkU5REpCUFJiTVdYcEllNm5Q?=
 =?utf-8?B?QmNNWTlkNTlZT0VwSjU1aGNweGtvUFkvM1FrY0w1L2FweTVtMHRlTXNDcEFz?=
 =?utf-8?B?OGNiV3lRSHM0NkZqV2svMVJPUkVOQWV4SUZGYWJzVnJKT3A4K0NhOU0zcXFD?=
 =?utf-8?Q?yeD/1CGW9Qc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXFJM0VZSFVVWVRpdW1FdmlCdEkyN0ZiMmF2MzhFeUljRnc4Q2lmRnB4MGl1?=
 =?utf-8?B?SnYxMjMyQW9qVFUraVl2YVBJcC9pdmdzb1NPcHIvOFJCa0pmbUV5Z3FXZkdm?=
 =?utf-8?B?M29XaFJwRGJYYVFWQWJGUTdYRW9qNE4xT3RRUHVEOS9mYVJ4TmdxYnFIZU9s?=
 =?utf-8?B?bTRPOVgxSHlHaWFXUi9sd3BQL3p1SGlXYjNlSnBLb1JuUE54Y3lEU2tQSjVR?=
 =?utf-8?B?cUM4R1RIdVpWeC80bldwdnJaNTRuWFdBRDAxWnBHRHpVdTlxOHJlUFlCU2tj?=
 =?utf-8?B?VjR0czJCMkQ5Q0JVcitQdmVkRHJjWmlPa3dQTnE5ZHZDNHU3UlNaZ3Fpd1Zv?=
 =?utf-8?B?OFFUbnUzb3dMYWEvdjhnOVc2TXY1Q0MxU3FSb014QXNCWnpEVHlFVFJ0Rzhr?=
 =?utf-8?B?ZHVmSUo3dzlvMWdGTmJBVFBveXNETGJQOUp5bDY4dnIxVFRyRnVhMDVLaTRK?=
 =?utf-8?B?cnl0ckl5bGZiNWhsNWtqL2NTNnpjRDVtRHJ1aiszaHVQZ21iTmkrUC9BanBm?=
 =?utf-8?B?bmd2QTNaSDMvRDlBQnVuQXZTaFJHRG5LWTJwV3NUZnRJMGdqKy9qbUo2cElV?=
 =?utf-8?B?b0xKM0NOdkFtazUwWWpIK2Q5WVdqWUFBbFcvN0FXNUdmYThUNHJ3SUsxb0V0?=
 =?utf-8?B?Ylo0L1luS0d0K1pXcjVYV3RxWU1aVnZVSU9LK294QzVUby8vdi9sL1E1NzFO?=
 =?utf-8?B?aEM4b1ArdVJEd3V0a0IwcmNYQUJTZ0h1VzBLVmxjWk1DNG5FSEY0bWk1S1BU?=
 =?utf-8?B?ZEtBUDA0VUlBRDJ4Wmh1ZlVqbUx6NVo1eGY4bUQvR2FhTDdWVVdLVEs2SFhr?=
 =?utf-8?B?bXo4UXVtTWVNR0hzTllCb3Q5SDlUbWJMK1U0Tk1ZVjV1U0N6L25mV3E2bnQ0?=
 =?utf-8?B?cHVIMnlEdGE0SUNLR1N2dUtyOXpjd1hMSEVaUUFHMlZIcnl6b2k2THhxN3hW?=
 =?utf-8?B?Y1FXUmVuaHFObWxrbzdENndEMFVvQy9XaE5ENmsvUTZMck1VeXpzVVNRMlY0?=
 =?utf-8?B?Z3JRRDk0OTdzb1Fvb0FkWUdNdVpKU3BvaVc5eC9hdHRrR3preUl3V20zeGtO?=
 =?utf-8?B?WFFJVVZDRE9Jczd6TGZVZTRlRCsvdzhCZGpkdlZ5WGpRdVFkZm9WcWQvUXdn?=
 =?utf-8?B?MURYYko4MnZ1SmVScXZBNmxPQ3dBcHhoMXRPcVJwTXhNRGR2VUJlY0NpdjVp?=
 =?utf-8?B?ZlgwS0Q0VmZRTVdoMzNsZXYwMDJRQXBpcm0xNUU2czhaWk94WUxkcW1Sejdy?=
 =?utf-8?B?UnppdG4zem9YcmNQbzZCUDVaRmRlRlZ2OVE5Y3FQN3VhaUpyVHlxVmpJQkNP?=
 =?utf-8?B?SWpxTnQvTitlaVRpblZCVmR3Vk5jQnFoRm90VmNzeEg5SlpQaFJPeDNhMWlY?=
 =?utf-8?B?UzhWQndDMDRUQzRQbkdwMlFsL0YrQmlzTzVGVG9LYnZ2ZFFLc0lxSHVta1Zx?=
 =?utf-8?B?anQ4UVkydnBFRnpxMXdtcGpoYXBOUmYwSFB4Uk83Z1Q1K0xLeTB5UHhXZVZD?=
 =?utf-8?B?YXgrWUl1bEhvYWx2TUlkWXE2VExuWFBveWJ5UmxiUVRYdTY0aWJEQWFIeGl3?=
 =?utf-8?B?Ry9kbm9keVNRS3FQNzkwVkNPRGRSU0FGRklDUmRaL3c4N2FJbE1VZHJKU2tp?=
 =?utf-8?B?ak80YndjYmkyZFQ3YUhTbkZLSnNhN3F3dThsamRrNkNVbDkzQWxML3pmNDN5?=
 =?utf-8?B?aXVkbG9VRkhIK0hVbUcydExtdmtiZWpudDg1VSszUlowY3d4VGZJZy81SXp6?=
 =?utf-8?B?UTNLSUpVaVI1ZUtOV3V3d1B4VHNUYTZQYnpkY3U2MWdETkUwejhZM3NFdFFW?=
 =?utf-8?B?OHZTMmRWVjlkV0czK3hiZGRmdjV5Y2M4M0VrOVQrcXhMZXlieDVCTHR3d0Nm?=
 =?utf-8?B?MlN3WVFXN2o3MEc2bmFkT2FPUXVKMmNRaUFjNkNkT09IZkZPdFpsN0hiYkg1?=
 =?utf-8?B?RGdrdGZLd3M0d3VtNW55RFVPUnJ3RUd2SFlEUG81Qm5ORG8rWG9rN2tRVnda?=
 =?utf-8?B?OVJjdjNCcTVkRmdQZm54WWJndVp3aGdKd0YvRVB5QXBZR1NzQUdIV0JDWERq?=
 =?utf-8?B?TUNSMG42akFmQk00L0s3SkNuYmhxM0xmc3BWb1RDVzFjL0orQytISjBMdjVS?=
 =?utf-8?Q?uWd2zb8VoFThSvuRkUdERMiXv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbc1e5a-032f-4ef8-0f31-08dda822858a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:27:18.2008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxLrEUlw+Y7QOI8qppZ1Iz//h/v8GtFrEGUGaXg0vNVfrEI8Q/bNYmYUdkoHch1I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8555
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



On 6/9/25 13:03, Tvrtko Ursulin wrote:
> Dma-fence objects currently suffer from a potential use after free problem
> where fences exported to userspace and other drivers can outlive the
> exporting driver, or the associated data structures.
> 
> The discussion on how to address this concluded that adding reference
> counting to all the involved objects is not desirable, since it would need
> to be very wide reaching and could cause unloadable drivers if another
> entity would be holding onto a signaled fence reference potentially
> indefinitely.
> 
> This patch enables the safe access by introducing and documenting a
> contract between fence exporters and users. It documents a set of
> contraints and adds helpers which a) drivers with potential to suffer from
> the use after free must use and b) users of the dma-fence API must use as
> well.
> 
> Premise of the design has multiple sides:
> 
> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
> signalling a fence and freeing the driver private data associated with it.
> 
> The grace period does not have to follow the signalling immediately but
> HAS to happen before data is freed.
> 
> 2. Users of the dma-fence API marked with such requirement MUST contain
> the complete access to the data within a single code block guarded by the
> new dma_fence_access_begin() and dma_fence_access_end() helpers.
> 
> The combination of the two ensures that whoever sees the
> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
> valid fence->lock and valid data potentially accessed by the fence->ops
> virtual functions, until the call to dma_fence_access_end().
> 
> 3. Module unload (fence->ops) disappearing is for now explicitly not
> handled. That would required a more complex protection, possibly needing
> SRCU instead of RCU to handle callers such as dma_fence_release() and
> dma_fence_wait_timeout(), where race between
> dma_fence_enable_sw_signaling, signalling, and dereference of
> fence->ops->wait() would need a sleeping SRCU context.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/dma-buf/dma-fence.c      | 82 +++++++++++++++++++++++++++++++-
>  include/linux/dma-fence.h        | 32 +++++++++----
>  include/trace/events/dma_fence.h | 38 +++++++++++++--
>  3 files changed, 138 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 74f9e4b665e3..36604d68bdc8 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -511,12 +511,20 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>  
>  	dma_fence_enable_sw_signaling(fence);
>  
> -	trace_dma_fence_wait_start(fence);
> +	if (trace_dma_fence_wait_start_enabled()) {
> +		dma_fence_access_begin();
> +		trace_dma_fence_wait_start(fence);
> +		dma_fence_access_end();
> +	}
>  	if (fence->ops->wait)
>  		ret = fence->ops->wait(fence, intr, timeout);
>  	else
>  		ret = dma_fence_default_wait(fence, intr, timeout);
> -	trace_dma_fence_wait_end(fence);
> +	if (trace_dma_fence_wait_end_enabled()) {
> +		dma_fence_access_begin();
> +		trace_dma_fence_wait_end(fence);
> +		dma_fence_access_end();
> +	}
>  	return ret;
>  }
>  EXPORT_SYMBOL(dma_fence_wait_timeout);
> @@ -533,6 +541,7 @@ void dma_fence_release(struct kref *kref)
>  	struct dma_fence *fence =
>  		container_of(kref, struct dma_fence, refcount);
>  
> +	dma_fence_access_begin();
>  	trace_dma_fence_destroy(fence);
>  
>  	if (WARN(!list_empty(&fence->cb_list) &&
> @@ -556,10 +565,13 @@ void dma_fence_release(struct kref *kref)
>  		spin_unlock_irqrestore(fence->lock, flags);
>  	}
>  
> +	dma_fence_access_end();
> +
>  	if (fence->ops->release)
>  		fence->ops->release(fence);
>  	else
>  		dma_fence_free(fence);
> +
>  }
>  EXPORT_SYMBOL(dma_fence_release);
>  
> @@ -982,11 +994,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>   */
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  {
> +	dma_fence_access_begin();
>  	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
>  		   dma_fence_driver_name(fence),
>  		   dma_fence_timeline_name(fence),
>  		   fence->seqno,
>  		   dma_fence_is_signaled(fence) ? "" : "un");
> +	dma_fence_access_end();
>  }
>  EXPORT_SYMBOL(dma_fence_describe);
>  
> @@ -1055,3 +1069,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
>  }
>  EXPORT_SYMBOL(dma_fence_init64);
> +
> +/**
> + * dma_fence_driver_name - Access the driver name
> + * @fence: the fence to query
> + *
> + * Returns a driver name backing the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (data not
> + * directly embedded into the object itself), such as the &dma_fence.lock and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
> + * after the fence has been signalled. Drivers are allowed to free that data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace period
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked section.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> + */
> +const char *dma_fence_driver_name(struct dma_fence *fence)
> +{
> +	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +			 "dma_fence_access_begin/end() are required for safe access to returned string");
> +
> +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return fence->ops->get_driver_name(fence);
> +	else
> +		return "detached-driver";
> +}
> +EXPORT_SYMBOL(dma_fence_driver_name);
> +
> +/**
> + * dma_fence_timeline_name - Access the timeline name
> + * @fence: the fence to query
> + *
> + * Returns a timeline name provided by the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (data not
> + * directly embedded into the object itself), such as the &dma_fence.lock and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
> + * after the fence has been signalled. Drivers are allowed to free that data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace period
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked section.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> + */
> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> +{
> +	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +			 "dma_fence_access_begin/end() are required for safe access to returned string");
> +
> +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return fence->ops->get_driver_name(fence);
> +	else
> +		return "signaled-timeline";
> +}
> +EXPORT_SYMBOL(dma_fence_timeline_name);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 10a849cb2d3f..366da956fb85 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -378,15 +378,31 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
>  			       struct dma_fence_cb *cb);
>  void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>  
> -static inline const char *dma_fence_driver_name(struct dma_fence *fence)
> -{
> -	return fence->ops->get_driver_name(fence);
> -}
> +/**
> + * DOC: Safe external access to driver provided object members
> + *
> + * All data not stored directly in the dma-fence object, such as the
> + * &dma_fence.lock and memory potentially accessed by functions in the
> + * &dma_fence.ops table, MUST NOT be accessed after the fence has been signalled
> + * because after that point drivers are allowed to free it.
> + *
> + * All code accessing that data via the dma-fence API (or directly, which is
> + * discouraged), MUST make sure to contain the complete access within a
> + * &dma_fence_access_begin and &dma_fence_access_end pair.
> + *
> + * Some dma-fence API handles this automatically, while other, as for example
> + * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
> + * responsibility to the caller.
> + *
> + * To enable this scheme to work drivers MUST ensure a RCU grace period elapses
> + * between signalling the fence and freeing the said data.
> + *
> + */
> +#define dma_fence_access_begin	rcu_read_lock
> +#define dma_fence_access_end	rcu_read_unlock

Please drop those in a favor of another change and use rcu_read_lock/unlock in the code directly.

But see below.

>  
> -static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
> -{
> -	return fence->ops->get_timeline_name(fence);
> -}
> +const char *dma_fence_driver_name(struct dma_fence *fence);
> +const char *dma_fence_timeline_name(struct dma_fence *fence);

Please declare those as:

const char __rcu *dma_fence_driver_name(struct dma_fence *fence);
const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);

And then use rcu_dereference() on the return value when calling those functions.

This allows the automated checker to complain when the functions/return value isn't used correctly.

Regards,
Christian.

>  
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 84c83074ee81..4814a65b68dc 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -34,14 +34,44 @@ DECLARE_EVENT_CLASS(dma_fence,
>  		  __entry->seqno)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_emit,
> +/*
> + * Safe only for call sites which are guaranteed to not race with fence
> + * signaling,holding the fence->lock and having checked for not signaled, or the
> + * signaling path itself.
> + */
> +DECLARE_EVENT_CLASS(dma_fence_unsignaled,
> +
> +	TP_PROTO(struct dma_fence *fence),
> +
> +	TP_ARGS(fence),
> +
> +	TP_STRUCT__entry(
> +		__string(driver, fence->ops->get_driver_name(fence))
> +		__string(timeline, fence->ops->get_timeline_name(fence))
> +		__field(unsigned int, context)
> +		__field(unsigned int, seqno)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(driver);
> +		__assign_str(timeline);
> +		__entry->context = fence->context;
> +		__entry->seqno = fence->seqno;
> +	),
> +
> +	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
> +		  __get_str(driver), __get_str(timeline), __entry->context,
> +		  __entry->seqno)
> +);
> +
> +DEFINE_EVENT(dma_fence_unsignaled, dma_fence_emit,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_init,
> +DEFINE_EVENT(dma_fence_unsignaled, dma_fence_init,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
> @@ -55,14 +85,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
> +DEFINE_EVENT(dma_fence_unsignaled, dma_fence_enable_signal,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_signaled,
> +DEFINE_EVENT(dma_fence_unsignaled, dma_fence_signaled,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  

