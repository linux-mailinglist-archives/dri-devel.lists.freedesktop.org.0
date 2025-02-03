Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A0A26308
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724B810E550;
	Mon,  3 Feb 2025 18:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnVhGN1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8969110E54D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738608733; x=1770144733;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gC1spEBgEiukIlGHulgIYtuSd1BxU9cCT7ARKqJKPM0=;
 b=KnVhGN1b0s9rTLIjHTQwkhyQUJ5/z2hqc24OxS7/SWMhOfINbbmL2l4j
 AYztvl6EpjjIXF4/Z0Zt0IgtCxnF1gAHaT83RyOQknKnNVeRWeMXa8q5i
 UcHnCsr4iFOQqS8q7Z53ZwzDG6PGqK5XWQuac6d5sDwQkYNcy0iwlgkrp
 HXfBtZUZxrRmqx4C9E2+3mWkapKAO3WpXfOM0B7NaDh/lVk6hD7qkGgoK
 3YLds2mrruxqi5Fe36pXJNX1LDmHgnH/4W6PSQJi5rBKHWyxmF09ix45h
 27G5B3W/Yja2B7zKmOII7PK/5Fy9NvRyHxMoSm09W5EXMqf3yLWsm+6Si g==;
X-CSE-ConnectionGUID: ClfgcJuiSjyMv/+Ze51Vxg==
X-CSE-MsgGUID: jXbjUxY0TvaJi/Xn1sh++g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49370611"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="49370611"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 10:52:12 -0800
X-CSE-ConnectionGUID: V8xIG+UwSZa4QL9rpPcyVw==
X-CSE-MsgGUID: CWArwMthS/Ox3F2Kk5o+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="115355503"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 10:52:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 10:52:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 10:52:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 10:52:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udkWzMjfHoBUJzI/BFSZCNIweARn+2I6rRpZFwSe/DH8JNwVKcj9Mowj2IfYqKXfXBtG5GFjyyax2CUmxIgNbnGKJIRs1XqxrqKcY3H+UCdCt+tMy01GchA/FT9JAvTP1hGSGS79q2KhMm7TLIaYj+DsmEHlInUWmjNJADn4/l4f+pb0b52xBrbvo99m7mYxShNQLX5TDIEgFdaY2BRfyYk3rbaG5WazJk0l5M0I9aWf3CF4CtrZR/m2rxqBdkGD8whbbudlnXRf3odfds+Anf558qnku33/zEtsr6K6CHMPagZPE3KXN95TEY0rUwRdiY/g+dQWia0lj2vqEhPt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gC1spEBgEiukIlGHulgIYtuSd1BxU9cCT7ARKqJKPM0=;
 b=oTIOPFFL1v4wrks/wRvxWoJ6Nrb6cOoTDet5jp3/nE8dzQvdLNr0Xh2yCUfYfyfzLyHYjKBMHZ4GrbXTVwCO30oDg6+Lki7kr98hSSRXPL8jolzspg0h3C4YtZvdSPchVbarfS+tszuK1DP9Qa0kKZHZ1+raDYjUKAjIVJWzeTY6jv8fSMvJTonJNg1kblwRaExdW+fpTWB4MtOJgdltjqQ6nAzTkRjiO2jc8v9pi+diaBMaBw1VxrE1QLuSbdU0zwmCd2v1ciqLkmU3AutJFqz8DUHsIRZDEJPTuLwADAtpDhtvxC/Zz4nJI5D8wffZBPAH4ISt4hnQUxI2gW+DSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Mon, 3 Feb
 2025 18:51:39 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 18:51:39 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: syzbot <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com"
 <david@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>, "steven.sistare@oracle.com"
 <steven.sistare@oracle.com>, "syzkaller-bugs@googlegroups.com"
 <syzkaller-bugs@googlegroups.com>
