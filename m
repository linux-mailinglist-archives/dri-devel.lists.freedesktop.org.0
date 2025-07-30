Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B396BB168F8
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 00:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2210E45A;
	Wed, 30 Jul 2025 22:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQLjOKOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B2610E45A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 22:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753914218; x=1785450218;
 h=from:date:to:cc:message-id:subject:
 content-transfer-encoding:mime-version;
 bh=pUlcI2D1MtUlWDTfwmP96sYuZIk3JRAf1rHil/Mai4A=;
 b=DQLjOKOHNSYu+qgFCUyw5tgXukzKML+9GVOAX3f94f1qa6rCiU+RBaPj
 d+YiRMYgKkDYF+HHgZrZ5wNbMIKe3yUAmTdMTsHFqcYI4hQQx2IQ/kxfO
 UyRPhPvXUAkfl/tXxzms0Fs5N4N8cT+mJFtael9paRTUDJWHofhldKFJr
 rnggG8grerQ3Ecv+59OQs3h4zRFwqbRDkaBN2Kh7pwC/agK4+F2Y40lu4
 4juxtJL7kfwGEpHkZ1vpzT+GUJp1tVMNBM4lcLqzHVB7jnHiDMX2J2wdc
 OiiJ4o/zoRyGkK1oVomeq2YK9qUu1Ynv2/dbvKGoKUiPSjymR4VHWPvxw w==;
X-CSE-ConnectionGUID: 0ptDLv08QyiVWalXv+SuqA==
X-CSE-MsgGUID: q8lg71dbRFGA6fuGtPQMaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67590220"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="67590220"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 15:23:20 -0700
X-CSE-ConnectionGUID: JkYUeHGARtSt19WQypzYOA==
X-CSE-MsgGUID: /CLpLb5URGCdkxU2EtH41A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="163888701"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 15:23:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 15:23:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 15:23:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 15:23:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXVvvsx3LY6vvTQtZ8DEKZYHzGUlxretuyQ7ouN27O+bJy28sYGrjvoA7zG7G4BVw/r4LE6hNETVtl4rdT1fbBqWrn3fk2Kgmlp9Iy//3kCgBoEPjt34yJ8BtaFelxxNZYvT1uKk72AAsAkGapwVO+L7ZnBRoFIS/qKoTui0dSWZVRobFoVKiO+q2Lu6yQ8rxIrZ7cCCFm0X7dN3qkoVfv8e//+v2hrBdwI4wMyicXHz4X2/OsupbwGhdiC9Im/pKWCWnwZJlZxKBc/nPEW/1WFZDftlHbAiNeMOJYpqNp/6iViapbjFyxQqal2cuZx34EWT4X06nu4+MrZ1e5ul5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUlcI2D1MtUlWDTfwmP96sYuZIk3JRAf1rHil/Mai4A=;
 b=i88XvKCzLWqEGM7ut4OQtvSPnHw56IAE8ZsVym4wUC8jkaRX5ASHAjxnVhpWPntsxGrhTOu4uDa/8MzqzKPXHQKETNxEeIkuMW2CQY4fqmKvBPeUpHo8YaiefPz9dv5OU+U4eO/kAVFD4dyHcfzuX1kCAi12Upzq5e4726PaTSlzBiDBeqhEa7Ow/aGJgVmoMZQ9VE5SPNoAZMwG4kYu7a6X3BGmjAOQ5GIZ56752qtMK6miz9qTUrrHnZL2GlzLe+C3QmEP/FPc9OLOYgVCmBGOT8Apa3MhRNQkrvNqAlOKmj5k8+xk5o/tnKrgzMRQzT9Kge1zFXifQWHUjNxAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 22:22:39 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 22:22:39 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 30 Jul 2025 15:22:37 -0700
