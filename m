Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BD8BAE4CF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 20:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3B610E632;
	Tue, 30 Sep 2025 18:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYCwlAdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E12A10E00B;
 Tue, 30 Sep 2025 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759256726; x=1790792726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4Uu6YQCYBxP+70OgVSB8a6++VagFy9rKhIEOoCCrbDU=;
 b=OYCwlAdY26M0tet/guzdZT4aNbPYLusexSvbFQwabMPOEWtVtAbpbkzj
 uu/JE/KcEUMwb2cwJhQ6jK9yCaflAiv8nVRSg98SENSlIBlSlJlSeZ1bz
 3c9H0pq4LgBQEoFaFMYFDJujg4ojzfWzyJwUyiQnibr2DE/NfispT9N9E
 ImPJj39iZ2zmL9OQ2nHiOM4TKovPnRy2KVuHdQegFLQwlLhMdsBaWamZX
 1XCzvHahvqFRcY65jJ6YDzpseNqEE0HSnqLfdW374CIkKh0L3Kxce7mSs
 ie2SLDV8cDj7sZz6fdJ1lIARGRrzdlqNy652D0zmp4yjeBkVOBau0KI0r A==;
X-CSE-ConnectionGUID: 0IHDG3S2Q9m+c9GVKWoeVQ==
X-CSE-MsgGUID: bWnJ+QafTySMsB2cmokW7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65162852"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="65162852"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:25 -0700
X-CSE-ConnectionGUID: ILRiDgsDRj6ObIHdwPLeTw==
X-CSE-MsgGUID: OcU+mG2MRVK1JVICPMeHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="183781702"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 11:25:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvXRYSK6Os+nruPZdgEvweD2KOClfIM+Vfps/X7JkMFf26KFjouGlBzVQdwqx4SwjrbCQNXv/xdFQmSpb98FagExJlMBvcgCk5BkoQ1Qa5HotFyG1eo9PqECsOdZy7lBVSkfg283Rc9dHpIUN7J96GGax04VXs2dJeCWEbfJH2RfEmX6x8/b3XAMkk300BeLLpo5I5pXYdsRBdGi4cbXLvpXrxgV9Fhn1HQX7tnDCCXGoZgdCnwlszUc6z6f/4ADilM8N1E5wHD/qyMPDXw3qBt0faNsXE5yzVdKPl2rYhxX5wEIgaWatmu+UanX0Bq9th/fWv/0cnZx26yELrLYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJHdVGi3YhiZF2rnZBbiMU2Pfn6darge6KyBVk+esvo=;
 b=FIRRsCdbOfMfcGorW7Cj0DD/hdSdpeyaFDnGJC9kG3xF5CFkOp9nzHFalURt+81mduo6HCpOrkTZueJTszQlFohwJICUeNxh+NW+n2LaGh49NqRJY8isZ1F2UI/FyXvvQSOeOCDTugeNr96xn6JEBC9BM/iN1mQ+tb9dZDz9yud+GsULh6tBjpi2OeYHn8Dz7aBCPCmF1bVZqmC+8nL25Gklxwpp+PBUvCc1LKtaWMGBHNvg0yx8zHaj67A5Q9F2DCd1oC6daMMzjsYT6696zTcf6084DJp5MtiYxQJaSYcjDiu4MjgTBdTVBmauLB78l90kQKNLgD0GpGdIoS0eXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 18:25:21 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 18:25:21 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH v6 5/6] drm/i915/dp: Verify branch devices' overall pixel
 throughput/line width