Subject: RE: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
Thread-Topic: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
Thread-Index: AQHbXqPJOH13GNcGfkOlUnjl4iizM7MzGNiAgAMCefA=
Date: Mon, 3 Feb 2025 18:51:39 +0000
Message-ID: <IA0PR11MB71859E012D110DCD92D7B179F8F52@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <677928b5.050a0220.3b53b0.004d.GAE@google.com>
 <679e894f.050a0220.163cdc.0027.GAE@google.com>
In-Reply-To: <679e894f.050a0220.163cdc.0027.GAE@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ0PR11MB4830:EE_
x-ms-office365-filtering-correlation-id: 10b0d845-7030-42b5-2a69-08dd4483cb15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|13003099007|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Z0tDUVpGMVNqbUtLcDNqTlM3RGorQ000dGQ0djZUWEh4MXAvcnFzeCtLNDNE?=
 =?utf-8?B?NjVhNEIybFVVaGFIUDBtZ1A1aXBjNnJOd1RpeHRYSEFGNDFHSUxheHJtWXJW?=
 =?utf-8?B?RDBEQ1VnSHo1bGZOeFc3MzIvbGh0R2lKa3hoODhBMUdmMWxBd1JoR0pkT2hh?=
 =?utf-8?B?VS92alZ6TmVQajFlZE41Vk8vYWt2QlFZYW5ZNzRXZzFzSEVuVCtkam1kRm1S?=
 =?utf-8?B?UFI2aE56aUEwSkJQQTVhQmFJQWg1YktjZjVJWjU3aW5CU1RvSlp5WEtqNGVp?=
 =?utf-8?B?TE1rSVppS1huc202VFhncDdRNWtVSGQya240YlJXQ25oZGpYd0dkRDcwRUFn?=
 =?utf-8?B?RDNCUnpyenVobkwxYTU4SWdPN3JDNmw5UWxGTjZ2SDJpa0V6WnRiZDVLMldn?=
 =?utf-8?B?Q2d1alFnYUNEekdPMXZvRHY0emlleVJSVWpoSlJJMnlqU1VrNEQ4VEt3ZnVq?=
 =?utf-8?B?dkc3TFBtREQrTE9VWVlYSnIyVFlOTFVhYWhweGhpZzQycVdvM1BTQ2ZkS1hH?=
 =?utf-8?B?clhucW1udGFyNnlHRytDQ3pFMUh5SFpKbWpOb3NUTkczMWdPanRJWVlxT2V2?=
 =?utf-8?B?Q1RMWkFzakFnWE5DZ2pTeFNtMEJTam1uOGxvVUczYWtqR0Q5VTBLcW9SUnpZ?=
 =?utf-8?B?RkNMRUpZVXd2M01ZRTV2NFpSZDIxV1lyR1NXZENjcmFLd2pUYzlranJtbllN?=
 =?utf-8?B?a2JDYUlyaWFUUGh1NUdCcVZqZXdTQTlzWDU5NnhHM1NwNHBHUzhSWGRVelJx?=
 =?utf-8?B?Umg4L3dKTUdKSlcwR0l4eUd1SjNLV3E5djhueGdwellrc05TcmwzTSsxNXBK?=
 =?utf-8?B?Z2dxUkE1M2U1NEIySWRMQjFpSUg1Yk8zQ2FUT3lQajg2R2ZWeFNoVU1GUEI5?=
 =?utf-8?B?N3c4dkZqSlVtdmtwUDNHNTRzakZmWWRyRE9zeVJmSHY0VWtYU0tVWEdScGZS?=
 =?utf-8?B?dmFhZFVWNVc2ZlNoaEtFRWI3bFpFc1R5R3pLZi9uUDJ3RXM5SHQrVDlFS04x?=
 =?utf-8?B?cEVjNHpreXpXVEt4a29kOVpYS0JSVjQzTUVhTmRvTW5TbERiT1diRVlUMXF1?=
 =?utf-8?B?eEMwZVZQTVNqSFZ1ZlpWTTkxdUVuelA3cXNlK0luZjlJcWpEeFlKY0NWUVA4?=
 =?utf-8?B?NGtKSVJnQmozVmR6QTc1dHFzd0NOdFpFL0JkSXZkdHgyQzIrQW1DcTNjM0hs?=
 =?utf-8?B?azBUTG9CU0loWHNWOHFRczB6NkRLUGhwek5Ia0o1cnVxUUlLZ2VGV1B4RkdF?=
 =?utf-8?B?QTZzQWNqY2IvMnoyUk9OV1hJZzNCT3FBbWNRVWlqQjBqWTRCRVFDZEJBcGo2?=
 =?utf-8?B?dmFWUXZYT2VSQmplQmVEQ2lsR01ZWi8xNWFQQ1pJbThFbG13VStlK3hrNU93?=
 =?utf-8?B?R0ZxU3ZSbHdrMGh4Rkh5WEQ4b1Vsck5NcjF0dmtBb045UytyMlJiMUxvczZu?=
 =?utf-8?B?R1djbHVPYk9WTEV4WmlkajhDYXBLczlWY0JJWkxkU3ZaYzFCRmU5UWFTc0Zy?=
 =?utf-8?B?U2NHLzhmNEZxcWFtNjR5ZVFSMGhTNWVjcVp2ZWdxQWhoL0ZQVjR2dVZlcEYx?=
 =?utf-8?B?MUhoMGU5dUFPZzk4SDhNQ3IvbW1neVBVNis5U2F3WVQzZmlGdDhTTFpuTFla?=
 =?utf-8?B?NnRBcDIwWXhvOU9EeFQvZ0hXUDlublhmSGpuVk9kUlZyWjFYa2c0OXFmQWtF?=
 =?utf-8?B?WmlRaTRhRWxHMlc2bi9Fb0tuNUZFc0lEM3JWTElTcEdSMURpMUdCQmxsbzdE?=
 =?utf-8?B?aEovNndYbUdtMDN3RGxmNmhMbVZFUTg1U1RtZk5neFhPWE1md09kVEN4YTlS?=
 =?utf-8?B?R3k4WlhoV2NuditYUUE2WDNTbmIyNDN2L1ZXQU0vOUJKdHYxQVZRT0c0d0F5?=
 =?utf-8?B?aFU1bWpNMXpVOUpxYXZXemFuSStUdWNHbUVNcWdiTTdzcnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blFGdjZSU1IyM20vWHdlOHNyYU8wRk5EeEtNaEdLYzFFS2NUSHVZZjkxL1cz?=
 =?utf-8?B?dHRhbkZ0WmdOV2VueEZPWmZpZkdNbGlwVmlCYjhERy9FRVdPdFovSUFBeU5L?=
 =?utf-8?B?WEV5ZFZGQlYyV3BxM0IwVE1GVUFvbERXS3l0MmQvQyt2SjVpM1lMODVIa1pQ?=
 =?utf-8?B?Vm83ck5samZCdWJ3dDlOUitCVlpZb2ZqRHR0WmphSHNLYmlDS2hPZlRYY3I0?=
 =?utf-8?B?NXBiOUNnUDBreUtRdGViOG55U2VVbGhweHMvbUpVQitoUHlyeEViNWRybVE1?=
 =?utf-8?B?eXgrRjh6azdzTTYvRklrak5FRDRRR0s5cDJvSHYrVnZpa1R0d2RGd3ZGRUZt?=
 =?utf-8?B?UmlYTnhBdlNCRk1xaWhLb1l3dktKZElOWkFreTZaTWdxQmdHcVRJMmhOeGRD?=
 =?utf-8?B?VFNzWCtyVEpKU2FNSFVtWU1od2hBS2l2KzVSWGM1Rk9iSXlyOWNlcnlsbTBS?=
 =?utf-8?B?M1FiNWJpMzJob0ZsbUQzYjQxRzBPbFNQRXlpTUpqS3FOaklJc0txMHBnaks2?=
 =?utf-8?B?d2pWQWhJUXNDU0RRbFREeSszbmRFbmhBekY1NTREZ1NJQUJ2Sk1XUGRlNy9F?=
 =?utf-8?B?QnVUY2dGbzJNVTBYM3FnOXFrY2VVYnBkQTlyVTY3ZkFpNDFrZ29sam5NYUhv?=
 =?utf-8?B?eEs1eEdjUnJDbDdENXYrREJiUXVCNFE1Ky9odDJyY3cvaWVHSUE1MURqaldM?=
 =?utf-8?B?OXpWY3NTa3dQWjJlOFlHNnJ3MDNuYTc1N29XYktoaXNsd3k5WU81cDE2dG5p?=
 =?utf-8?B?NTZSTXBscjREblF4K1RtQ01xWkZNWmhPWkkrMVNsOEJzNHc1TnR4dEpiaVpU?=
 =?utf-8?B?MlpZQWpMV1AyUlo4bTczcjVMZHRTd2NPdXhKN1B0Nm1YcWIrTlpTemlDZVFK?=
 =?utf-8?B?MjlvZnVQZy9qZy9rNXhIcXF5RjZwaVJHVkRLbjV1a0hiek9WOThoL0ZGSUk5?=
 =?utf-8?B?MStrdmZ3SEJJVTJSOTZ0djEza0JaYWQwTGlXdktYZHBGeVE5Q2VIL002ajFM?=
 =?utf-8?B?OFg5cFcxUVIxcTBTaFlNZEVaMGhMc3ZFTjRBTnZqYi9aNVdWZVpsZG5yQzcv?=
 =?utf-8?B?TnlyRDdWdCtGU096a1pqQVlhUzIxbUR1Uk9jb2ZXQXFsei9kdG92MzhoOG5M?=
 =?utf-8?B?T0FxYVpNcDhVbnZ3NmI5VWpHNTJLU0t4ajVkZFhUYllyRy9vdXBpYmgyTVQw?=
 =?utf-8?B?NkpHMS9ENXowNDVkTmVFcW1pSFhJSERPRjFPYWRIUTB4WE5wTDVTQlphZHlD?=
 =?utf-8?B?WWhCNXg0cmxmS0ZWd2xUWkxGWUk3MkwwUm44elE0MThzbDZvc3QyT1UxTXM1?=
 =?utf-8?B?VmhKUEM2Nk5JK1BiY3RJT0x4QnNpakhicUZ5OS9Fb2NxRndNQkxvVmdRZ0Rv?=
 =?utf-8?B?U09Bd3M5NStRTWRkc3NhcXVYSkxLTmhPZXFRWHpVMDJ0MGE3ZWVkSWtDa2JI?=
 =?utf-8?B?REh4VjJJc2JoT2x4dUg1emttYXBDMWlzTVdqbWUrSlp6c01rZk8rVmhDTGJH?=
 =?utf-8?B?a3NYWWlsdFl5TlpyTXZjRGpxdksyVUNjbU5yNlJ2N0xRcHFlbE4yL3R2NUta?=
 =?utf-8?B?bFg3YzFRU0ppeTV5b2cxeFFYeUpHemExZ2hFQzZJR1ZaZGVkWm40UkRxUWVC?=
 =?utf-8?B?TkFiUUVlTk1SYXZQUm54Q1pqOFdwd2xJKzBteE5KdkhMYlEwWnhpaDhQekFk?=
 =?utf-8?B?Z29qY1FCWElZM0JNbjNGaXJjQy9jZFFBRHE0NW90NmVxUDh2aWNTalMvU01G?=
 =?utf-8?B?bENlU3VkbjFuMnhqZnJkUXloNVFReUtmMDNBNGlzeGVxTHV4VWxjekZObFda?=
 =?utf-8?B?aE1qeklwV3pvQ3QrZVV0cWJXWmV3cCtEdjRzT0h0OTViaFBDZzljMzhQd05H?=
 =?utf-8?B?VXJjMkhIT092aXJ6Nys2alMwd2lsZy92bVZwWmtXQWc2Nlo4d25hOFBHOUto?=
 =?utf-8?B?cFF4Q2JEenNYektDb0ZSWFQ1ZnpCM1FCcm92YmRQMVZPK0tZS2RlcThJVWNq?=
 =?utf-8?B?S3hwWS9ZQjlWelpxZmdnTUxERU56OVJneHhtTXF2bEt2YzR1VE5tRHZveU95?=
 =?utf-8?B?ZVdrSUZ4WXArT0xEd244cXpET2ZQZEw1UlpJVVBtanp6SXJnTEl1TVNUWC9M?=
 =?utf-8?Q?7X0AMKLfg0ECWg5nGbw30M8F1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b0d845-7030-42b5-2a69-08dd4483cb15
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 18:51:39.4846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJkv+Tvpnk1UeWO+fPfeEhssYmjvHjj+PN8KwfbTDU42Wdd4yyHL3iTAoZKYInMJJNAZQujjsp4102NTkBc93Cx2uq+zVazdkm6lK1xjDOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
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

