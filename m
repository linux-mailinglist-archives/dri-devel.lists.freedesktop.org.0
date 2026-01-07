Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A62D00083
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 21:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E0F10E0EB;
	Wed,  7 Jan 2026 20:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIXl0OJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F9E10E0EB;
 Wed,  7 Jan 2026 20:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767818431; x=1799354431;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=33xqubzX5yv6cBuWPPKaal8I+H/Ego3t+xIkFYmQtnU=;
 b=VIXl0OJVzIei6wkHswRepJVe+uGq1/sXpcPUgjFXdeuHOj1sgB7Yl7YV
 vgl4D8bg8oYg1IkcMut2gjIB5I1ouw9cVrDDQ/rFmgpoeh9vG5riaExK2
 bkXL4vK1hJ8LTRO/1TsJShln3Z8w88o1s+eBSPiNg5BDuTtQw/FwTQHsP
 j2H4HzV/K83yUM2XqrRgoyw7leYesqG2OQTZiasVTT1D8LlsCSyqq11CK
 plFOh8GwQtzl59LxEYJ8lxD5Y3kGkHaOLABbq617YY225bHGXltOvwT59
 /zSGeFtcDmDtKBU2+hFqi/utiW4zT3hTTW3IEsngqJu8XvJA03sVc/nJi A==;
