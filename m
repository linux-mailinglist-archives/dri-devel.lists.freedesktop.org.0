Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620B2C634B7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C8910E32D;
	Mon, 17 Nov 2025 09:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4RfV1Wg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C7810E320;
 Mon, 17 Nov 2025 09:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763372742; x=1794908742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iKVYJpYKyZsmmCtYt5pHVzEkeB35tXqj7mMFOYnKOIU=;
 b=k4RfV1Wg0wS93rhwDt7PMfecx1M8KyCDd2ILsDIVqesqpN8YUM65iNqe
 BXzWATAk4cGr5AJgVniPucpP9OheoacLCl1MBVFrFnxGOp+8THS8kRQIe
 vRlmhlBuW5n7CLd+cYEhj51kZcSZG4M8FtlEVjwmrZ6XUdp9Fc66YJibu
 ER4K28fCD8lkCFM2KFOLa1h40wn8oxuvgvRWNyndFZ04foMmvTfqHlqje
 +DBTo23Kevg17ETbJKGxFB+E9FodEgK+BaE1fvBE4lSL2qan730Jf/7Wn
 /h/Y7qWYXi+/Yk0jIVlDCo7edO3Mz9FOtDqZcFABYNKArS2Q3aQTohHxb A==;
X-CSE-ConnectionGUID: zvcGz3j/SgCEvrLTkvykWg==
X-CSE-MsgGUID: 5IxZGoGqRp6EoTFsE/fo3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="90843322"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="90843322"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:45:42 -0800
X-CSE-ConnectionGUID: +0W5ij6oQ1eoYiYLACeBnA==
X-CSE-MsgGUID: KuytailfR/GT6Db70/KZ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213805934"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:45:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 01:45:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 01:45:41 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 01:45:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1cgZvmnozEK2X/GH7zeSGo+u/DVeyJ8aoEzXqm075eQ6qopatFA64LnJjj0LiD7DoWoUWD+Vzi8IOmj3M5g0zUum8m0q41sl+U7ER6w9WCCsQdK+6rpcoalRZgiyiA/nG6B0WLWUQVKfEWyj14BPov2D19JasGcoSS0vBRwF/+Afl8G6UFM5wwN5Np9N3jVsE+qyDI8jtHu2d5g+BDDm3Qy+g0Z2Eu0kWXQVqnekBIxqv8tkal3B9J16LowrHQozh3/wvJfuBDW6gFPEowjZ+5u2lzq4LXuu2eApYtDljeHjz1uDmbHcULQpBoTBAlcj4rIY6hn07bh0XHfqzm/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKVYJpYKyZsmmCtYt5pHVzEkeB35tXqj7mMFOYnKOIU=;
 b=RuZCkxEzPHnh3EwtOHByIUbdSSBTwVVl7afoB/h5ctvRc88d8/axXDx6ZWAULxlshHZXv8S7/sNXAMBVh5H4IbNdv3OVKf22Pivhbxgi+MSUZlHmV6ghedLGKsB/TvsFH9PkI0KY9OKtxpOWJYMVG9geRvb0WUAvjwlV1sDKlMmbrzOCEL0y8xRli8jOy6GW6nENCagn9F5mFfmtNb3GM1kgN/N2HsJeuZBOLCxzLS9h95IhMjK7uJIjc4vu7NzKvTQhB37i4N9YaqlqpnjofdpIARygk+Zm2DCN+JbSnRkdIQanAneT1o6uMaKFgtgp34yHh0R/Gf/BkexlxGH8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 09:45:32 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:45:32 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v4 06/10] drm/i915/alpm: Half LFPS cycle calculation
Thread-Topic: [PATCH v4 06/10] drm/i915/alpm: Half LFPS cycle calculation
Thread-Index: AQHcVJkdyyqcQMSjXEqMrrUQmDptFrT2o5AA
Date: Mon, 17 Nov 2025 09:45:32 +0000
Message-ID: <DM3PPF208195D8D5E601C957C3894CE29C9E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
 <20251113120119.1437955-7-animesh.manna@intel.com>