Date: Tue, 30 Sep 2025 21:24:49 +0300
Message-ID: <20250930182450.563016-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250930182450.563016-1-imre.deak@intel.com>
References: <20250930182450.563016-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA1PR11MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9e1fb7-75ea-437b-4f9f-08de004eb744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWxrdmRrNzRFcmdjMlFoNWVrclJCWUVybGZIczFGeHdjUnVmMTRQR3lkSW5N?=
 =?utf-8?B?VUl5OUtQT0pYbWRMZnVwR3kzSGMrZURXeTA3aWRKN2NSTlBMZU40ejJJYXUw?=
 =?utf-8?B?ZVBLTXlaZkJBOHA0Z1RsUkZpdmVaNm1NWFd2R1pkS0VsZGU1LzNSTU1HSFB5?=
 =?utf-8?B?K2t5dmYzVXpTejJtNm01emlNZkhvZ2tUTW94U2wwa2ZNNkg4MUNwVmozc0lx?=
 =?utf-8?B?THY0Mng5SE1YMjhRVlk2cU16ZStXMDFGSHhqMHc1N21HZGNyaUpUb0hUdXdP?=
 =?utf-8?B?c3pVdXM1RU9oYlJQRzVOTEM4T1lwV2cxL3JXdW5KU2J0VlJ6SE10SzlVWHUv?=
 =?utf-8?B?NjlrNWtlTkhERWU2S1oveGVFelZycVBnT2MwYytWRHVpSVVsRlRtS3RjaTRR?=
 =?utf-8?B?eUxjaVBVM2hLeDAramF4WGZqcnBXMDhvODhURys3UnI2bHB5cXRLd1dQeVE5?=
 =?utf-8?B?Vm0yRkJhdDFUZWFybjRscHV2aEdUdllKbTJVRWhHb3ZJZStEWDVSN25LZmZY?=
 =?utf-8?B?bGxsQ3d0S1c5eFNFcFZuVENwV1pTTWNVUUVSQjlRcytsYmJQT2tzTUFROUE1?=
 =?utf-8?B?VmpWMENNamZhYllKUnhFcUJJRzZINEEvdTVTd2ZOUi9KdVRYaUFmbUFCN3B5?=
 =?utf-8?B?L3lDR3p0S2JubEwvOU5kaURxR1gzeTZ5VEdLMnFwUzFMVmVzVGhZMktpTTBJ?=
 =?utf-8?B?YlExSHVOOTBodDl3Uks0cllKV0lucXZzRkVuU1pQeml4eGNIeGxJYkxuVG8y?=
 =?utf-8?B?UFB2Y2YvVWh6aExkQm1sRFIwT0xYaEhZOEU3dnU0TjVYb2FHdTYrUlkxY3M5?=
 =?utf-8?B?ZkUyZXVuQkZKNWNCMlF1Q2hIRk1TQnIwc0ZJY2hMNmZYb3FTeHZSTm95clYx?=
 =?utf-8?B?ODZYQ2ZpYldUR1FOQzVPNzhQRk9vNVRCTmVGaDZGWm5iUXZ3Z1RpdmY3Z0Zl?=
 =?utf-8?B?RDZtVU1uakkvTWkrZFRFOWs1bHJoTVZMVUdubEgwaXg5bDIwZ3p2cmdLVW1F?=
 =?utf-8?B?NDYxeWRyZFRoMkVDVi9XWjJCcWpWU0lzNUF6QzgvVExITFNWVDFQeThBR3NJ?=
 =?utf-8?B?T0FFSC9PdktHY2dXYXBic3A4eFhOMVBMYXpOSXZsWjNwbzlHNldkUHo1MUQ2?=
 =?utf-8?B?U0RQUlBIOUhmU2NwRngzaXNkNnBkR1NXcWtvbG9PL013OFdxdzY5QWZUYVYy?=
 =?utf-8?B?S2c5ZEdqc20wL0pacWw1cERWekkvL0hDcWJuRVoxWlV4dFNXT2J3S2hQajRH?=
 =?utf-8?B?TXdxQ1EwSVR2ZWgyV1dqUWFOUkxYbEdiTEZmdFJydFl2TDRhYkMvWGVVQ0x1?=
 =?utf-8?B?RDdxWnBjMXFwalFRdjZid0ZzNkx1bi9LWjROYnB6ckNnRU11cno5VmYwWXhY?=
 =?utf-8?B?RURDVE53ZXJJVGg4cHd2eWczWWp6aERWUzhLZG9UZHJ3Q1FJRytSd0d4Q1Fs?=
 =?utf-8?B?eEVjRk9wcVhzR3JNQzZMTlNpcWNiZHRqWUFmRTU1eXA1c2NqWFJPV2RRYW1N?=
 =?utf-8?B?UFRiVUNIaFVVbDlqVWZvRGlReS9leUpMay81MHkzVURnS0M0ZVZMMnpLai9z?=
 =?utf-8?B?ZEthT2NnaUVpbytaYy8zZnVuZW5DNFIrVmg3byswNzhGQU1YYWMvTE1yek1t?=
 =?utf-8?B?VnBCQzFUSW1Cai95VmtDT1VpZGtoaEFhL0FmUXBkKzhZU3E4UGFrVnFCOTdK?=
 =?utf-8?B?Y1ZQdkVHQ1d6WWRuM2s1S2ZUM2lFRWkvY1ZYekVLMUM0R1BsRXBaWmFMdEwx?=
 =?utf-8?B?ZGFrU2JOc1p0N3B3U1RqcnJQdDZ0aGVTOVNVSWF6VmdjcTcrVmVZclVPT1Bv?=
 =?utf-8?B?MUxET3J0azhMek5NWVZqWWhMeHpucm4rc3o3NG15YjN2VlljdVcvQ3lhRWow?=
 =?utf-8?B?S3JDSmh2V2RwRzdndUQ0MGM5NksrS0phRzM0dWJXZlNrckRCcFpacldWdnk2?=
 =?utf-8?Q?GJ3G4lz6R8U5ux5v3U7bD8TrusNNEJbl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2tVWFJrVU40Y3hYRFpSL1NEYm02azUra2dZOW1MNjhTYnU1UGtxSkYxVHo2?=
 =?utf-8?B?YjNjUFlpZnNzU0hXVDl1VTZqTTZLRk0yTUcxaGdsQ3orcGpLbzFDMkZCREQy?=
 =?utf-8?B?OUNxbkVXbkNXVU55T1dJWWpqeFpkWklTbnRBMXJML205czB6enNKSzhMN0dE?=
 =?utf-8?B?a3o2VTFIZGcwcDFVYUxZZ1F6aGRvNVJMMzdXWWQwY3RlQ2k3NHZNMyt3RWIx?=
 =?utf-8?B?Q3VUNWRTWWRjbnVOQndINU9UL1FwOW1BQ01GVU16ZGpVa25rVlRaa25nck50?=
 =?utf-8?B?TkJZanc4VlZaZFI4M0dFbm9DUWVaZ05nTjdxSXkwOXowNnhYUkFaRitNYWhU?=
 =?utf-8?B?WXk5enVsdzV5bjNtUzQ4aXRrZWpHa0hKcGs2MmNxN3hqL1VBWnV6K0JqRy96?=
 =?utf-8?B?d2psWitNNzN3Y2RCVHhmcjQ3a2FsV0gyc3g2L3NYUXNWWGtnQ09UWHJLOEJZ?=
 =?utf-8?B?ZmFBbWQ2T25tMVFzVE81ZUFhbzIxQnBTa2Vsb0o4UHFxYVQrRzZvTDdGc1Qw?=
 =?utf-8?B?ODg0dVJFbVlIZTIwRnltUmNYS2xOZWFNWjJ1L1F5RkxCWkc2dm9lUCs1cHhH?=
 =?utf-8?B?SkJFMHpnTjVsU2Fob0lTMWpvdHRTdHk5S3Q4cjZzZWZ4MnBkTXJHZGRxbS9a?=
 =?utf-8?B?ZlBkWGhrK3lqRDBSSk5naWoySVEyVHpwMGpwdUJleDA0MjdJRUtaSmV3TzBD?=
 =?utf-8?B?TncrUlRZanN5cE1yTHYzaVd1NTNhWjJFZkFvUFY1QnNxdit3NzZBMFdabTha?=
 =?utf-8?B?dHhXQ1J6dnZWTVVHR3NCeXoyYkp2cTh5TVJxZm9Fa1pqMUZPS2ltR0w3SXZ1?=
 =?utf-8?B?aEw5QXkrelhtSXlsUDhuUE9SbTY1VUdTRWZYcFU3cGprZkdzbE9Dc3JveUpa?=
 =?utf-8?B?UnROT2gzRTRrK3E1WUhEeWpOU0o0QXBmTFpzSDQwSXNYYWptUHB1ZVUrVTcr?=
 =?utf-8?B?c2hSbkxtL25nWk5za1JFYUUzNEp3V3UyUEdzeG5OajFMM0I3bEZ0L29vcG56?=
 =?utf-8?B?cnlzaFlLQnpUL3NRN05EUjI4NDVpWnpLV1lFc2d3dEdMcDV3NVNvM25RbmYz?=
 =?utf-8?B?QmdnVmduQUM2K2ZUNklsbnR1UCtKamNJV1paaVE2UllHNVUzVDFUNW1tT2sr?=
 =?utf-8?B?UGFOMEZWdXRpZkk0aTlpSFpsNlpJYnlBR0FuYnZiU1Z2SS9uUldNalgvWkZx?=
 =?utf-8?B?ci9sZWFpU3JCdjBaNk1mazl5UDJLYmVyeURlSEVkRXlYczNiWjJNVFFXeDZL?=
 =?utf-8?B?cFRBeEFVaGpXT0JDQ2l3RTZVREYxTVFwaGZrV3d0NXJNZnZZSDlhYTN3RmZn?=
 =?utf-8?B?ZUpmUS9RSlFSZDZGeHVVYVpmNnl2TGJNNlBHVVpDSmJGenlnVUFYblErZjA1?=
 =?utf-8?B?Y2xpODFxSmllRlRPdmwxc1JXUUM2Yk9IVENHWnFUQ0xxTFZMbzVqRkJEeFRh?=
 =?utf-8?B?anQwZGYyTE5zdWtCSXRyYUdmSXFzanlRQTlIWWtCT21XaGVsUXh6YzJLVEJ2?=
 =?utf-8?B?MHgxZGVra040WGs5WnBmYWxkRE1kK3VJWkdhSmtmK0hiZEJvV2Z3NERrN0NH?=
 =?utf-8?B?WjVnd05tRms1Z0pMMkdIeHEwYW9wUWxuK2xaa2V5RXp0M1diM2xHY0ozYlJV?=
 =?utf-8?B?QnBxZHc0WHVBZkNCMUJzK01xQ3BUN2o2VjkyYWZTL01PV2JnZ094bzVneXk0?=
 =?utf-8?B?QlB5MXZTb2s5M3N2OUNQcmxYT0tDbFpHMzF6aDlPUUFCMVVxT1hUUzZ2YXNO?=
 =?utf-8?B?RDhvdFZacFl0dHdCQWdUSGZpMlZJeE5SUkgyYkZjK0dhK2t4KzJkcG9vZ3cz?=
 =?utf-8?B?ejNYRTV4dXRqL01FbzR3R3Z5amlZNFg3VlBlMUpOV3lxRlIyTGIvSm1tYVlV?=
 =?utf-8?B?R0UwK0pVMytMWjJtK3AxSmJ6amNyY08zOEJJcVk1dmVNMU9ZMmdOcUd5Tzdy?=
 =?utf-8?B?NDRhaTduTlJ2WU5nK0F2QWVkd0xMaFRmNjlQN05RTjZsWHhYOFRHc2RBOWgy?=
 =?utf-8?B?bWNwaVNBNkRwamdPbTcrWGpWckk4dkgrem0rWXJxMmJBRTlQajN2TEVjcXB6?=
 =?utf-8?B?cjB4WUFQVG10UEFKSkE1RXdqa1YybmxHM2NCOTRhcS9ibWdnMk1JNkxQb3Ix?=
 =?utf-8?B?K3lTeFhrNnQ4amhwWEJ6aXI2TWVxRUVWREYrYzVqcjNHb0tzOHhiZjhqUUdX?=
 =?utf-8?Q?2aS71Ku1gmFSMQf9nnY7g1SIFMA+cAH/4YH2c9Z4Xdd6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9e1fb7-75ea-437b-4f9f-08de004eb744
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 18:25:21.7156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWNDmoB47ETieqrBXK93TLt2VrRHV5zi7Thsngg1H5PQl2hKVKZzlRknnfDMXWRLjdYlF6B4fLBnZyIeG5CWOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
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