X-CSE-ConnectionGUID: bOwO/pFORvOlyLZkGuRReQ==
X-CSE-MsgGUID: JivM6xKLRKa/C3jE9yVesw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80648520"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="80648520"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 12:40:31 -0800
X-CSE-ConnectionGUID: zE3h5/a/QAmP8XP6a1QHPA==
X-CSE-MsgGUID: CDqcEyuUS9aDRw3SuLtXHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203073903"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 12:40:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 12:40:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 12:40:29 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 12:40:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlIsmeZ3Am3GDNwvuCcQUS8y3FBcBsBn3dBw4TpMlsxX0wpQb9DAsUuyiJUVAKYDg4DAWWM2xcCxjXiLBeleZzjnA7rM+MOBnVwNElHBhIdzVk8TQ9496HylIFlNH14h4pwoVnTINBYdePGa7j/2iTCtkJRvCAz0UroyoOzQVwLhDsKCpmWPevvQK5Qtjg6dHRGgXDclq5xUM/1C0jaVoyvD2e8DHEWy1xWN9fywSWsbEJJVsS0GVY6QP0o050v4OLHwroYdzDsRx4TBXhR0jd2/EX4LxKUL52nouj5dAwsf3exGqDETOy8N2F4oUlgNrCO7SN7eGxk0HkVZMXrAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V73jVpOvDs/yczs7n/pefY55OMtXbkz5TcCpX9egbUM=;
 b=r1CB4NRlUsXTvxbzpPXIkuSZ/u4Ecyf9+50ZiIYTXgZ4IsSj9Vg4F++ZmT9vC/XuRVpYmBIfZW4Y+CK2lI2ilBQep1FSWAoGyPU0o/aJ+yjtSZ+l/Iew0zT6n9deuTGdxfHM5yHLqTirKpfjYzWVWkaUG4X12GYUeQ3/WOp9e3F+rF+l+ncXXY9QjBc+4YI6F9ZCr/ym19oH4nkBopl+bMailE72/zYGosgw4AQgz6GQTPnhs2/2UPTbtlHDQTJCckPmUtIGqJ3si3U7+AoSTAlV8tcqzQ83phSiixmU2uGb9ax/mIohzcoWerwY56SRbaAjawUMvFqzCAt7jTgcOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA3PR11MB9038.namprd11.prod.outlook.com (2603:10b6:208:57a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:40:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 20:40:24 +0000
Date: Wed, 7 Jan 2026 21:40:20 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/pagemap Fix error paths in
 drm_pagemap_migrate_to_devmem
Message-ID: <aV7EtNZ6RHyZZplW@fdugast-desk>
References: <20260107182716.2236607-1-matthew.brost@intel.com>
 <20260107182716.2236607-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107182716.2236607-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA3PR11MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: b949f6b2-eeed-4e42-fe38-08de4e2cfbd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5Aian1n/14vWEUPQIl3F+hK6mcl85ARu/mHGjpCufcy2i+QBsaLwcrvTAv?=
 =?iso-8859-1?Q?mPG08yffA/iPV4TrGm9jjXKTb6VddMS7u9GRwTcE4ObJVB2EAJo6v2UO07?=
 =?iso-8859-1?Q?2MZqRuuXi+rregi+h0t8cePYoKqu41pc7GPqo2Hc9B4qyoGoczU4KYE3h/?=
 =?iso-8859-1?Q?6tayKFQm4qfkpmqb9g5V9mZHewnTFq8ZODXfHopYsgkl7sPFX0JsHj3bdN?=
 =?iso-8859-1?Q?qN775dutMYmsrtHAOlbTO0jtU1UPnkX0EAMqiacqv+ttahNlsVT1PtHbJ9?=
 =?iso-8859-1?Q?yqBlH2c8s8UGJcVF+sshCmHKmtv9raG6yFSvUs5cC5F8hB0y/VhPAhMHas?=
 =?iso-8859-1?Q?HL26mvi9rtYgUXXpVizJZ7WKbw/cedMFmvBkmeNAkTunQsJ/Eg43c2PVFh?=
 =?iso-8859-1?Q?Jwtotb08pbGWTRF0CTd0LqhyOGiG1Z7NaLQn1EiMLdsDInF3NRQwY9x47N?=
 =?iso-8859-1?Q?qHO91IBjmh/f1Tk6susyKASHVn3koyUCF3ziNiAyXkvx7kY6CLwEeSuRxP?=
 =?iso-8859-1?Q?aAnWfwJoHjBwpz0sfZ84ssWqAey4XBSj7VARxzKthms3ACZmub6JOD4iez?=
 =?iso-8859-1?Q?zsgg0gA5Zzz1tDatK85JRn3Uy4coJNysmHZT0OMidlUAVppJtR6vIg9Aa5?=
 =?iso-8859-1?Q?tkeDjBYQOJWAsph1eBTXQA61ITVD0sL0derOvMpB9CmB1jHhl3Rwek4F5N?=
 =?iso-8859-1?Q?jlqSoQudpeZMlC8I/UIhjqgS6/HDMOHPFJzCsbjMqkWyOWYwAgsKBRScN+?=
 =?iso-8859-1?Q?O8xt7Jkyx23Y+5LGF+1/3oAlS8AHoZVlc1AMkcGtaji60QhGCxJuziqL2x?=
 =?iso-8859-1?Q?xMdLV8teDBWPwtzo2Vk3P+/hWB4KiKVuFAyn5g1zNyQmKJY9p9NEbTIg9d?=
 =?iso-8859-1?Q?YYb6kpqZncnkykx5QRfa5SzpTgWPvjOHvkTZSOX+amMbuCFxpFLEm0kQMl?=
 =?iso-8859-1?Q?P0abRqPdBJNllxl8OBuyXJmzx9KTZeiFRNLKESwTLQUyCZdSk5bsFRTxUl?=
 =?iso-8859-1?Q?vKJKlyeEIuFMfZgr1kWBfuJXQQ1cCjFlji6Iq2W38HPoA4Vr8vjl0pzUyv?=
 =?iso-8859-1?Q?lGkTR/VEcJX+xgD8qNe8Jzp7Bq7p2tihnqaAqykzvw1U3SYAk5OxVJgexS?=
 =?iso-8859-1?Q?T1tqwfKjQXPakseJ1W2dAJmxqoYmsn49Ccphz+QckB/w/nyc3tuhNxccls?=
 =?iso-8859-1?Q?7CTtjkk6rD/Rfq4DGsNIMy2HzCqCgCoeFYNDbgyFfptsyYxWPNiAHCjLIa?=
 =?iso-8859-1?Q?p4PLFbV3R8yj24TOVmiKTe8VHxwTEBFv6ktpPc0urtXWy7ZgLtfh0Glfp0?=
 =?iso-8859-1?Q?dFjtnQwpOEx3t5JtXIhZ6+1VAcs3/x2dI5Z7MzVGhdZJNL2kghpgFHHSMx?=
 =?iso-8859-1?Q?Hbeg1pFcYDP9hLkHjthtpY+haYj7bsNoNCQMFzsvcXz2yiSARiLe4gs1KB?=
 =?iso-8859-1?Q?zbx5VrNt/XqU18YL/EMbpgqgPLy6evKw7wWsxKsJ8kW88Zky5Zlh4LSJaK?=
 =?iso-8859-1?Q?WOH5PjKX4HnIi27nIDMZMf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g03Efr8AAYHskNkTedbV0jt7ubErhL6WMLkbNBf5aQq23CogKhM+f3hVU6?=
 =?iso-8859-1?Q?CHdJO6RsZxY4ZYW2Q8Oura27Q/AHjkRZRUeyjSmymMAIhc6C7P8znlb9v/?=
 =?iso-8859-1?Q?9S5Gcjl7IYMnma+5QVpcB1YOKJAHVdNNlycEzDAUTXScLiKZxm61ejaVhf?=
 =?iso-8859-1?Q?0bjt/OSRZuvpeqbjCwOb2vLCpUuAlguljjPF9sHsse62rg4VQC9y6t8gTN?=
 =?iso-8859-1?Q?IexipSbOX/hRum9q9SSStuQiq7ByF9jL0jJzeczUbgMotmUWlgOZkuqAjs?=
 =?iso-8859-1?Q?gDHk79kFVKXdNN3ws+uBNO8o0AMTaDV6irGbsJlQzZEAbJKUAzmg6j7z77?=
 =?iso-8859-1?Q?Nne0nlvNRFRLZE3oNS6sS5dg+0k3TKgtmRuGls7ueMKjG4W49NdeWHzbpA?=
 =?iso-8859-1?Q?Jw4cXThJupd1PedoDLFpuI6Zkj4yPINOnxCwUIp+0hxQAMh/AZDQ4ztT0V?=
 =?iso-8859-1?Q?Zbs63lBqr+BTyAqOYDcz2H3Qndeyr9at0yGQcqsfoxRvu/DQoTeftpgZsv?=
 =?iso-8859-1?Q?zPT5y4m9nUkcXLz/z0rnoFahB5lLlyKeLmnSLtppYiK/gWE8b7gjgRf96x?=
 =?iso-8859-1?Q?nV/hBYayjjbY9gfjrLiuZppBzTpEIe21y4wPZlLiGs+PR1IpIOSOMZPQ6z?=
 =?iso-8859-1?Q?p02AwmlRHY69SHv3iNnvM2SxWQfOCo6SadyF6QLK3n0o6k7XT9qF+Xa/7t?=
 =?iso-8859-1?Q?yYuiX0CBF0vvxZNv2dCgw83GBlPOyeOLKeHVYyvUBdlblHcOCFe4WHSWm8?=
 =?iso-8859-1?Q?dtMU/hdh7qizQwIkY0zEEJZQ4ro5YLNekNCN/hjGHIDSMHj70LDAcfjHln?=
 =?iso-8859-1?Q?6HPqswnydYmcxirMrOlb1ak0q5hoDyJHOd2WVWgkjcHfyCpXdmpOISOBR+?=
 =?iso-8859-1?Q?1dpKO8nAGmrt5yJocux5VijWORbQUQDl1phd6M8ADTf5Ea8GSGSvmOFf4S?=
 =?iso-8859-1?Q?ZvHbwOCvplv5tzUstavjw8+7eq5mjMejT6rGh8KtAvvTA9tSoOYodkU+V7?=
 =?iso-8859-1?Q?X2dzkpYyKXSyvN0MPF5EIQdyn4rAKdoKxTZiJaoRv0DU2K4paIAcnjPhTf?=
 =?iso-8859-1?Q?rlNmUCLZGRnxyF7HDBlDnXJxy3klxtC2pTxm35yF/AhAlt6L8ekLxUT04C?=
 =?iso-8859-1?Q?reSSE/rQTolZ3ak0SRerd6k9tI8FaQy/SmKkev7jdRnOFFbQgPFsEUhJxy?=
 =?iso-8859-1?Q?zC21pEZampDGr6gKLqo3vFFLxL1n/2D+9zXI7I0/68Nys1USvyfimQoVGd?=
 =?iso-8859-1?Q?x0h4ZsNHB0+Ue+Wr7/onfwb3tXzw8VBk1mDEGZljEJMCAM1Gxl+nydpD3L?=
 =?iso-8859-1?Q?l2//FegXL/6Yk08F517Q7Atr0Igu+SnTtoHzvCjGoCyUoNTpgglWwgkfcW?=
 =?iso-8859-1?Q?5Dmk0ppd6q1tI7orThqEQtXGbOIotlD8x+e81pu8hljiHSuk7YR/Lv/6qm?=
 =?iso-8859-1?Q?NfC61Xaq6GX8Ga64I4IZPsFYaPozw8No2xnAMCNNz9I77rQTxrJbDw6Kd5?=
 =?iso-8859-1?Q?lqp3q1qkcKnbmgv1BcreJAvDGAgRpPDKzvuq2zI+Bjt32iS9YJQrSgMMmy?=
 =?iso-8859-1?Q?r5lolLlS1/5scOijx7eyN/0be1hrjVtXXb5KRvdpzmvTpLjXBmwRIswyaP?=
 =?iso-8859-1?Q?rRIWrnHsEu1KM/XpCs0PzRzlUNuqTUiBA/TGSFs+GpoZ1epkX6/YsfjvVw?=
 =?iso-8859-1?Q?CUYTdxylnik8/lEIWD2iGl3aygTLqdYr+zEChwKUvtgyYGJQ1V8mBTxy+3?=
 =?iso-8859-1?Q?VpDEY62mnFIptopv2FsNd/VmEf6bV4UuOhqBshJA0AQi2TuCHuY2SwraSU?=
 =?iso-8859-1?Q?wGoDt8oiDx+YyrRvC3ZbcF+3yCgwc1w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b949f6b2-eeed-4e42-fe38-08de4e2cfbd6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:40:24.4941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JI63912T3hZxVeIENrj2nah7windIe/qs2GmYmUetiS1/idx3WhjKjmTNc2goBWyCYp4GtpDdYMlVW+wlJBRlXN8KQO0xvyw6tGWqB/pbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9038
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

On Wed, Jan 07, 2026 at 10:27:15AM -0800, Matthew Brost wrote:
> Avoid unlocking and putting device pages unless they were successfully
> locked, and do not calculate migrated_pages on error paths.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 75af93b3f5d0 ("drm/pagemap, drm/xe: Support destination migration over interconnect")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/drm_pagemap.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index ba099aa7c52f..aa43a8475100 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -582,7 +582,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  
>  	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
>  	if (err)
> -		goto err_finalize;
> +		goto err_aborted_migration;
>  
>  	own_pages = 0;
>  
> @@ -621,8 +621,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
>  						pages, pagemap_addr, &last, &cur,
>  						mdetails);
> -		if (err)
> +		if (err) {
> +			npages = i + 1;
>  			goto err_finalize;
> +		}
>  	}
>  	cur.start = npages;
>  	cur.ops = NULL; /* Force migration */
> @@ -646,7 +648,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  err_aborted_migration:
>  	migrate_vma_pages(&migrate);
>  
> -	for (i = 0; i < npages;) {
> +	for (i = 0; !err && i < npages;) {
>  		struct page *page = migrate_pfn_to_page(migrate.src[i]);
>  		unsigned long nr_pages = page ? NR_PAGES(folio_order(page_folio(page))) : 1;
>  
> -- 
> 2.34.1
> 