In-Reply-To: <20251113120119.1437955-7-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|BL1PR11MB5979:EE_
x-ms-office365-filtering-correlation-id: c8d9e839-c375-4e30-2dc6-08de25be0cda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aXdMSVZqNVNHQ0ZWYktuNmpTVGlQc1BlTDUyNFhhWWFObmhVNk50N0JpRWJj?=
 =?utf-8?B?S2czK0NnL2FIQXV6SUFScXhjM3RCZE9maXQ3WlVUcHRLcmdya1ZmbWh2MHY4?=
 =?utf-8?B?bkhvYmMvUjV4dEhubWF2a2o4WThYdU55UXByeU1BcldQVGt5dEFPejNxSTRv?=
 =?utf-8?B?RzJUMVl4Ym5KbngydEZuMW82a1N4M280N09PZ0V2YjJGWHRjampBMVhTK0Nl?=
 =?utf-8?B?aEJZY3l6cGk1bTlIeXhqSjFLenN3NnAwZ0hlNWRiSVdIYnRaaEFKZkxOUlZX?=
 =?utf-8?B?ZS9FNXJaT3FxTDNXc3JTYktQNnNQUGQydnNwUFVCdkoydzY3RUIwR1UweWRh?=
 =?utf-8?B?M3l4U3BnSy8wTmZuSFdoTHVNRE11SnJ5Uy9qVzFuWUphUTZmNWUxc01sZFFN?=
 =?utf-8?B?RGpyY0E1ZnJMQVpTUmlmNmRaeFdySjc4UkE4SlRvTkFiY1ZBNFNYc0xtSHha?=
 =?utf-8?B?Z1RCU2RjVWFwTUUvZ0V6UjFUL3N6SUpieG1xd1gwWmtWNmNLeTlOajFOUUdY?=
 =?utf-8?B?MWxJaXRMN2VVd0QrM3IvcWNGMnU2T0V4YW5sdTczVFZ1SGxuei9qUzJHNE4r?=
 =?utf-8?B?N040YS8zZGlQeEtHelhucjVKRHM1bGczYmNaZ1VLbUVhUWZZRkhGRlZTUUhT?=
 =?utf-8?B?cDhvR09lVUJxWnUyOW5IMUxINnhOL25YUUxiWjNCWGVEK09yN3lHOW00cHVq?=
 =?utf-8?B?d25QMFhlQVhzSC9jMkc2S2w2OGdIeDcraG0rVVFES3QxTzJUMzk2bFhzTDM1?=
 =?utf-8?B?ajg0UDltQklybmk0NENzKzFEQURpdUVPTlF0WFdLMXk4b0xJYmhJdUNUYkgy?=
 =?utf-8?B?UTlRRTBkMXBQdjl4ZjFZK1BEMEdOaHlHV2tveFNjbUFjUlU0MUFpZFNtSGYx?=
 =?utf-8?B?eDZWRmFxa0VET28wS3YzVW1UNU5sNytrdU1DTDA1bEJEMzdhUXBVREpVMnNT?=
 =?utf-8?B?R0RHem1rME5GWmVOYnRqbms5UkVrZVZXSW92R1ozRmhFZXJuMUZyZXlDemFr?=
 =?utf-8?B?bjh1eW5IQnB5RWdrcDQvcWZwOE15MDViejB6aytPODRxODhsU3hsRm1FYjFa?=
 =?utf-8?B?N3hFaEhWUjNPSG5kcWJMWW5xd2EzK0djZXJ3RHZEMkRvSi9TUE9jRmd4bzRO?=
 =?utf-8?B?N29OWVJOTEsrQmFKMC93VFF0ekJ0cmZPTXROS3BaYXNPVVNjRWtydEZzWjU1?=
 =?utf-8?B?Mjk2bHBVUFJYTnVQM2NiSEtCbG4vS05vdC9HdnlEdktYcmhjN2F5K3J5dXh2?=
 =?utf-8?B?UWlxMUNyWEpOZGxVaXBLY0tEaERnVUFVQVpJQml4NElsT2xQNlFnYzNHMTdu?=
 =?utf-8?B?dzJMVGY3ZWs2TmNCUTRjem1LVmRQeWJPbnROazV0ekhIOC9nSFFFMXdMYmJG?=
 =?utf-8?B?Vyswa0FOV1ZpZGwvSU12Tk5zWU5QTUUzaGJmbkVIempPSDdCakZzWUFZemNH?=
 =?utf-8?B?M1QvTFdoem9KTkRMbm1yOEZ2MUZPUTN5VEt6ZnF5L2RlSG9sbkxrVlV4QlZQ?=
 =?utf-8?B?Qi9rcVl5ajlFMzBmQU14N3Y5Q0JBMEVNSjFKYXVnRkVEdmVYMEg3UHZHTGtQ?=
 =?utf-8?B?RmtVN2dwMlJJZTNmb2Y3akk3NTNhZ2dkMEhOT1N5YXU3bStOMnpNV2xHdk9K?=
 =?utf-8?B?a1l2Uk9zeFRESUFFSUJQUWVsbkpNbVErUVlUL0JBS2lUa1cxVHZ2cHloSG1i?=
 =?utf-8?B?Sm96ZjBWNHAyVzhKMkVLUTZPaElkTk9BRTZoNW9lcXhIejJHdmlHaTg1d1Fp?=
 =?utf-8?B?OTg3cWRSeUZsemlQVSt0ZDZyTlluTDNhK0RFWG9KVmRLY1BOL1dTWUhBNGlG?=
 =?utf-8?B?RjhnM1ZKUkU2UUdkY0Y1SE9TWDRaMm51T3BabHJKLzNFcmYrUlZEQUYxUCtq?=
 =?utf-8?B?UG9UaFUyL0FhQTgvRVVVVTRpb20yOVpIcytDS281allTUkNkdWFyNkFiQTBa?=
 =?utf-8?B?M2NGSmpGTTBCT2RvUlRDdzZpaGg1b1ZZR1N1d0E1US8vVnRjU3Z5TzNzMWly?=
 =?utf-8?B?OHNpdGtvM21MemV6UjAvZjM5UUNOc2ZDYmk2T2ZLditTQXB1TkRoemNHNEdp?=
 =?utf-8?Q?oU9j2l?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vko3WmFVMGlxRmpaQlpIanZiYkZNVit6U1RiQlZzRUxSWHMzUEpRS256bFZ0?=
 =?utf-8?B?NFIwMFVSMFhnUDd1OGdDc201YkhMQkwwQk90RXUrRytwbU9hRjliQkx6d0Uv?=
 =?utf-8?B?UllHVXdsUkxNSWhwYUZqYXdXTm41WW43aXFpM1dyZDIycXpxNGIwZzBWYkNi?=
 =?utf-8?B?OU9lQlB2bEhKWTJVRWpGcnJCcVlRWm90QklOaURkZ2VoZzhaaTdqNXlBVUdZ?=
 =?utf-8?B?Rm9BSGxKdHJVTFkzWXM2VGw5d1BDTk40aGQ2T3QvY25iRWd0MmtNak4yendm?=
 =?utf-8?B?VGdHN09DOWRtTDhZNkwzMGlseUpjM0NMYkpxSUdma0dSUHJmWTVsQUQ2QW40?=
 =?utf-8?B?VUpBSWdBWXJ3a3ZlcmpJWnBwbGYwZnJmWEpVcTZQZUdkMkpxZysvVnVzTWJC?=
 =?utf-8?B?RE5KcVU0a002N1RxYkVRL1JwSXY5bVBkZW5nQWg3T1VVKzE3UzI4bTc2eHl3?=
 =?utf-8?B?bGlSeDU4d0lLVHgvQlVDVm5VWnA1THdyQkZ5NEN6c3p4MUFOT2hRZitBaGdk?=
 =?utf-8?B?UVBqUkk0UmFVVm9ZekY5Y2VIWVB4c0pzRFdNUXFiNGNZRjVmTkMrRlNIYkE4?=
 =?utf-8?B?bmtISDR5anZIeFF6eHNabEVSb2VaVWxsdFlDVGowMkRnaEtiNlZ4MjRZUklJ?=
 =?utf-8?B?aHJ3Rkx4UHJ1MDU1VHhtdDY3NGpoK3UzMlcxTVFldGZUTzZoMHBVT1M4VXFC?=
 =?utf-8?B?am9NaEI5R1FXSU5VNGpvdEZ0UGFRbnptYi9CU1hpdlBleUtrMDlkWCtuRW5H?=
 =?utf-8?B?VVJqcERmWjNpcFBVdWdrWFlqSnQ0TzN0TU9nRUMrM3c1azNsdjcvSjhMblgy?=
 =?utf-8?B?QnZxMUJmVXFISUdaa1B0aGdSTXFGU0tpNERLbU8vdmFnTks1Z3VmTnhzSWVP?=
 =?utf-8?B?WlVsWXkxSHJhbUlySHE1cG9BODJLMUY2Nk44M0QyTUlZdWxRS294WVNZZ09X?=
 =?utf-8?B?MmxsWG5FcmFRcC9WSUJvU3FSajdhR2tLNkk2cTB4YTkyRW15dlBGNG4vVnE0?=
 =?utf-8?B?S01EeW9aZGI2eTZXMXdRWVFvRUNUeUN1ODFLb21rNHUvL2JKM0E5UklwcmhR?=
 =?utf-8?B?bUg0OTVvK0czMlVzdnRsdm9kcVlkeUZ3WGlId3ptY3JwV2pvVSsvY1haSGcw?=
 =?utf-8?B?WXp1NmVCN28xL1ZIcGVWeFBLVkxLbXppQjA4YTNqTmxHOHN6OWV0MDJtaU9J?=
 =?utf-8?B?NTIxM1dibjZxUS9oNkF5bXp0eWhCdStsdTFiZFRQRXYvYTYrY3FJUEZ4TUZD?=
 =?utf-8?B?bXhReXMrMENhdi93czMrOGRrTUQ5emxYV0hHVi9JWkVaemtKQ3RyNzYwREN3?=
 =?utf-8?B?SGZnYlpqcTcyQVRHUm1RSEduWHk2dzNMelg5dzQvTENJY2JKSC9oQVkyMjcr?=
 =?utf-8?B?eG8zNWFldW9UZ0VDdlo5UGJ6QzhaY1B2QjVHU0NmNUlRd1FnRDJDNDVTMkJS?=
 =?utf-8?B?OEJjbGVNTlNZc1V2NGlyNnZvbDdiaWhJV0dmZnR1Z3l5SVB5RHUwYXlSQTdS?=
 =?utf-8?B?WklOUTd4Tm1oNXhtTk1aQ2t6dUUrSUM3T0VEbUNJRDNGaGtqWEtLMkRpaVBH?=
 =?utf-8?B?US96T0RLc2JtNnk0aUhFYkUxQllvRmlCOGpjOVFzUnR0dDVMaTVMcUdCdFF1?=
 =?utf-8?B?S1NNWkZDcEJ5elhueDBOcU8wUUh2MEsvS1VvbkJuZ0Z3Q3BHSnVtcVBMZ1Jl?=
 =?utf-8?B?VVh3a0hGVXNrWDYzSWRQRXZidVViWlFZY0NDNGtycUNza0k2N1o2b1lmNzhZ?=
 =?utf-8?B?K2NqOU5LaGovczRZR0hZZWRGQXpiTHpGYWZMWGZxZFc5ZTRHaHplaEtTbDIz?=
 =?utf-8?B?UEpwVGFjaTVaSm1mRHJyNWhPeGhPMGRHWTd5clhNYWd5SXlRbVZTVmZOVlJU?=
 =?utf-8?B?NUxoUkhVaTl2UEJNSFlBNlhnRDFPc09EWWp6bWhmbEpwbWM4a3RIbEI3T1Rt?=
 =?utf-8?B?RndsRXBzNkN3YXBZcG8zMG9LTmp4K0RUL1hsdU9LQ0tKVmhZMXVVak51U3N3?=
 =?utf-8?B?ZzJSWUljekFiNDhkOFExZlVzOXp4TE8wM3dhZHJHSTRMdWVaWG9wMHBYUlJ0?=
 =?utf-8?B?NkxhNm5kUVZ6K0RHUTR5bmtXckVnL0wrV3VpN2xCcm0zOUVBWG5vQURxTWhW?=
 =?utf-8?Q?QUg6ndwzQFI0hgf7KZisPQyy0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d9e839-c375-4e30-2dc6-08de25be0cda
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 09:45:32.2478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0GaQlksNIY99ucu3mCC/TVNtkWCSnEafhX5E3iAV0QkIv/AwLdTGl6t9bJdHGj3yiahNMxdh1PhTcaxCxkYTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5979
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjQgMDYvMTBdIGRybS9pOTE1L2FscG06IEhhbGYgTEZQUyBjeWNs
ZSBjYWxjdWxhdGlvbg0KPiANCj4gQWRkIHN1cHBvcnQgZm9yIGhhbGYgTEZQUyBjeWNsZSBjYWxj
dWxhdGlvbiBmb3IgRFAyLjEgQUxQTSBhcyBkZXBlbmRlbnQNCj4gcGFyYW1ldGVycyBnb3QgY2hh
bmdlZC4NCj4gDQo+IHYxOiBJbml0aWFsIHZlcnNpb24uDQo+IHYyOiBBdm9pZCByZXR1cm5pbmcg
ZWFybHkuIFtKYW5pXQ0KPiB2MzogVXNlIGludGVsX2NydGNfaGFzX3R5cGUoKS4gW1N1cmFqXQ0K
PiANCj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYyB8IDE4ICsr
KysrKysrKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2FscG0uYw0KPiBpbmRleCA4MTQ3MjI1NGFiNzMuLjMzNjIwZjk1ZWNjNSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gQEAgLTczLDEyICs3Mywy
MCBAQCBzdGF0aWMgaW50IGdldF9zaWxlbmNlX3BlcmlvZF9zeW1ib2xzKGNvbnN0IHN0cnVjdA0K
PiBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKSAgc3RhdGljIHZvaWQgZ2V0X2xmcHNfY3lj
bGVfbWluX21heF90aW1lKGNvbnN0DQo+IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0
YXRlLA0KPiAgCQkJCQlpbnQgKm1pbiwgaW50ICptYXgpDQo+ICB7DQo+IC0JaWYgKGNydGNfc3Rh
dGUtPnBvcnRfY2xvY2sgPCA1NDAwMDApIHsNCj4gLQkJKm1pbiA9IDY1ICogTEZQU19DWUNMRV9D
T1VOVDsNCj4gLQkJKm1heCA9IDc1ICogTEZQU19DWUNMRV9DT1VOVDsNCj4gKwlzdHJ1Y3QgaW50
ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoY3J0Y19zdGF0ZSk7DQo+ICsN
Cj4gKwlpZiAoaW50ZWxfY3J0Y19oYXNfdHlwZShjcnRjX3N0YXRlLCBJTlRFTF9PVVRQVVRfRURQ
KSkgew0KPiArCQlpZiAoY3J0Y19zdGF0ZS0+cG9ydF9jbG9jayA8IDU0MDAwMCkgew0KPiArCQkJ
Km1pbiA9IERJU1BMQVlfVkVSKGRpc3BsYXkpIDwgMzUgPyA2NSAqDQo+IExGUFNfQ1lDTEVfQ09V
TlQgOiAxNDA7DQo+ICsJCQkqbWF4ID0gRElTUExBWV9WRVIoZGlzcGxheSkgPCAzNSA/IDc1ICoN
Cj4gTEZQU19DWUNMRV9DT1VOVCA6IDgwMDsNCj4gKwkJfSBlbHNlIHsNCj4gKwkJCSptaW4gPSAx
NDA7DQo+ICsJCQkqbWF4ID0gODAwOw0KPiArCQl9DQo+ICAJfSBlbHNlIHsNCj4gLQkJKm1pbiA9
IDE0MDsNCj4gLQkJKm1heCA9IDgwMDsNCj4gKwkJKm1pbiA9IDMyMDsNCj4gKwkJKm1heCA9IDE2
MDA7DQo+ICsJCXJldHVybjsNCj4gIAl9DQoNCg0KVGhpcyBjYW4gYmUganVzdCANCnN0cnVjdCBp
bnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShjcnRjX3N0YXRlKTsNCg0K
Km1pbiA9IDE0MDsNCiptYXg9IDE4MDsNCmlmIChpbnRlbF9jcnRjX2hhc190eXBlKGNydGNfc3Rh
dGUsIElOVEVMX09VVFBVVF9FRFApKSB7DQoJaWYgKGNydGNfc3RhdGUtPnBvcnRfY2xvY2sgPCA1
NDAwMDAgJiYgRElTUExBWV9WRVIgPCA1NDAwMDApIHsNCgkJKm1pbiA9IDY1ICogTEZQU19DWUNM
RV9DT1VOVCA7DQogCQkqbWF4ID0gNzUgKiBMRlBTX0NZQ0xFX0NPVU5UOw0KICAJfSBlbHNlIHsN
CgkJKm1pbiA9IDMyMDsNCgkJKm1heCA9IDE2MDA7DQoJCXJldHVybjsNCiAgCX0NCg0KUmVnYXJk
cywNClN1cmFqIEthbmRwYWwNCg0KPiANCj4gLS0NCj4gMi4yOS4wDQoNCg==
