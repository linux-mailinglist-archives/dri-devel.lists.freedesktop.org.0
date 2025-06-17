Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74567ADDBDA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 20:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A336910E513;
	Tue, 17 Jun 2025 18:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OCaE5lPC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038CA10E0E0;
 Tue, 17 Jun 2025 18:59:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diKl3mFXGhzJil09y7hewDNEOBE7tCVdIhp2O6Q3bRfYS2coKLaEzMau0LEtHFYn/Whe3Rzc+WWJOxyrBub2VA19JdPPaQvZ/9HKkioELlY0Ys++tEs6rqIjL2WoEAKDuY8til0g6Fj8/BCk1ZsDvq+fcoZHHRHcxmsdtcxqc3BPLBfTqHMsypVv629VZWp6rvKc21F6phDEG2o8Jq55RkD9pMjg+vnrSyBZQxKEckj/oxrw1gzl8AQNWTxCsxkIF1BwKdw3HY4AEWXZ3zKjhQfosYjHxA4GkL6NR9CtTAe6NwVoKhQXYMX8HttfvrblGV+1LBiGLhG2vaPVVUjLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAXUOKRVdST9wV4XMMO5TCQC+nQ+fIr2ogswdcjCWX0=;
 b=crxrgLXn13Bd9y//sayRf/CJo1uhoFccODqa5mcokJ09KTWfhbR3+Q0EnNsCWE5MvVUt8w+srIGEDE9etMrUatjuqQPfamP1u/EU3+l8/x45tO5dPJWtRpY2Yao8jzv4pEBwePv1AWaIQY/5dzqOaYvyOBFLq7Wc8GASdE2OZJKoSqqcjYVfjx5X2xCswZaq4MWesniqDC25MQaQ73PsWI6lwYlua0kolEHJpHXipn01lJ7k61AFGJORU1ImGsFugWLpc1Q8B2DB3sMvr0QZZz4rVMHS+qvpVm0H61h0FYQXCkP0SzNn37UnVYngM4BG1eTvEfbJBu3Zob68AB4mXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAXUOKRVdST9wV4XMMO5TCQC+nQ+fIr2ogswdcjCWX0=;
 b=OCaE5lPCb3GzUL47mRiadj25gPAzs8qI1KtwXCEhTcZ25tVe4QMRtDqbT/5BTwJfiBY6UPs/01/bb0BMt2lWjC8jigwAcf7uUH+aTX06K6/QdH9XNOHypUBb00mcfWQmAeorZT6hRtP7l23N8uC5G7W+FfRjoqKi3NcKtgNxJg4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 18:58:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 18:58:58 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Rodrigo Siqueira <siqueira@igalia.com>
CC: Melissa Wen <mwen@igalia.com>, "Hung, Alex" <Alex.Hung@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Michel Daenzer <michel.daenzer@mailbox.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Subject: Re: [PATCH v4 10/14] drm/amd/display: add a mid-layer file to handle
 EDID in DC
Thread-Topic: [PATCH v4 10/14] drm/amd/display: add a mid-layer file to handle
 EDID in DC
Thread-Index: AQHb3HQK98GRcYj8okSYqDrvQyf2zLQBbnqAgAZLlQCAAADLAA==
Date: Tue, 17 Jun 2025 18:58:58 +0000
Message-ID: <070d01d6-0172-4dc9-a66e-ba7472f07671@amd.com>
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-11-mwen@igalia.com>
 <2b05cc7d-c2bd-442a-87dd-d1f0abc11629@amd.com>
 <u4dtlkxce4iukyzmeoka7upof6uu63zpi3asegsawm27gxfhaa@xl24g6uhs77l>
