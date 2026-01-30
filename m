Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ58KtkqfWmEQgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 23:04:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA03BEFE8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 23:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0F610E0FE;
	Fri, 30 Jan 2026 22:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMr8XvLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A26010E0FE;
 Fri, 30 Jan 2026 22:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769810645; x=1801346645;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NEos++XaS66xGfYpMRZy4SvkFeA29OmOex+HxSJEh/E=;
 b=CMr8XvLYPq9zphxVs3t1MAQbJKwo2HgM6murG6z39ZMSdDc2tu9Ep0yw
 muY/wW7DDJ2SjvB3HjkBeUD1j6IchOlxo0Pnal9Y8B4wU7bzI36ZbJOBM
 rVZjxNC1WJ5e/SW7lYbm/Qlv5Sr9JF1fvveixbO8HJ6Y0Q/WzY9OJ5t3y
 g3N6yW67CAKtdqAOFt83GVaF5XBKH6WybBnqk6rMVnHQPvMpcdG4cxdtC
 qa54w25zT/uAP1B/CzKIWYrH9JbqRlgOB/xImvReB47FARI7x+Rv/ALhS
 H7R3EBdi1V0IXJo6hnLeOGCDvuxMXj7Xe6JN+ix461plwBp2IZWzXqBPL g==;
X-CSE-ConnectionGUID: CznjDHmARCCva2pMwZJ4bw==
X-CSE-MsgGUID: lhNUG8ClRpiNDPaIq1bFbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81799878"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="81799878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 14:04:05 -0800
X-CSE-ConnectionGUID: t6t9cOX1TEeaZdDZc5muPg==
X-CSE-MsgGUID: /W63bj/JTp2GO8FW8i0pvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213458235"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 14:04:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 14:04:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 14:04:04 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 14:04:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRkZYpUNYkttWe65NEUxqdrtmd8lnr9XBhxMAD5RU0TedM+Uzdmmc7z3u7IUPoTi9NboV2uiB7j8ujwIbITGfu2ebn/syASo6AGoUoXRR9b5N5dei+osnWKy1IfMcXb91iW99zbyd0qRaMALkoQXC/lmwVhf5qwBvgirApsnn1xWxsVf0kNDBmoLib5u9aLXiamDAAlAzAc9obrZjBjBQYhIKnYaEWVIPIxJRuFNX17VP1TpIZw8+p7bEDE9XZnJ29FYVUjw8WlA75d8NoGHEqsDav+tw1E/Bmxcx7FF556Cpm6oCbLlyfoFHG6uD3EaAEsuIXvep41WFsUF79jjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWMG6qJ+NwLSJDYxvccH47sE6zPzT6WdQWUvdAd4VU8=;
 b=cpvNtZhRGrF3PkTQ5vzqoCGL9QuWC9Gjc0zl9Zd+KkZxeAE/sTPDJwWJGMZ3HjcjMNNZZZjDqP8NdA62jzgsUFs2etB1ipDec6OsrU4OUk1bvPlcr9lNyoebhZsnjgQA/17LRmucQJ6zMZ0Q7caC3Lr85sPLtNCT0NiYDgOuqBEMfc5w8ZCUhyzqSeX1WuFtFg3+124VrQSOBI/hYqgEPr3EogVI65hhoSWeaXhv1ZCCNq591T4reOGDng9KityFOACP5IS+jh0hMdnCF2Hd5HSY6xmBugwyRHgkXKqjG/bNpcEViOs6Bu8EZdl+mWqTK+GNVYtK+8RkaShroOjTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6134.namprd11.prod.outlook.com (2603:10b6:208:3ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 22:04:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 22:04:01 +0000
Date: Fri, 30 Jan 2026 17:03:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Message-ID: <aX0qzAHieOEAyD5w@intel.com>
References: <20260124145401.44992-1-marco.crivellari@suse.com>
 <20260124145401.44992-2-marco.crivellari@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260124145401.44992-2-marco.crivellari@suse.com>
X-ClientProxiedBy: SJ0PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: a4aeecf4-6e35-4017-0479-08de604b79c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vqqaS6AYOMNXgUQd9kwTo7CVG6YZmnbrKTiqIy36t66N66bc7IEw5AkcGGPC?=
 =?us-ascii?Q?jsbxOuVoxDQZHNkxkEcvmdakzszuccr4tQWAUCZfJyhimXwS1CkbgOqJJvme?=
 =?us-ascii?Q?byw56ayoDESV1DK5oYCpOUugDiwNCACWG/46q4EHoUJzwZS0on+fWtWsnw8N?=
 =?us-ascii?Q?ssz+M9pwwYVj6fpB+yLtOnUleEjxu/N4dn+33YIfBTgTSCQz/zQWeSypSDqI?=
 =?us-ascii?Q?kpjzrkJtBbHa7MHFBpFXqxxseQlmdcDqPhRJvSme0O8ZKnG/DiPnUzXX4dtm?=
 =?us-ascii?Q?9RINUSjQ1F9KeffZq0WB3iIGgglFft6uds/CTtJAsFpH5lBcdOUev7zDizdk?=
 =?us-ascii?Q?IHNinr+BZqbKZcOOCA12NnUWTV+gBoFMizeOMVJ21Hbb6uviYc8PZfqY4vnN?=
 =?us-ascii?Q?Zfq1sqXmXnmZiS2Y2sRA5BBW24c/TFLBahFqemls/RbNwPEZF5F28riPOUQG?=
 =?us-ascii?Q?8jJu8DvvBh4qWVWy+DP0DUoBCdf3ytBUT7rjawbnNjhdo2FM/03b8tvn7GuJ?=
 =?us-ascii?Q?y765vMl74rYRf09yZdJDO9ZUAlIxaLN1w7wSGiVbCMYhnyCUFvGZLDid2aIw?=
 =?us-ascii?Q?kjx8v+DKYyMm1BJSsMiYu8QtXki/0sKd8vGEz3CetLLXnt+cum32wrgdgIbj?=
 =?us-ascii?Q?jWFSmPHbjsso8mKnhYIr8wcqQMiawjDvkCpBIvDhJEQXYPcqJVgm2YtxUQbJ?=
 =?us-ascii?Q?+xjxFGQTkmSUXXM30cu0iW9jkhNLD0XZxnkVB6UNHGLEs9c+pjxaAZmt9EaY?=
 =?us-ascii?Q?qq+5DDqTgY3akBqCEXUogCyXrc7hexPkyF3Ll6FOjw+V6XE4pY/SOuHcpz3r?=
 =?us-ascii?Q?TSjkBjg00zHLs756OlN8v51IqX4Em6pWSB901IlLspZ/TsyTUyw8/1Uwpy0o?=
 =?us-ascii?Q?d8FOHPsimuocMwOWvCVtI4DlReS+z73Weou578EeH0g3xIhc6RbmJv/BGl7l?=
 =?us-ascii?Q?tXUGGFrOb7PXE02Ws1F8nPWvW/mQgCLBq6NOs3tIZhIQ4+k+BUUe1ptUKH27?=
 =?us-ascii?Q?Ffsmikb0QwNDgVjqH6chisLgKkXhg2yhd1JRraiH48NjAXrhIM9wrb9UsN2j?=
 =?us-ascii?Q?BVQe841e1pVykyZQCuP2kKQIz6xQbRM77d1t3jr4EJyCeMvz3qEaxEiHDPOT?=
 =?us-ascii?Q?bscgTPGieXfHzDyvxQXPq0r49CWkhNPNBTmhtHhADLbUrlk7cEMVlXKZ/9j4?=
 =?us-ascii?Q?GNB3cj05oEN4VFrYs6/rlSDWCXm4GOOh+kHRxWTlqB6d0HPelnsITHmUHokJ?=
 =?us-ascii?Q?2Rp0BWwXIW3U3a+q4luIsZrVDBf66PafUsRE0NwO4ocN75AOPPOJNmy1979l?=
 =?us-ascii?Q?qUBSXN9bsvnKVJn3ovOsAgCedLqg1pdi1dcJGxtjEDDvEXylKR01lGcEuvuO?=
 =?us-ascii?Q?rdoZGfdrKnpWRvVwEDPHEuCI9WYlSfwLvrZvyuiKHqiEBMWC+RYxVR1mWM5e?=
 =?us-ascii?Q?Es8Nm4SGMKY4N+yLXuweULv1FFXKgBU3eHFVmpIOaWH3a4oxamhtJxu+KDO1?=
 =?us-ascii?Q?E1HYKZt7mCSosXbpNeP/mJ+Pit+JoRiwnNPfj83h5LKSN23TMPgoPLomUjTM?=
 =?us-ascii?Q?JoyR6vAp868/vaxOF5gHnq5JlfIey2SHVxwBhXeE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N+TpVvMhuMRRtCGRxuPW0XGAFmlxy+/wWXmKjkNDIgLV+zzTShZJWo7kG9X5?=
 =?us-ascii?Q?HJXJU06b3W6AE442Xq9pvWotFIhlrxLF1Ai29+qzVCp63nwVZ36sBm7Zdrtu?=
 =?us-ascii?Q?29dxFB32XUC4BdYneIUcoHzmK64m4p4SauKmOzQ6k1WKMrr4NZc8KSjzhvIl?=
 =?us-ascii?Q?wiEFRyeCd1xE/3YHd+QyaC36v5C5LEwCkWthDOqUa7BLyJQSDkcM7eXPoqNy?=
 =?us-ascii?Q?bv2FD5OPN2UAolgANvQfEEtdJp5mpC58r0zp6W8vqkQaGHTMBBNg4gZaYQtB?=
 =?us-ascii?Q?2XHnIwzd3bXnkAmnkeLa6/vaGY4BQGT4J0qYeG8RE9ghEylqrVsH09HfZV1S?=
 =?us-ascii?Q?fdvdloQLllE6d0rq/nVHfdXufTKwbfkEDn9honADKKgZbHjKOzUtsh28mrPl?=
 =?us-ascii?Q?imTIq5H7BVqlFvtjTTutxOWfPgB4RRwEZ0XXOMxhHC1sOhQJ3vIvOuX3bz0V?=
 =?us-ascii?Q?zIhfftkcbXkdGmteCrOFGsSvP3tpzbDru1B5CwIx2hkaDi9OQqgwkJgl0fHJ?=
 =?us-ascii?Q?7C54PnIeXQVxyaQDxmZFeKW8IMDVO1S6muFZfYgCteKBU15AoS8W9aIuSI0p?=
 =?us-ascii?Q?F6ZL1eJ6wcNrVucXgls4sHslDt3jw+pFfu3gooQ6bJtO7s8GpCZaWud2LmUu?=
 =?us-ascii?Q?dHlgI/WhN1sxVTwq0/MCFNAanMOLtUlyW5VtVqa5HwCl33MNR5LXV6m5KY8c?=
 =?us-ascii?Q?kLTIJYTMcfdc7pzvR3f66UNOlxu1H0cWaUUg5of+E/mF0NczTb6qJx+tlyKB?=
 =?us-ascii?Q?ZZw+eCukIIEllbWix25kAa9eZU4wg0SBE3tkEkDUzQ68XQitej5bQqbcl3tz?=
 =?us-ascii?Q?OC7jI5lBw37v2oviCRhQsAAyY/abYvJWQ8o8rE3UuvLPsvg7f9Nck2oxmsSh?=
 =?us-ascii?Q?q67tshDxqAXZR0WB5Qf7NmQzfv5MT0X1SWH/KnzzlR9zXMRf/GUpIojijzX5?=
 =?us-ascii?Q?sHawbNZH89/EtAMAQgnrcXsDU2S03DDTRj+Zv+hkrRXl/cBUgTBm6ZFWxopV?=
 =?us-ascii?Q?9TZo9Qw2gDb8IOubQ9MGbxjtFnCWDGvXjTWX2S3C+CE2+x+MqPD7/ZnNLjeT?=
 =?us-ascii?Q?vF1CQmNEJLtAmHgiBJNDQdfpcj5Ly2FiMc/0HPZv31iieTeNdYo4TAL1Ya6H?=
 =?us-ascii?Q?B4DcduW1ufIE0gWOKTpZcXzswAOCkREzsm1KBBZGyUVouHQA9wD/8eJ37dzZ?=
 =?us-ascii?Q?nSLiKoReNY80GVZGhTXHFrjgCMLFg+vWZZCaM0nasHrPy1VRY+Gk5cPndi9w?=
 =?us-ascii?Q?WCvjI8Zr/MWGhOYBA8pq9/83RDrVeqni2XrPKUxaI/bO88u3WcnkUbDSmBq3?=
 =?us-ascii?Q?KC4l6yLzMi+cZjnK3u0msIRNjTZxZvUjP/+90nS7r3M8YPIZjQRiDpeUTuWe?=
 =?us-ascii?Q?54ggcj91ayH3N0IohdUmig+jyDierFxmWemsk6X1ak4mjU1lzPf3t36H8dyB?=
 =?us-ascii?Q?UIJCcNmT9h3vD3XQ+bhEVSGNFF6WgOLTSVjNwS9g46LlszAkcRzI1kUftLa2?=
 =?us-ascii?Q?iGAvAs/7Agd0JHK8erNnssWhc7wSwCsOM5juKkWTQgG0C/uq97DM5MkUgyfw?=
 =?us-ascii?Q?ZIISMLeoCfjR2PNqicznCy/6tvX4d+B6755yITe4RT9JEta+qjTJaT7YlVnb?=
 =?us-ascii?Q?WN4TxKU3ktoaaLJWDTceu9OmpL9zK9uV6bDe+DPWueh8Ii92P0VehAHh7yWc?=
 =?us-ascii?Q?n/EX9c3DSpRXoy3xcKkGEcfyT+VcXyHXvuQDNgDlvVOwEkKmVpgvwL8Ui8mA?=
 =?us-ascii?Q?5fZUwejCfA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4aeecf4-6e35-4017-0479-08de604b79c7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 22:04:01.7677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZznvxmI1zWhDNxnnIT6B/knn/ZZTGMHIszCXWeKaYvnOUtuY+9INdnFGuYDm9zFiYGixDk7VVEuJlaQVkkIXHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6134
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0AA03BEFE8
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 03:54:00PM +0100, Marco Crivellari wrote:
> This patch continues the effort to refactor workqueue APIs, which has begun
> with the changes introducing new workqueues and a new alloc_workqueue flag:
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The point of the refactoring is to eventually alter the default behavior of
> workqueues to become unbound by default so that their workload placement is
> optimized by the scheduler.
> 
> Before that to happen, workqueue users must be converted to the better named
> new workqueues with no intended behaviour changes:
> 
>    system_wq -> system_percpu_wq
>    system_unbound_wq -> system_dfl_wq
> 
> This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
> removed in the future.

Thanks for improving the message.

Could you please rebase on top of latest drm-tip. It is not applying as is.

Thanks,
Rodrigo.

> 
> Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 2 +-
>  drivers/gpu/drm/xe/xe_execlist.c    | 2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 4 ++--
>  drivers/gpu/drm/xe/xe_oa.c          | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c          | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index d444eda65ca6..6b47aaf8cc9f 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -362,7 +362,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  
>  	xe_engine_snapshot_capture_for_queue(q);
>  
> -	queue_work(system_unbound_wq, &ss->work);
> +	queue_work(system_dfl_wq, &ss->work);
>  
>  	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>  	dma_fence_end_signalling(cookie);
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 769d05517f93..730b600a5803 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -422,7 +422,7 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
>  static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
> -	queue_work(system_unbound_wq, &q->execlist->destroy_async);
> +	queue_work(system_dfl_wq, &q->execlist->destroy_async);
>  }
>  
>  static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a5019d1e741b..351c9986f6cf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -558,7 +558,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  	spin_lock_irq(&ct->dead.lock);
>  	if (ct->dead.reason) {
>  		ct->dead.reason |= (1 << CT_DEAD_STATE_REARM);
> -		queue_work(system_unbound_wq, &ct->dead.worker);
> +		queue_work(system_dfl_wq, &ct->dead.worker);
>  	}
>  	spin_unlock_irq(&ct->dead.lock);
>  #endif
> @@ -2093,7 +2093,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>  
>  	spin_unlock_irqrestore(&ct->dead.lock, flags);
>  
> -	queue_work(system_unbound_wq, &(ct)->dead.worker);
> +	queue_work(system_dfl_wq, &(ct)->dead.worker);
>  }
>  
>  static void ct_dead_print(struct xe_dead_ct *dead)
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index f8bb28ab8124..c8e65e38081c 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -969,7 +969,7 @@ static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
>  
>  	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
> -	queue_delayed_work(system_unbound_wq, &ofence->work,
> +	queue_delayed_work(system_dfl_wq, &ofence->work,
>  			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
>  	dma_fence_put(fence);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 095bb197e8b0..ddf0a9567614 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1091,7 +1091,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
>  	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
>  
>  	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
> -	queue_work(system_unbound_wq, &vma->destroy_work);
> +	queue_work(system_dfl_wq, &vma->destroy_work);
>  }
>  
>  static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> @@ -1854,7 +1854,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
>  	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
>  
>  	/* To destroy the VM we need to be able to sleep */
> -	queue_work(system_unbound_wq, &vm->destroy_work);
> +	queue_work(system_dfl_wq, &vm->destroy_work);
>  }
>  
>  struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
> -- 
> 2.52.0
> 