Read out the branch devices' maximum overall DSC pixel throughput and
line width and verify the mode's corresponding pixel clock and hactive
period against these.

v2: Use drm helpers to query the throughput/line-width caps. (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reported-and-tested-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  8 +++
 drivers/gpu/drm/i915/display/intel_dp.c       | 51 +++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 029c47743f8b1..99d2c31236928 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -552,6 +552,14 @@ struct intel_connector {
 
 		u8 dsc_hblank_expansion_quirk:1;
 		u8 dsc_decompression_enabled:1;
+
+		struct {
+			struct {
+				int rgb_yuv444;
+				int yuv422_420;
+			} overall_throughput;
+			int max_line_width;
+		} dsc_branch_caps;
 	} dp;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2dcc20bcfa0ba..9de9356302f97 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1016,6 +1016,20 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 	int tp_rgb_yuv444;
 	int tp_yuv422_420;
 
+	/*
+	 * TODO: Use the throughput value specific to the actual RGB/YUV
+	 * format of the output.
+	 * The RGB/YUV444 throughput value should be always either equal
+	 * or smaller than the YUV422/420 value, but let's not depend on
+	 * this assumption.
+	 */
+	if (mode_clock > max(connector->dp.dsc_branch_caps.overall_throughput.rgb_yuv444,
+			     connector->dp.dsc_branch_caps.overall_throughput.yuv422_420))
+		return 0;
+
+	if (mode_hdisplay > connector->dp.dsc_branch_caps.max_line_width)
+		return 0;
+
 	/*
 	 * TODO: Pass the total pixel rate of all the streams transferred to
 	 * an MST tiled display, calculate the total slice count for all tiles
@@ -4180,6 +4194,33 @@ static void intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
 		    dsc_dpcd);
 }
 
+static void init_dsc_overall_throughput_limits(struct intel_connector *connector, bool is_branch)
+{
+	u8 branch_caps[DP_DSC_BRANCH_CAP_SIZE];
+	int line_width;
+
+	connector->dp.dsc_branch_caps.overall_throughput.rgb_yuv444 = INT_MAX;
+	connector->dp.dsc_branch_caps.overall_throughput.yuv422_420 = INT_MAX;
+	connector->dp.dsc_branch_caps.max_line_width = INT_MAX;
+
+	if (!is_branch)
+		return;
+
+	if (drm_dp_dpcd_read_data(connector->dp.dsc_decompression_aux,
+				  DP_DSC_BRANCH_OVERALL_THROUGHPUT_0, branch_caps,
+				  sizeof(branch_caps)) != 0)
+		return;
+
+	connector->dp.dsc_branch_caps.overall_throughput.rgb_yuv444 =
+		drm_dp_dsc_branch_max_overall_throughput(branch_caps, true) ? : INT_MAX;
+
+	connector->dp.dsc_branch_caps.overall_throughput.yuv422_420 =
+		drm_dp_dsc_branch_max_overall_throughput(branch_caps, false) ? : INT_MAX;
+
+	line_width = drm_dp_dsc_branch_max_line_width(branch_caps);
+	connector->dp.dsc_branch_caps.max_line_width = line_width > 0 ? line_width : INT_MAX;
+}
+
 void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 			       const struct drm_dp_desc *desc, bool is_branch,
 			       struct intel_connector *connector)
@@ -4195,6 +4236,8 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 	/* Clear fec_capable to avoid using stale values */
 	connector->dp.fec_capability = 0;
 
+	memset(&connector->dp.dsc_branch_caps, 0, sizeof(connector->dp.dsc_branch_caps));
+
 	if (dpcd_rev < DP_DPCD_REV_14)
 		return;
 
@@ -4209,6 +4252,11 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 
 	drm_dbg_kms(display->drm, "FEC CAPABILITY: %x\n",
 		    connector->dp.fec_capability);
+
+	if (!(connector->dp.dsc_dpcd[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED))
+		return;
+
+	init_dsc_overall_throughput_limits(connector, is_branch);
 }
 
 static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *connector)
@@ -4217,6 +4265,9 @@ static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *
 		return;
 
 	intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux, connector->dp.dsc_dpcd);
+
+	if (connector->dp.dsc_dpcd[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
+		init_dsc_overall_throughput_limits(connector, false);
 }
 
 static void
-- 
2.49.1