In-Reply-To: <u4dtlkxce4iukyzmeoka7upof6uu63zpi3asegsawm27gxfhaa@xl24g6uhs77l>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6026:EE_
x-ms-office365-filtering-correlation-id: 1ff370be-332a-4330-91ed-08ddadd10426
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b0VLZlBZak1peG8ybVRLNFBXRzNuTm84ZFA0SVd5a1hpV3AzOVNXbVJVSm9Q?=
 =?utf-8?B?U2I2YWdsVGtMQmw4bkxHbVRhUGxpeVk2Rk42MktNOGM5a2ovRmQvTUFQTDVI?=
 =?utf-8?B?M2RpMjBTSUZrRGY3N0JHaXBMd1Y4Wlp2bHJFU0NGQktCRGdsTTZwcVpQUm1r?=
 =?utf-8?B?MnVjUEdhaENIVmF5SnY4dGhKazE4bDZPR3pRNWdGdFp5M1dyTlk0ZnBrUXpZ?=
 =?utf-8?B?MHNCVHg5T3VmWGdWTWFaUUdDa1Bsd1JRV1FGamVDcTB5Z0pBNi83ZjRNSnNi?=
 =?utf-8?B?eFl0a2NMblNLaTE0RVRtZWQ5Uzdzd2FwR1E4VjBodWpQeHZtcVMvdGVJSE9G?=
 =?utf-8?B?c1hMb0xxOFE0Z0o4clc5SkNYTzBGcnlxVlJLY3dpYm1wNFZyRm42OHZsay9j?=
 =?utf-8?B?Uk0yTnVyQUV1VGpOWjZzTThFcjNWTjdGV3VZcHZzRG1rOHhIRnFja01oZ1NX?=
 =?utf-8?B?Z3ZBeFZWbzlUbHk3cTQwbWNvWnhLQ0NNNFNFOXo2TEdHc2hkc2M4T1JkVjVC?=
 =?utf-8?B?NzYxSnRCQ1NncHhKMW5OVW9tdS9YdGhTT2VjYjlqcWMvNXk3bm54OERqOUNs?=
 =?utf-8?B?Q2I3SVJSNmFhNHNvZmtSdS9lbjFWM3BmWUNJTjhSb0NmWjZYTUE4aTBOTkhh?=
 =?utf-8?B?ZlRkVkEyc0tuVlBzSXdwMDNFU3pCaHJpVHZvZ1RDWDlueDBWR2wxQ2RabXZF?=
 =?utf-8?B?a2h4STdLQWVlOEFOUXdRRnFYVlZQcThaOVB0VjBXWHp3cmpJYVVQOU50Rk9h?=
 =?utf-8?B?M0xjSkYvbW15V1dTeXhyTStBK3I4R2pIbzJKWTlrNk1CenFLUWw1TFFRMlV3?=
 =?utf-8?B?Zk9Ub2E4Sk9lWGc4RldpYkhTWWxwOHVsbytRTHNtbEw5anYzbHF0ZmxsVEFv?=
 =?utf-8?B?WmhETEZQRThvLzBNbVVmSThCV204UUh2NzBEQ3F3dW1SWW1ZaWRWcEhMQmtw?=
 =?utf-8?B?RkRyN1p1RDlZcndlTUxzY29EWi93cnZLb0czUjZUb1cwVEpRcFM3S3gvVnpx?=
 =?utf-8?B?ZUZiNm9qRVBsT0xKYUxBS2hXWkpVS3dWc0cwOTRmZkJYYTBCb1JtVkRvOWxZ?=
 =?utf-8?B?eFExQkZMRm5CRVdHS1owb296aVkzR2g0by9Bd1B4OTEwWEpwaVBLeE5vTzVj?=
 =?utf-8?B?OFVVbko1SWN4M3BVMGVBa0ZTdG5MNzZubHovTGxrMUlTNXlDSVVzZmp1d1ZB?=
 =?utf-8?B?TlZXSjBWV0pVZC9FZGZtZmRVOXJ2cW5oZmRkYzZFbkN0VDRWTjVjVGQzUmlL?=
 =?utf-8?B?Q2dEU1MwRVQyL0tjTVpmaHV0REwwYmNEUW1YSHVFc05zYWg1SlRMcjFCekpv?=
 =?utf-8?B?TTBXR2dzS3RoaEY4a2UyNkVodVZsMDVtVXZxdkc3TnNNVDBSWXVYVWpqazRi?=
 =?utf-8?B?QVlkM0NiWGJOZy8zcjRZQ0dXSTcxaUNjOFZLTjhkWlk4a1ovQUxHOWxFNnhv?=
 =?utf-8?B?ODc3Y1M5S3lkb3pybTkvNHdWMTRHUkR0RTBzeHFNS09uSDZ4NlhieE5JdTQ0?=
 =?utf-8?B?dHJVNWRuaFFtY2IrWjNWMndFTEFyYzF5aG9YMmJERk9CWUlpU040M1pteG03?=
 =?utf-8?B?Rk9yaE1YQktMamZ6TU8rT01KWjlBTy9wU3gwUEtVQUxDd1N0Wk9TbGtLU0RX?=
 =?utf-8?B?ck1kb28yT0dVMlV2MGxoY05xbHlWZExXTmc4TXZYMnAxWDRSL2wycUJmRlBy?=
 =?utf-8?B?akk5SXY4R2x1eG5yYktWL0UvcDlvN3NGQ0JtTStVNUllNDlyd2J6Z1NEYlFJ?=
 =?utf-8?B?R3NtN3lLa0tNK2g1RGJ6RUVndVdOQk9DRnAwSnFVdk5yeFl1Q0o5a3JacmQ2?=
 =?utf-8?B?a25Qeko0S01tK1ZVR0ZsOTFPSytMa2VBV3VxN2ZLejZpYWV6aHdPbE05b3Ir?=
 =?utf-8?B?Y0xsaHRFTDdReDMySEkvS0RlM2JaaXZkWDZMS24rdTVLeUNBWGFqUzJrakZM?=
 =?utf-8?Q?/wAX6Bh5liI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlFzNlVCOXpCRU9Kb0xBSm4zYTd3MGxsU3ZuQ0diUkVmMzFyRFhkTGU1T0NF?=
 =?utf-8?B?OWRONTB5RTUwcXlQOUJqY2VTL2VHTHdIckNuWGZ5cE5uTDR6dFI4OTZUWXpE?=
 =?utf-8?B?ak8zKy9NQXhSeHJjdFdUL05PV0tpWFVyL3I1NCtoM0lUUHFDU0ptYXFUeGtw?=
 =?utf-8?B?N05yak9mV2JVUGJ1NlcvVWtYS3BBL0RFdDdJd3ozZHB0OXNyVjhmZFBMNjdm?=
 =?utf-8?B?enZzOHZSeFM0b09ValV2aFRDcXIwTklwcjYxZ3BlelJtbHV1VkFrRVJtOXIv?=
 =?utf-8?B?VjhyN3J3SGQvbnp0Uy9GNUtVa2UyMlFOMDBKTmNyZDVwQUdDM1RpazhCNml0?=
 =?utf-8?B?a0JSbXFWYy92YnhNek1zeFpNMHZZekRhNnlOSnYyVHFMbGdnZFpnV0p5djAz?=
 =?utf-8?B?NEt4Tmd2aUwvWVI0ZzhqRDRqQ3dsVWRoNDFtaFJmWVdqNlI3V1lKZmFHWmg0?=
 =?utf-8?B?VTN2d1dDN1dkTThQbHhnMHphaHl1bXE5bmtKNFdwNDdTbmRJQWtoSDBIVVYz?=
 =?utf-8?B?bTFqZVdheUVtdDd2RkRBdlQrMDJuRFh6cndScnhlekk5VU5TdDhITlErU0Yv?=
 =?utf-8?B?M3licUhXOE1PZ3puQ29HR1JFRy9OOUI0SGdEQ25HU2lLVzJ1Y2RBRnFNNGVK?=
 =?utf-8?B?dUtDUHlGUzRiSHpZSWFNcE1ldTJZOHN4TE9ma3hHRXZIbTY2azFCK0hndUlR?=
 =?utf-8?B?WXRvbHFJWGtVbmpTYStXVW9qR044eDlrcmExeGFqMEY5MkNpM1ZML0tjRnBH?=
 =?utf-8?B?Sll2TnZtY3lkUUdwcnFraEtmOXVsRjZLbWdPV3g3YjR0bjFQa2dROWxEYWdk?=
 =?utf-8?B?YjFLR3RIU0VpQVNaaVFZeVlndkc0c0pXbXIzMHE1dzVKY0VxUGs5eEVDdFFU?=
 =?utf-8?B?OGF0WDNGSnZNNFlSZjFPSnA3RDJtdCtxVlQwRzdpbm5ja09BYk1NSDlZeWRn?=
 =?utf-8?B?cFY0MnFzUG4ybnphem41K0gzY0RsWllxTmJZdjZ3STFWTHpOQ3lkaXRURTdY?=
 =?utf-8?B?cEd4SGdmMFozQW1Sdzg0WHFNUmYxeCtZMjZJTitacWtTbStKN1JkaGVHWkFL?=
 =?utf-8?B?bnB2MVVnaGZPbUNLQkljNlU3djNoVnZaa1B5U2NlL2hJLzFVM3pnOUxVdDZi?=
 =?utf-8?B?OG1lTTNRWHQ0YWZrL2l0dU11Zm55ZCt6K2ltVGVBTkdvUTJlcDlYMmxYNDE5?=
 =?utf-8?B?YmxzSHNwVituU2NyeXdMK2lvRFVJWHgxcDlDZUwxNThJVkVIMjdFRWY0T2JB?=
 =?utf-8?B?SWhEclNsRXZiTXJmWEpzelNNcjFnYUh5VWkvZVNEUzZaUzlUblhCOFFlNWY3?=
 =?utf-8?B?OVAvVFN5ejZMVHpxbkJQdlpBOE1mcFNLcExSaXcyUnRuS0I1OW13ckdGY0lj?=
 =?utf-8?B?aUVHZko0VG40bVRacWpYUjgvdFptR3BTOEZYbWlBcWtuQzY5SDBmQU9NT0o2?=
 =?utf-8?B?Z3U0MVA5bEdzNXlwWk1FaFcyN2JtQ2VDUkQzOWp5dHozMnlVc0dRQ2Njb3Rj?=
 =?utf-8?B?TnU2WWErdFVNNG5XZEFlSFMzZWt1WmNqZmt1emxnTDFSREZkcUxnUHlhY2dZ?=
 =?utf-8?B?WTdLUkhFbEdLbnd1ZFJ2K0ZRTkdoUnZncFQ2NUlWV241OVBOM2h4OWhCdnN3?=
 =?utf-8?B?R0VVQmxkejd4V1M1amV2aGc4RCtZT0ZxOUdQSGZYY01xRzVPZXM0QmlQRkN4?=
 =?utf-8?B?S2JwMFh3ME9SSDRadVh6eWdCUDg2VFh6TTQ5WGNCbFFCdS9rWXVsUkpGL2hv?=
 =?utf-8?B?SUxtOXViQU1qVVJLWnJ2SXhLcWdZR1ZMdloxc0R6bTYybEpUNnBXb2w3OEc2?=
 =?utf-8?B?by9Fc3F2N1c3WWkrSHhocjhJVWwyemZrQ1kyK1hHTjAzOTB1V0ZUMDZ2TGhE?=
 =?utf-8?B?b3B4NzlpYkt5TUdjdVN0eFpvK3lYb3lkckhJNlRkSXNKR0g4ZTlDUUdPRXpF?=
 =?utf-8?B?ZHhNRTNQVzBtc2lBTTh2eXJtYXpHVnhxSGw4cFcwWnRzMnp4bEpST250K1Bz?=
 =?utf-8?B?TnI1VTNDdXhlTGJ6WEI1T1lLa1QwRUowMmhJdHlZbktwWC80YS8wakt0M3Z2?=
 =?utf-8?B?VlA3S2tJR2hIcWtKSDAvM25maUlxZC91M2tOUHg0SDltN0ZUU1ZEWGNqcTdX?=
 =?utf-8?Q?L8pI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BA6D20E7E9DF14AB2749696C2C93022@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff370be-332a-4330-91ed-08ddadd10426
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 18:58:58.5636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zu+mJ+dr6D7MJK7O6GQOPUlKZ5NFcTSCelAYDdhMW19/qsQocVuS1nkCfPn1iWJA84HTtmWq8+Dp0FAGd9S3BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026
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