To: <linux-cxl@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-rdma@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <a.manzanares@samsung.com>
Message-ID: <688a9b2d35c97_48e5100af@dwillia2-xfh.jf.intel.com.notmuch>
Subject: CFP: Plumbers 2025: Device Memory (formerly CXL) Microconference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ0PR11MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: 52716fb7-2c58-4aa9-5fb0-08ddcfb79816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTdvNDlMaExLK1Y2eWpmR1lxUUl2dFdGcjhEZmRLQVpHYWsrOFBHOVM2Skpq?=
 =?utf-8?B?c0JDRGVLdkZrUmFPYTdmUFlGazF0bll5Vlo2Q1VEZndjVVdjMXpwNjNTd1kx?=
 =?utf-8?B?Wk56MG8rY1Rsand0SWZwaUMzTHlsemFob3I2T0VkS1hqK1ExdlVIV1VBWFRx?=
 =?utf-8?B?YnI1M3hFVnluV2RFV3Q4UHNKbzBrVmpRZzZMOEhHamExeHc4V3JnTUNGU2hu?=
 =?utf-8?B?MndtTHRLb1I3UnJoOXBBS1c4aS90VUZhOVl1SFBYNmswRGRLMzVlaUNDT0Ns?=
 =?utf-8?B?Vml2emxBUFA1VXY1cEJTV1QzS2lwOHY2VU8vWVNmQnRIWTRienZkdHlNZDFm?=
 =?utf-8?B?b2cwWnVDSEo0bEpmeXp5U0p6cDlKdm85TGhuSkFhYzU0c2FiNEw2RURlMmQz?=
 =?utf-8?B?TnJQR2Y0VE1maWJWandlZEY1b1hEeERmYVVzZjRqOWE1OEFSMkdGQjBkNXVZ?=
 =?utf-8?B?QW9yT2hNSERQYmJwbE9DVnRyUDA3THVzekI1bzc4cE1kaTA4SWNSSmJWMDVP?=
 =?utf-8?B?K3dLamdBalFURXZsZU11TVVXWW5JRUk1TEcrN0w2YlgzWWNoN3M0Umg3Q1E3?=
 =?utf-8?B?WTNwcVQxdDN2WjFhMWs5SlRhdjF0UFY4K1F1a0VBTTdJcDYwSjlHd1ZnbFJt?=
 =?utf-8?B?d3pZZjRyZVB2S0JyMVpVbDJXbFFmMUdVT2ppZG9FMjJkUVJ6NUNNQXR0YTMv?=
 =?utf-8?B?MTlwb2RGaHczdDFhKzRnLy9BQURIOWg1Y2FoQlQ4cCtYSmtDUkpnemZmUk44?=
 =?utf-8?B?ZnhGeS84NzBHOXdLakFPRSs1aFp2Q3dwK3RVVk9YMElraVBHOVo0ck1aVWgw?=
 =?utf-8?B?UHg1eWJrWU9wZERhcC9sWEhrY0M1RHprcDZ5N1owYmRmQ1F4N2F5SE9NbWNQ?=
 =?utf-8?B?ODlUTVNXUTdEMzRVVitTNkhFMEdILzcwdGJuYmNzTzdFV1hFaWZ5OTVqczlI?=
 =?utf-8?B?cHl2Tkp0bFQvdE4rT28wbFc3Zy9tMWJhdnU1Q2pRT0hsUSs5VTZPN0RRZ2dn?=
 =?utf-8?B?NGlyQUVjUk1uUjQwMmV2MkhOTm1zbHl0QlBJYWNuSTJELzE0U1BtSmJSa2lp?=
 =?utf-8?B?ektXNWthOVYxdVZKaTJSMXpLU1k5THRQc0tKOGw2ZkF3a0ZTdUdsanJ1NmZj?=
 =?utf-8?B?NFkvd1lFb1ArTUQ5NEtyNzZ3MUt0NnM3K0VjdFN5Rm5vRExKWXFtZGdsa2dU?=
 =?utf-8?B?RFRWSXZsU0phQjFwbXV3elJ0d2ZVTUdmM3JtZ0RZaDhYQmVGL3daSXVvQVlw?=
 =?utf-8?B?MFZsT0IybWpMNjJVaWtSeUFCSjNFMSt5c2QwSFJUcG1KSWJJKzFrQUxvNE5q?=
 =?utf-8?B?ejV0MXlTSEpJNWZYNGVvV1RGaFdlZmFhTUlySUgxRkJEdEgyNXc1Q3dRVndT?=
 =?utf-8?B?dStzMUQ5Rm9xdzd5cDgraXZMUUFVTFJZcVJKaUZHK3hMdjB6bkJjZ2EyRU94?=
 =?utf-8?B?VjhlcVlERnBiUFhUWHdTVkxqalVhNFQ3OTRaaEJYanIvak1KcFRBcERhUnhz?=
 =?utf-8?B?blRMLzYwTDh2Tm1FMDREZzF1aWNndW1udnVOWnZWU0wzVUxrREhaTWZBTXpH?=
 =?utf-8?B?bEwzQ2trWnFmRDlsMEFpWS9FMTBON1plc2w2UlNGUkE1SVdwVUlRVXoybFY1?=
 =?utf-8?B?dnVoSENsV1k4cHkwczlVZEIwS0VBVjNFR0RJTGtYTFRmd1FQWmRtRDEyQ0tB?=
 =?utf-8?B?clpzNS90cit2cTA5T2x5RHBRbmJUdHZXazhKUDBHR0x3Ynlqais5N3pSRUJ1?=
 =?utf-8?B?bVo0OStSL0oxdTZSWXlSL1ovbTJabTBVN1hxaFBBSHFOa2tTWUZETFJvamc5?=
 =?utf-8?Q?rmhzW1uHJZM4ZHXTmeCS8F8zoYIaiRFGpRldw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTU5WGdzTGQ2anRsZ29STlUyeEJoV3hTeHZ5WkYyVzZsaXUwSk9panBMZk11?=
 =?utf-8?B?VURCUmpBeWx3SFpuSlhIYUNiVEQ0bG5UdXRWRkdjN3k0ejF5UjQyZ0dIQi9K?=
 =?utf-8?B?QlpLM3ZVSnA2QUg4Um1kR0J5QUh0YlZyWHFDUkZQZDByUEJiMHhFbVFCU0ZG?=
 =?utf-8?B?ZlZWWTllQVpLUzJXZStraitSdldHVzZNTmZIV0x0TWpvVXk5b1M4V0FHSy9Z?=
 =?utf-8?B?Q3FZVk0rQnJUNHBPQkpCY1RXeGJ3akM0K3pNQnozOHZEYkt0ZmJTK2VzenhF?=
 =?utf-8?B?eGljb0V2VUFtclFOaHJ1SGs2dGpFZDU1NXFQbTJ5cjVaYXhEYXJnVXgyWnFF?=
 =?utf-8?B?R3ZFZmQ0TDB5WjhDVEcwT2tzcGYrOHFWZktNOGVVc3MrU1ZSbndJTlJlb2Yw?=
 =?utf-8?B?VERPUzRRaWJFT1lXNWhZRkZ3ekVBSXdScnFvYUhVREJlTUh2Nmt6QzRCakUv?=
 =?utf-8?B?MFc1R0tud1V2eTdsV05FN0hrQk1CUllKd3BkQlB6RVNVTi9xbXJ6YXBoSXdT?=
 =?utf-8?B?Y2NPOElBZDB1dmlUV2tLNm9Yemg1NGlNVFJCd0pRQnVab0hJUmN5U3dEc3Ju?=
 =?utf-8?B?VmQxNDFiMDV2a0pOL0s3eGpYR1ZGRlBOQ0dLV0dmY21KWG5hVmtFZ1pibys0?=
 =?utf-8?B?V3lzeDZnUkNDT1QwcTBYMTZPeWlMN0dyVlRUS0duTWswSUgrdUh1WEtkdUg1?=
 =?utf-8?B?dTF3MnQyMFZKZmJxc2E1ZjJVOWpXWmlHang4STk4cUNTRXlxQTVWakxUNDBp?=
 =?utf-8?B?T1d5SWJSSWNuaHdGQ2dhdWhGY3JGajNwN2FkMVJhckhBeG8wcVdWL0gwOFU5?=
 =?utf-8?B?NVk1REQ3RjErdllqVWY0NjZ4NlBtTDEyTTY3QS9Na3hNeFZWUGN1Q2oxaGxD?=
 =?utf-8?B?MFRFMFJUMzRrb3ZnbUtOTkpFR0R2NVZkZlJmWFpQTEhLOG9qMmtBNHlKY01S?=
 =?utf-8?B?NVMwSXZaQ043OVRkWFRyMHlYQkJqMGdyRXhzQjArbnc2RWF6Sk1yQ0M1N1ln?=
 =?utf-8?B?dHJxRnlEdFJWWjhyUnVGc2F0cWZ1NkxVSlNEOUJmSnpxcEs4UkpJSFFPeW12?=
 =?utf-8?B?MWc0QlFYVzVCQTdlVmc2aXFib0VYcDM5RUpDNEgyb29oZHd6WXR4T01HUVZ3?=
 =?utf-8?B?Z1FWZ29lbzZDcjU2UXVXRmNEcERST0FGdmxDZGJnY0laSldubjQ3bWEwMVdr?=
 =?utf-8?B?Q1B1YkJYc2lXZVpvZmhhODhSTlE5REpvcVhrK1N2ZVBsMGFCdlhEZzVjS0Zn?=
 =?utf-8?B?ZkZWZG1hMUdaeVhmalRoTGE1a2hVeStNYi8wSENIeXFWcEVxa2g3eEo3NFAr?=
 =?utf-8?B?Z1ZFSnFLTUs2ZTM2NFJNM2VpNHQzSVlXSEZoeGk5eHRtNVdWNHYwdk05dTcr?=
 =?utf-8?B?TFErUHEySzJPTXNEUVRpTzk0cVhyUVdTa2hEeHliUGxtT2lUSjNXUnU0Sm1Q?=
 =?utf-8?B?MTlPM3lrUGsyMHNhK0J6N3ZucVg5bHU1VFArbGg5NzFOekdjaExybkw4anBK?=
 =?utf-8?B?VkFNWHB1NldVWC9DK282SGRSWUROcC9sNWYrZ1FOdGp0eTVta0lmQi9lU1Ry?=
 =?utf-8?B?NmpwS2dIcExNZlRlK2xieklXRFlPNXZtQmNSQW9qU3hGbjVlUEVreDJjY3Ev?=
 =?utf-8?B?OVpqaXdhNndJT2pEeDV1QVFlYVh0dHVpN0M0Vjl4ZjBKYnBkbU5BT3ZBVTZJ?=
 =?utf-8?B?M21Td2VQT3JtOXVqVTFpVTF0QjV2YUczM3FybGlrY3VXY2xrZTlMMm1ja1VX?=
 =?utf-8?B?ZUhyMlRTQXpYeCsyY1ErdHFMWlhsZnVZYmR5Qk1ndGhSakI2NEtvOTNDUnJ4?=
 =?utf-8?B?OXpwdnNKMW1rdU13cGFyeDYxNVBFb3JKc3R3RU1oelFIT1R0YzVyekRMQnZa?=
 =?utf-8?B?eThYK210Sy9FbUZWRWtEdFVNWGNFOUN6N0pmbHE5SDZ5TUI4aXZtekRhelVx?=
 =?utf-8?B?RStlVUgwTFNzNXdHc013ZWw0QWRvdm9ET0FZdGE4VWp1SFBtajgvcE94YmR0?=
 =?utf-8?B?clZONFlMdFlXeTdITzlMZ0J0eFFqaTh2cGhnUUtYVW1lVm5SNDFwbTNLUEdx?=
 =?utf-8?B?V0xnNWxBUTlyQkdKanVEVTNoczRFQVlodU1RUjVLb0FmdnBEUktuT0x1Zzhi?=
 =?utf-8?B?V0VjdWE4d3NqWXVDQnhzT3ZZK2t0YlJZZXRRUnV3Qng0OWVPN3ZZbWQyN2ln?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52716fb7-2c58-4aa9-5fb0-08ddcfb79816
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 22:22:39.5637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EOKIG9aaCb0VGMyRCNObrUvw16bTHs9i6gg/0jKA/7iFvbihRbW0hYO8V1SDMbBw62TLcFqg+BqGD+5zPwh7eAMsHtm+Mjvoonrg4zevZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
X-OriginatorOrg: intel.com
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

Hello,

Linux Plumbers 2025, to be held December 11th through the 13th in Tokyo
[1], will host the "Device and Specific Purpose Memory Microconference".
Topic submissions are now being accepted.

Go to:

https://lpc.events/event/19/abstracts/

...and use the "Submit New Abstract" button. Select "Device and Specific
Purpose Memory MC" to submit a topic proposal. Some topic suggestions
are listed in the abstract for the track [2], and here is some general
guidance for uConf submissions [3].

Plumbers Registration opens: September 14th 2025. Submit your proposal
by September 7th if you want to be considered in the first wave of
acceptance notifications. Topics will be considered on a rolling basis
until the end of September, or if the schedule fills up before then.

Looking forward to the discussions, see you there!

[1]: https://events.linuxfoundation.org/open-source-summit-japan/attend/venue-travel/
[2]: https://lpc.events/event/19/abstracts/2204/
[3]: https://lpc.events/blog/current/index.php/2023/06/26/the-ideal-microconference-topic-session/