PiANCj4gc3l6Ym90IGhhcyBmb3VuZCBhIHJlcHJvZHVjZXIgZm9yIHRoZSBmb2xsb3dpbmcgaXNz
dWUgb246DQo+IA0KPiBIRUFEIGNvbW1pdDogICAgNjllODU4ZTBiOGIyIE1lcmdlIHRhZyAndW1s
LWZvci1saW51cy02LjE0LXJjMScgb2YgZ2l0Oi8vZy4uDQo+IGdpdCB0cmVlOiAgICAgICB1cHN0
cmVhbQ0KPiBjb25zb2xlK3N0cmFjZTogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9s
b2cudHh0P3g9MTQzMWNiMjQ1ODAwMDANCj4ga2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PWQwMzNiMTRhZWVmMzkxNTgNCj4gZGFzaGJvYXJk
IGxpbms6DQo+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1hNTA0Y2I1
YmFlNGZlMTE3YmE5NA0KPiBjb21waWxlcjogICAgICAgRGViaWFuIGNsYW5nIHZlcnNpb24gMTUu
MC42LCBHTlUgbGQgKEdOVSBCaW51dGlscyBmb3IgRGViaWFuKQ0KPiAyLjQwDQo+IHN5eiByZXBy
bzogICAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcHJvLnN5ej94PTEzMjRm
ZGRmOTgwMDAwDQo+IEMgcmVwcm9kdWNlcjogICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNv
bS94L3JlcHJvLmM/eD0xMjhiNTVmODU4MDAwMA0KPiANCj4gRG93bmxvYWRhYmxlIGFzc2V0czoN
Cj4gZGlzayBpbWFnZTogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL3N5emJvdC0NCj4g
YXNzZXRzLzE0NGE3NDY4YmYxYi9kaXNrLTY5ZTg1OGUwLnJhdy54eg0KPiB2bWxpbnV4OiBodHRw
czovL3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vc3l6Ym90LQ0KPiBhc3NldHMvODZkN2Q0NTJlZWNj
L3ZtbGludXgtNjllODU4ZTAueHoNCj4ga2VybmVsIGltYWdlOiBodHRwczovL3N0b3JhZ2UuZ29v
Z2xlYXBpcy5jb20vc3l6Ym90LQ0KPiBhc3NldHMvZjU2ZTI5MmIwMWY1L2J6SW1hZ2UtNjllODU4
ZTAueHoNCj4gDQo+IElNUE9SVEFOVDogaWYgeW91IGZpeCB0aGUgaXNzdWUsIHBsZWFzZSBhZGQg
dGhlIGZvbGxvd2luZyB0YWcgdG8gdGhlIGNvbW1pdDoNCj4gUmVwb3J0ZWQtYnk6IHN5emJvdCth
NTA0Y2I1YmFlNGZlMTE3YmE5NEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tDQo+IA0KPiAtLS0t
LS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4ga2VybmVsIEJVRyBhdCBtbS9odWdl
dGxiLmM6MjMzMyENCj4gT29wczogaW52YWxpZCBvcGNvZGU6IDAwMDAgWyMxXSBQUkVFTVBUIFNN
UCBLQVNBTiBQVEkNCj4gQ1BVOiAwIFVJRDogMCBQSUQ6IDU4MzIgQ29tbTogc3l6LWV4ZWN1dG9y
Mjc0IE5vdCB0YWludGVkIDYuMTMuMC1zeXprYWxsZXItDQo+IDA5NzYwLWc2OWU4NThlMGI4YjIg
IzANCj4gSGFyZHdhcmUgbmFtZTogR29vZ2xlIEdvb2dsZSBDb21wdXRlIEVuZ2luZS9Hb29nbGUg
Q29tcHV0ZSBFbmdpbmUsDQo+IEJJT1MgR29vZ2xlIDEyLzI3LzIwMjQNCj4gUklQOiAwMDEwOmFs
bG9jX2h1Z2V0bGJfZm9saW9fcmVzZXJ2ZSsweGJjLzB4YzAgbW0vaHVnZXRsYi5jOjIzMzMNCj4g
Q29kZTogMWYgZWIgMDUgZTggYzYgZTkgOWYgZmYgNDggYzcgYzcgNDAgNTYgNjEgOGUgZTggMWEg
OWIgZDggMDkgNGMgODkgZjAgNWINCj4gNDEgNWMgNDEgNWUgNDEgNWYgNWQgYzMgY2MgY2MgY2Mg
Y2MgZTggYTUgZTkgOWYgZmYgOTAgPDBmPiAwYiA2NiA5MCA5MCA5MCA5MCA5MA0KPiA5MCA5MCA5
MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCBmMyAwZg0KPiBSU1A6IDAwMTg6ZmZmZmM5MDAw
M2UzZjdmOCBFRkxBR1M6IDAwMDEwMDkzDQo+IFJBWDogZmZmZmZmZmY4MjFmODMxYiBSQlg6IDAw
MDAwMDAwMDAwMDAwMDAgUkNYOiBmZmZmODg4MDM0ODEzYzAwDQo+IFJEWDogMDAwMDAwMDAwMDAw
MDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDAwDQo+IFJCUDog
MWZmZmZmZmZmMzQ4YjRkMSBSMDg6IGZmZmZmZmZmODIxZjgyZDMgUjA5OiAxZmZmZmQ0MDAwNWEy
MDA1DQo+IFIxMDogZGZmZmZjMDAwMDAwMDAwMCBSMTE6IGZmZmZmOTQwMDA1YTIwMDYgUjEyOiBk
ZmZmZmMwMDAwMDAwMDAwDQo+IFIxMzogZGZmZmZjMDAwMDAwMDAwMCBSMTQ6IGZmZmZlYTAwMDJk
MTAwMDAgUjE1OiBmZmZmZmZmZjlhNDVhNjg4DQo+IEZTOiAgMDAwMDU1NTU3ZDFjMDM4MCgwMDAw
KSBHUzpmZmZmODg4MGI4NjAwMDAwKDAwMDApDQo+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCj4g
Q1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPiBDUjI6
IDAwMDA1NjNkNmQxNjQwMDAgQ1IzOiAwMDAwMDAwMDdhYmFhMDAwIENSNDogMDAwMDAwMDAwMDM1
MjZmMA0KPiBEUjA6IDAwMDAwMDAwMDAwMDAwMDAgRFIxOiAwMDAwMDAwMDAwMDAwMDAwIERSMjog
MDAwMDAwMDAwMDAwMDAwMA0KPiBEUjM6IDAwMDAwMDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAwMGZm
ZmUwZmYwIERSNzogMDAwMDAwMDAwMDAwMDQwMA0KPiBDYWxsIFRyYWNlOg0KPiAgPFRBU0s+DQo+
ICBtZW1mZF9hbGxvY19mb2xpbysweDFiZC8weDM3MCBtbS9tZW1mZC5jOjg4DQo+ICBtZW1mZF9w
aW5fZm9saW9zKzB4ZjEwLzB4MTU3MCBtbS9ndXAuYzozNzQ2DQo+ICB1ZG1hYnVmX3Bpbl9mb2xp
b3MgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYzozNDYgW2lubGluZV0NCj4gIHVkbWFidWZfY3Jl
YXRlKzB4NzBlLzB4MTBjMCBkcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jOjQ0Mw0KPiAgdWRtYWJ1
Zl9pb2N0bF9jcmVhdGUgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYzo0OTUgW2lubGluZV0NCj4g
IHVkbWFidWZfaW9jdGwrMHgzMDEvMHg0ZTAgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYzo1MjYN
Cj4gIHZmc19pb2N0bCBmcy9pb2N0bC5jOjUxIFtpbmxpbmVdDQo+ICBfX2RvX3N5c19pb2N0bCBm
cy9pb2N0bC5jOjkwNiBbaW5saW5lXQ0KPiAgX19zZV9zeXNfaW9jdGwrMHhmNS8weDE3MCBmcy9p
b2N0bC5jOjg5Mg0KPiAgZG9fc3lzY2FsbF94NjQgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6NTIg
W2lubGluZV0NCj4gIGRvX3N5c2NhbGxfNjQrMHhmMy8weDIzMCBhcmNoL3g4Ni9lbnRyeS9jb21t
b24uYzo4Mw0KPiAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3Zg0KPiBS
SVA6IDAwMzM6MHg3ZmNkNTI0NzMzYTkNCj4gQ29kZTogNDggODMgYzQgMjggYzMgZTggMzcgMTcg
MDAgMDAgMGYgMWYgODAgMDAgMDAgMDAgMDAgNDggODkgZjggNDggODkgZjcgNDgNCj4gODkgZDYg
NDggODkgY2EgNGQgODkgYzIgNGQgODkgYzggNGMgOGIgNGMgMjQgMDggMGYgMDUgPDQ4PiAzZCAw
MSBmMCBmZiBmZiA3MyAwMQ0KPiBjMyA0OCBjNyBjMSBiOCBmZiBmZiBmZiBmNyBkOCA2NCA4OSAw
MSA0OA0KPiBSU1A6IDAwMmI6MDAwMDdmZmRkYjVjY2U1OCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdf
UkFYOg0KPiAwMDAwMDAwMDAwMDAwMDEwDQo+IFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAw
MDA3ZmZkZGI1Y2QwMjggUkNYOiAwMDAwN2ZjZDUyNDczM2E5DQo+IFJEWDogMDAwMDAwMDAyMDAw
MDA0MCBSU0k6IDAwMDAwMDAwNDAxODc1NDIgUkRJOiAwMDAwMDAwMDAwMDAwMDA0DQo+IFJCUDog
MDAwMDdmY2Q1MjRlNjYxMCBSMDg6IDAwMDAwMDAwMjAwMDAwMDAgUjA5OiAwMDAwN2ZmZGRiNWNk
MDI4DQo+IFIxMDogMDAwMDAwMDAyMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAw
MDAwMDAwMDAwMDAwMDAxDQo+IFIxMzogMDAwMDdmZmRkYjVjZDAxOCBSMTQ6IDAwMDAwMDAwMDAw
MDAwMDEgUjE1OiAwMDAwMDAwMDAwMDAwMDAxDQo+ICA8L1RBU0s+DQo+IE1vZHVsZXMgbGlua2Vk
IGluOg0KPiAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gUklQOiAwMDEw
OmFsbG9jX2h1Z2V0bGJfZm9saW9fcmVzZXJ2ZSsweGJjLzB4YzAgbW0vaHVnZXRsYi5jOjIzMzMN
Cj4gQ29kZTogMWYgZWIgMDUgZTggYzYgZTkgOWYgZmYgNDggYzcgYzcgNDAgNTYgNjEgOGUgZTgg
MWEgOWIgZDggMDkgNGMgODkgZjAgNWINCj4gNDEgNWMgNDEgNWUgNDEgNWYgNWQgYzMgY2MgY2Mg
Y2MgY2MgZTggYTUgZTkgOWYgZmYgOTAgPDBmPiAwYiA2NiA5MCA5MCA5MCA5MCA5MA0KPiA5MCA5
MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCBmMyAwZg0KPiBSU1A6IDAwMTg6ZmZmZmM5
MDAwM2UzZjdmOCBFRkxBR1M6IDAwMDEwMDkzDQo+IFJBWDogZmZmZmZmZmY4MjFmODMxYiBSQlg6
IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiBmZmZmODg4MDM0ODEzYzAwDQo+IFJEWDogMDAwMDAwMDAw
MDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDAwDQo+IFJC
UDogMWZmZmZmZmZmMzQ4YjRkMSBSMDg6IGZmZmZmZmZmODIxZjgyZDMgUjA5OiAxZmZmZmQ0MDAw
NWEyMDA1DQo+IFIxMDogZGZmZmZjMDAwMDAwMDAwMCBSMTE6IGZmZmZmOTQwMDA1YTIwMDYgUjEy
OiBkZmZmZmMwMDAwMDAwMDAwDQo+IFIxMzogZGZmZmZjMDAwMDAwMDAwMCBSMTQ6IGZmZmZlYTAw
MDJkMTAwMDAgUjE1OiBmZmZmZmZmZjlhNDVhNjg4DQo+IEZTOiAgMDAwMDU1NTU3ZDFjMDM4MCgw
MDAwKSBHUzpmZmZmODg4MGI4NjAwMDAwKDAwMDApDQo+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDAN
Cj4gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPiBD
UjI6IDAwMDA1NjNkNmQxNjQwMDAgQ1IzOiAwMDAwMDAwMDdhYmFhMDAwIENSNDogMDAwMDAwMDAw
MDM1MjZmMA0KPiBEUjA6IDAwMDAwMDAwMDAwMDAwMDAgRFIxOiAwMDAwMDAwMDAwMDAwMDAwIERS
MjogMDAwMDAwMDAwMDAwMDAwMA0KPiBEUjM6IDAwMDAwMDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAw
MGZmZmUwZmYwIERSNzogMDAwMDAwMDAwMDAwMDQwMA0KPiANCj4gDQo+IC0tLQ0KPiBJZiB5b3Ug
d2FudCBzeXpib3QgdG8gcnVuIHRoZSByZXByb2R1Y2VyLCByZXBseSB3aXRoOg0KPiAjc3l6IHRl
c3Q6IGdpdDovL3JlcG8vYWRkcmVzcy5naXQgYnJhbmNoLW9yLWNvbW1pdC1oYXNoDQo+IElmIHlv
dSBhdHRhY2ggb3IgcGFzdGUgYSBnaXQgcGF0Y2gsIHN5emJvdCB3aWxsIGFwcGx5IGl0IGJlZm9y
ZSB0ZXN0aW5nLg0KDQojc3l6IHRlc3Q6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9W
aXZlay9kcm0tdGlwLmdpdCBzeXpib3RfZml4X2h0bGJfcmVzZXJ2ZV92Ml9yZWJhc2UNCg==