T24gNi8xNy8yNSAxOjU2IFBNLCBSb2RyaWdvIFNpcXVlaXJhIHdyb3RlOg0KPiBPbiAwNi8xMywg
TWFyaW8gTGltb25jaWVsbG8gd3JvdGU6DQo+PiBPbiA2LzEzLzIwMjUgOTo1OCBBTSwgTWVsaXNz
YSBXZW4gd3JvdGU6DQo+Pj4gRnJvbTogUm9kcmlnbyBTaXF1ZWlyYSA8c2lxdWVpcmFAaWdhbGlh
LmNvbT4NCj4+Pg0KPj4+IFNpbmNlIERDIGlzIGEgc2hhcmVkIGNvZGUsIHRoaXMgY29tbWl0IGlu
dHJvZHVjZXMgYSBuZXcgZmlsZSB0byB3b3JrIGFzDQo+Pj4gYSBtaWQtbGF5ZXIgaW4gREMgZm9y
IHRoZSBlZGlkIG1hbmlwdWxhdGlvbi4NCj4+Pg0KPj4+IHYzOg0KPj4+IC0gcmViYXNlIG9uIHRv
cCBvZiBhc2RuDQo+PiBDYW4geW91IHB1dCBjaGFuZ2Vsb2cgYmVsb3cgY3V0bGlzdCAoLS0tKT8N
Cj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHNpcXVlaXJhQGlnYWxp
YS5jb20+DQo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBNZWxpc3NhIFdlbiA8bXdlbkBpZ2FsaWEuY29t
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IE1lbGlzc2EgV2VuIDxtd2VuQGlnYWxpYS5jb20+DQo+Pj4g
LS0tDQo+Pj4gICAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL01ha2VmaWxlICAg
IHwgIDEgKw0KPj4+ICAgIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9kY19lZGlk
LmMgICB8IDE5ICsrKysrKysrKysrKysrKysrKysNCj4+PiAgICAuLi4vZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vZGNfZWRpZC5oICAgfCAxMSArKysrKysrKysrKw0KPj4+ICAgIC4uLi9k
cm0vYW1kL2Rpc3BsYXkvZGMvbGluay9saW5rX2RldGVjdGlvbi5jICB8IDE3ICsrKy0tLS0tLS0t
LS0tLS0tDQo+Pj4gICAgNCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxNCBkZWxl
dGlvbnMoLSkNCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9kY19lZGlkLmMNCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9kY19lZGlkLmgNCj4+Pg0KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL01ha2VmaWxl
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9NYWtlZmlsZQ0KPj4+IGlu
ZGV4IDczMjliOGNjMjU3Ni4uMDljYjk0ZDhlMGU0IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vTWFrZWZpbGUNCj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL01ha2VmaWxlDQo+Pj4gQEAgLTM5LDYgKzM5
LDcgQEAgQU1ER1BVRE0gPSBcDQo+Pj4gICAgCWFtZGdwdV9kbV9wc3IubyBcDQo+Pj4gICAgCWFt
ZGdwdV9kbV9yZXBsYXkubyBcDQo+Pj4gICAgCWFtZGdwdV9kbV9xdWlya3MubyBcDQo+Pj4gKwlk
Y19lZGlkLm8gXA0KPj4+ICAgIAlhbWRncHVfZG1fd2Iubw0KPj4+ICAgIGlmZGVmIENPTkZJR19E
Uk1fQU1EX0RDX0ZQDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vZGNfZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9kY19lZGlkLmMNCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDAwMDAw
MDAwMDAwMC4uZmFiODczYjA5MWY1DQo+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vZGNfZWRpZC5jDQo+Pj4gQEAgLTAsMCAr
MSwxOSBAQA0KPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+Pj4gKyNpbmNs
dWRlICJhbWRncHVfZG0vZGNfZWRpZC5oIg0KPj4+ICsjaW5jbHVkZSAiZGMuaCINCj4+PiArDQo+
Pj4gK2Jvb2wgZGNfZWRpZF9pc19zYW1lX2VkaWQoc3RydWN0IGRjX3NpbmsgKnByZXZfc2luaywN
Cj4+PiArCQkJICBzdHJ1Y3QgZGNfc2luayAqY3VycmVudF9zaW5rKQ0KPj4+ICt7DQo+Pj4gKwlz
dHJ1Y3QgZGNfZWRpZCAqb2xkX2VkaWQgPSAmcHJldl9zaW5rLT5kY19lZGlkOw0KPj4+ICsJc3Ry
dWN0IGRjX2VkaWQgKm5ld19lZGlkID0gJmN1cnJlbnRfc2luay0+ZGNfZWRpZDsNCj4+PiArDQo+
Pj4gKyAgICAgICBpZiAob2xkX2VkaWQtPmxlbmd0aCAhPSBuZXdfZWRpZC0+bGVuZ3RoKQ0KPj4+
ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pj4gKw0KPj4+ICsgICAgICAgaWYgKG5l
d19lZGlkLT5sZW5ndGggPT0gMCkNCj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0K
Pj4+ICsNCj4+PiArICAgICAgIHJldHVybiAobWVtY21wKG9sZF9lZGlkLT5yYXdfZWRpZCwNCj4+
PiArICAgICAgICAgICAgICAgICAgICAgIG5ld19lZGlkLT5yYXdfZWRpZCwgbmV3X2VkaWQtPmxl
bmd0aCkgPT0gMCk7DQo+Pj4gK30NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9kY19lZGlkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2RjX2VkaWQuaA0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi43ZTNiMTE3N2JjOGENCj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9kY19lZGlkLmgNCj4+PiBA
QCAtMCwwICsxLDExIEBADQo+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8N
Cj4+PiArDQo+Pj4gKyNpZm5kZWYgX19EQ19FRElEX0hfXw0KPj4+ICsjZGVmaW5lIF9fRENfRURJ
RF9IX18NCj4+PiArDQo+Pj4gKyNpbmNsdWRlICJkYy5oIg0KPj4+ICsNCj4+PiArYm9vbCBkY19l
ZGlkX2lzX3NhbWVfZWRpZChzdHJ1Y3QgZGNfc2luayAqcHJldl9zaW5rLA0KPj4+ICsJCQkgIHN0
cnVjdCBkY19zaW5rICpjdXJyZW50X3NpbmspOw0KPj4+ICsNCj4+PiArI2VuZGlmIC8qIF9fRENf
RURJRF9IX18gKi8NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2xpbmsvbGlua19kZXRlY3Rpb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9saW5rL2xpbmtfZGV0ZWN0aW9uLmMNCj4+PiBpbmRleCA4NjNjMjRmZTExMTcuLjM0NDM1NmUy
NmY4YiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvbGlu
ay9saW5rX2RldGVjdGlvbi5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2xpbmsvbGlua19kZXRlY3Rpb24uYw0KPj4+IEBAIC00OCw2ICs0OCw4IEBADQo+Pj4gICAg
I2luY2x1ZGUgImRtX2hlbHBlcnMuaCINCj4+PiAgICAjaW5jbHVkZSAiY2xrX21nci5oIg0KPj4+
ICsjaW5jbHVkZSAiZGNfZWRpZC5oIg0KPj4NCj4+IFRoZXJlJ3MgYSBwcm9ibGVtIHdpdGggdGhl
IGhlYWRlciBsb2NhdGlvbi4gIElmIHlvdSdyZSBuYW1pbmcgaXQgZGNfZWRpZC5oDQo+PiBidXQg
cHV0dGluZyB0aGUgaGVhZGVyIGluIGFtZGdwdV9kbS8gZGlyZWN0b3J5IHRoZW4gaXQncyBvbmx5
IGdvaW5nIHRvDQo+PiBjb21waWxlIGZvciBhbWRncHUuDQo+Pg0KPj4gSSB0aGluayBkY19lZGlk
LmggbmVlZHMgdG8gZ28gaW50byBkYy8gZGlyZWN0b3J5Lg0KPiANCj4gSGV5IE1hcmlvLA0KPiAN
Cj4gREMgaXMgc2hhcmVkIHdpdGggb3RoZXIgT1NlcywgYW5kIHNvbWV0aW1lcywgd2UgbmVlZCB0
byBmaW5kIHdheXMgdG8NCj4gbWFpbnRhaW4gdGhpcyBzeW5lcmd5IHdpdGggc29tZSB0cmlja3Mu
IE9uZSBvZiB0aGVtIGlzIHRvIGltcGxlbWVudCBhDQo+IHNldCBvZiBmaWxlcyB3aXRoIHN0YW5k
YXJkIGZ1bmN0aW9ucywgYnV0IHRoZXNlIGZpbGVzIGdldCBkaWZmZXJlbnQNCj4gaW1wbGVtZW50
YXRpb25zIHBlciBPU2VzLiBPbmUgZ29vZCBleGFtcGxlIG9mIHRoaXMgYXBwcm9hY2ggd2FzIHRo
ZQ0KPiBpbnRyb2R1Y3Rpb24gb2YgdGhlIGBkY19mcHUuW2N8aF1gIGZpbGU6DQo+IA0KPiAgIGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9hZ2Q1Zi9saW51eC8tL2NvbW1pdC85NmVlNjM3
MzBmYTMwDQo+IA0KPiBUaGUgaWRlYSBpcyB0aGF0IGV2ZXJ5IG90aGVyIE9TIGNhbiBpbXBsZW1l
bnQgdGhlIGRjX2ZwdS5jIGZpbGUgYXMgdGhleQ0KPiB3YW50LCBhbmQgd2UgbWFpbnRhaW4gdGhl
IHNhbWUgaW50ZXJmYWNlLiBUaGUgc2FtZSBpZGVhIGFwcGxpZXMgdG8gdGhpcw0KPiBwYXRjaC4g
V2Ugd2FudCB0byBrZWVwIGFsbCB0aGUgZHJtLXNwZWNpZmljIHRoaW5ncyBpc29sYXRlZCBpbiB0
aGUNCj4gYW1kZ3B1X2RtLCBjYWxsIHRoZSBnZW5lcmljIGZ1bmN0aW9ucyBpbiBEQywgYnV0IG90
aGVyIE9TZXMgd2lsbCBkbyB0aGUNCj4gc2FtZSB3aXRoIHRoZWlyIHNwZWNpZmljIGltcGxlbWVu
dGF0aW9uLiBBZGRpdGlvbmFsbHksIEkgdGhpbmsgdGhhdA0KPiBrZWVwaW5nIHRoZSBkY18gbmFt
ZSBpbiB0aGUgYW1kZ3B1IGZvbGRlciBpcyBhbHNvIGEgZ29vZCBpbmRpY2F0aW9uIG9mDQo+IHRo
aXMgYXBwcm9hY2guDQo+IA0KPiBUaGFua3MNCj4gU2lxdWVpcmENCg0KU2lxdWVpcmEsDQoNClRo
YW5rcyBmb3IgdGhlIGNvbW1lbnQgYW5kIGNsYXJpZnlpbmcgdGhlIHNpdHVhdGlvbi4gIFlvdSBr
bm93IHRoaXMgYXJlYSANCmJldHRlciB0aGFuIG1vc3QgcGVvcGxlLCBhbmQgdGhhbmtzIGZvciBl
eHBsYWluaW5nIGl0IHRvIG1lLg0KDQpUSGFua3MsDQoNCj4gDQo+Pg0KPj4+ICsNCj4+PiAgICAg
Ly8gT2Zmc2V0IERQQ0QgMDUwRWggPT0gMHg1QQ0KPj4+ICAgICNkZWZpbmUgTVNUX0hVQl9JRF8w
eDVBICAweDVBDQo+Pj4gQEAgLTYxNywxOCArNjE5LDYgQEAgc3RhdGljIGJvb2wgZGV0ZWN0X2Rw
KHN0cnVjdCBkY19saW5rICpsaW5rLA0KPj4+ICAgIAlyZXR1cm4gdHJ1ZTsNCj4+PiAgICB9DQo+
Pj4gLXN0YXRpYyBib29sIGlzX3NhbWVfZWRpZChzdHJ1Y3QgZGNfZWRpZCAqb2xkX2VkaWQsIHN0
cnVjdCBkY19lZGlkICpuZXdfZWRpZCkNCj4+PiAtew0KPj4+IC0JaWYgKG9sZF9lZGlkLT5sZW5n
dGggIT0gbmV3X2VkaWQtPmxlbmd0aCkNCj4+PiAtCQlyZXR1cm4gZmFsc2U7DQo+Pj4gLQ0KPj4+
IC0JaWYgKG5ld19lZGlkLT5sZW5ndGggPT0gMCkNCj4+PiAtCQlyZXR1cm4gZmFsc2U7DQo+Pj4g
LQ0KPj4+IC0JcmV0dXJuIChtZW1jbXAob2xkX2VkaWQtPnJhd19lZGlkLA0KPj4+IC0JCSAgICAg
ICBuZXdfZWRpZC0+cmF3X2VkaWQsIG5ld19lZGlkLT5sZW5ndGgpID09IDApOw0KPj4+IC19DQo+
Pj4gLQ0KPj4+ICAgIHN0YXRpYyBib29sIHdhaXRfZm9yX2VudGVyaW5nX2RwX2FsdF9tb2RlKHN0
cnVjdCBkY19saW5rICpsaW5rKQ0KPj4+ICAgIHsNCj4+PiBAQCAtMTEwNSw4ICsxMDk1LDcgQEAg
c3RhdGljIGJvb2wgZGV0ZWN0X2xpbmtfYW5kX2xvY2FsX3Npbmsoc3RydWN0IGRjX2xpbmsgKmxp
bmssDQo+Pj4gICAgCQkvLyBDaGVjayBpZiBlZGlkIGlzIHRoZSBzYW1lDQo+Pj4gICAgCQlpZiAo
KHByZXZfc2luaykgJiYNCj4+PiAgICAJCSAgICAoZWRpZF9zdGF0dXMgPT0gRURJRF9USEVfU0FN
RSB8fCBlZGlkX3N0YXR1cyA9PSBFRElEX09LKSkNCj4+PiAtCQkJc2FtZV9lZGlkID0gaXNfc2Ft
ZV9lZGlkKCZwcmV2X3NpbmstPmRjX2VkaWQsDQo+Pj4gLQkJCQkJCSAmc2luay0+ZGNfZWRpZCk7
DQo+Pj4gKwkJCXNhbWVfZWRpZCA9IGRjX2VkaWRfaXNfc2FtZV9lZGlkKHByZXZfc2luaywgc2lu
ayk7DQo+Pj4gICAgCQlpZiAoc2luay0+ZWRpZF9jYXBzLnBhbmVsX3BhdGNoLnNraXBfc2NkY19v
dmVyd3JpdGUpDQo+Pj4gICAgCQkJbGluay0+Y3R4LT5kYy0+ZGVidWcuaGRtaTIwX2Rpc2FibGUg
PSB0cnVlOw0KPj4NCj4gDQoNCg==
