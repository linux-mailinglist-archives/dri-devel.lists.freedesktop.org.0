Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4BBDB564
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 22:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64AF10E23A;
	Tue, 14 Oct 2025 20:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Dys5noW6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9FC10E23A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 20:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VE/is5D4aSoYOd72iEjR8VADbXkoTqhhaZvZ9Aenaj1R13c84RP+yIA3TWPL6hzh5j77EXjZgKhWW5iXXKshxaX+ik0Du8madu4VzZeOu686NnpuQGJn9RmGHhNaUdRxHPRzl7eV9NrZA8/SyHBOaaqYultPwrvMFvgMFhMG+W1NVkpbpVyTyjETq0owqkIqkraz+0O4AHWOzQEf0NFkvgvSc8e4TqIHCRBEZgzfV3OPZv7+hGw5t7boF6/3BnS+ec13ACTJDM/nBcvqC2FqCDIKeKiv89Alj0dk/dZJwHyzd3jh/8BjNlkNn+fT76yrrnlsjNK6GtUy4580MpDNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7l4oaHLtBQb455wWQhu6/wgmvn7crrBZKYmkjXBIcyA=;
 b=v3/T9+f+74bthnnBjAHTAu1UBuVYN3GGzV4QD/YRuo1v68VU7XyWbpyGw8fpc45/Za0O+pS8xU8Uq9pQj0w8zNU+XmvwpI+HIoeOVqK/lhW3rUZElpmzV0Updgz63mCTM8z9Yb/c+vQYnC91Q8cVt2AXqrmH/dAVBXkw9euKxCq4rxoxW+labJbi7w04Utw9grG+klGEQuLIOpS5Hjb5thWd1tS31F/eFaEq2vDL7fBX8miTpeMLTYjjVWc2XTaZR8bWDkoL+34DOH0qMr6G7C7eN7w57FGksjBZ7F+5fQN8wk5CjGDEUTSECiVIFzgpufeUiJLuuv0HnBBwbBA6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l4oaHLtBQb455wWQhu6/wgmvn7crrBZKYmkjXBIcyA=;
 b=Dys5noW6CnGHQSb6ECmL9Yt3E4VTf463JK2Aj1eBHCA54wemhXgj0fC6QiJbLprKgLqDtIXa3D3TmeWjeyaJv67A4JLGHqH8jhhtFmUgdfyoanHO1PZRs2wVlKlsH/9AwFR5PsmRlgh4Lh+MqrDifY+bsWfOO8EA7AHlGwjbh14=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by CY8PR12MB7147.namprd12.prod.outlook.com (2603:10b6:930:5d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 20:56:48 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 20:56:48 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Thread-Topic: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Thread-Index: AQHb53L5eS0Zbjv6x0+FvyDSoajsQrQXUQ+AgAQK6QCAAAUPgIAAbGUAgACob4CAplI4cA==
Date: Tue, 14 Oct 2025 20:56:48 +0000
Message-ID: <MW4PR12MB7165061E0765E5B0C9C0E6DFE6EBA@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630082123.GA23516@pendragon.ideasonboard.com>
 <21227b4e-d345-4e12-bbfb-b2ab5330d0d2@topic.nl>
 <MW4PR12MB7165259AD14396697AE2A0D1E641A@MW4PR12MB7165.namprd12.prod.outlook.com>
In-Reply-To: <MW4PR12MB7165259AD14396697AE2A0D1E641A@MW4PR12MB7165.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-01T00:52:11.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|CY8PR12MB7147:EE_
x-ms-office365-filtering-correlation-id: e9b3ddde-8479-4145-c403-08de0b643111
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?d3pmYUh6ZmJBS0szeFYvdnUwZlI0cStYZ2YxbGV3OVUwZWZwVnV3a3UwYytK?=
 =?utf-8?B?bHRjUXc4Q1ovQmdzeUtPbjhCeUZpdWQrQkpvVjQwbTV2VDNuTktiU0VqUGVO?=
 =?utf-8?B?MXI0Q3lkTGpDd3d1RFpzMzRUQllhdk1xaktqMjlWV2hoL3dqVkVXZEthWGNP?=
 =?utf-8?B?MGcyVVpmZzJqL3Qxd3FCTXQxSit0dnE0WENzRVJPdlRsV0hGNkp0ZFg3RmhQ?=
 =?utf-8?B?OU84TlhkUGdiQzBOVFUzNk93WlhRUkhCaG9UREgxYXF2bjR2WHQ3NTNzVjRV?=
 =?utf-8?B?VVlJWmdzelRBMWFwRkJZSjdMc21xY0NxZW1zc2F1T0RWK1Q0TnNxb1dTT0JV?=
 =?utf-8?B?TXpYdjR0U1JOT09JUFZNdWZ2YzdGNU44bVdhcTMwT2tEU3Rnc094U3duNkZV?=
 =?utf-8?B?amJRSXdPRHEyTTQzWWQzOFNTY255NnVTTnh1V09HZFozbnBLaFpFVVArWGla?=
 =?utf-8?B?ME5GYi9aTTVxMXJlWUNGYi82emFXTFQ0WnRLU3pqRElBR2tyVWhrWWVUak9X?=
 =?utf-8?B?c3I1QTJ4Z2FyZ1lEdE5BK3dkQXk4NFYzZHpZZ3labzdQNGdDOElodk5iWXpE?=
 =?utf-8?B?YTBCTkdqbkkweFhwRzREVUN0MUZrUVQ0L3lScnhONXhFQlFkYUVCaGhvNXVm?=
 =?utf-8?B?OEJBdFg0aTdoME50NjVDMEphekwwWWZ4R0l6N2RDM3l4VXJlT3pFUzl1Q3N6?=
 =?utf-8?B?WitzNEVmQmNZdzl1a29VdDVkOTdKRjNJR3JwQ0pkcjVwUlJWVGdnRTV1Zk43?=
 =?utf-8?B?TitubU0yZUF4a0kwdHZSQmtEVG93bFhwMW5iY3lYZzF2VElsREhPbGFvdzlu?=
 =?utf-8?B?YnIwMnlHd2hlcXViRHI2VTZ6Z0ZSRVcrNlQwV1VSRUdYdXE5b01DaUM4a3Vt?=
 =?utf-8?B?a1lHZE9YTlVzdlF4T0FhRFV4TDBPbU9HSGhxYnloay9NT0R3dnNTRnFjN1NG?=
 =?utf-8?B?WTRkUHJ3VHc3ejdVd0IxT1lQMmhUNkZyeURrZnMrOXB1TlVUTEVpTlFEY0wz?=
 =?utf-8?B?S1c4b2hjNjlpeXAzdHRqdkE5TWEvdU9GdFdUdkQzcHNHQWgwZ05HMmgrdWVP?=
 =?utf-8?B?enloVitUd01qZmR1ZUREUnpEZW1hUEpFT1ZLUjZsWDIza3ZTOS9kUjdBQnJi?=
 =?utf-8?B?V3ZlVnplOUxkTHltL2Z4OC9obzZnSkZMWktYSmRDNE9ZM0NMQ0Q5blVKTW5Z?=
 =?utf-8?B?RGVsbFR2OTJaZ0tkUW8wUXJPdWpMR2ZYN1BFeVhaWVM3aDVhSW1SNjdtZlFt?=
 =?utf-8?B?UnlLK1dINEsvTlRSc3p1SGhmS2VSNzBmMFRzOEszWW5Fd08yVkVjSndWSU9T?=
 =?utf-8?B?eVN6RjFQd2hJTnFXOEVVcC9IZHlZZ3VjS0ppNExBR3Vxd0FudkxHbllGbXJW?=
 =?utf-8?B?N01XcUg3Y2wvenV2WkNnUGFFQlh3Y0tjUVFIVEhTQllKWmxWNzN2K09vTTBT?=
 =?utf-8?B?UU9uNzJrd21jQVdqU1c1KzFDMk4raHF2dnZZRDhFN1pEK0hlWk04bzlPbFhV?=
 =?utf-8?B?R2ZoRUNYRUtFa1FGUUlYRFFlWEM1Q2xETm9OL2FNbk5wTVMwTS9IYUJNYUIv?=
 =?utf-8?B?RXNaK1AzMFNXdzFvNjRSZEUxSEwyY2k3RU5uTU9XSzVqeHU5TzVRR29iZVJE?=
 =?utf-8?B?eUEzMkJPTnQxS1FMLzZsOVYyMXVDVHVjU1NVY29waWRiQldSMlB3NTFiZXR1?=
 =?utf-8?B?U3FpcHR6NmVwTTFUWGl0STJTVmpEWmFqKzQ3NXQxbm5aZ0w3OG41VHJnN0R1?=
 =?utf-8?B?eUViTm1jN2M3ZU1NTWNEdmFUWXMvbGVZWDhqdzBmSGlUbGxsSHFRTWRobXI2?=
 =?utf-8?B?KzlFQk5JL0Y4YlZKMVNrcE5kNDZEbmRvaFN6S3dPTitwZVFIS0VBV01ORFhB?=
 =?utf-8?B?Z1BhVXMxcU93WHdZMGJsNm5pbndOM2FsOGNiZkc3dlpELy82b084N3M3Slp1?=
 =?utf-8?B?N2oyZWl3M0NWZkpoOXUrOVFWSGVHTzJiWnBHekVkWjRLYUpzMjVvc1I0VDUz?=
 =?utf-8?B?NlFyZmE4bE9nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0ZKUlBMc01zY0xtVjNWMXlkek9ZQXJSbm51a3I0YmZTcUVURGZEQ01xRlJm?=
 =?utf-8?B?SDZxYmNsNlIwN0lHeERvTzZ2NTJaWDc1OEV2U2FGNlVlb0FBWnltNWFHbytF?=
 =?utf-8?B?dE82enRuc3ROeXZYb25WS1MzMXRnQi9uUUxXVW9TWVVHaitkMm96UU5ZQ082?=
 =?utf-8?B?b3I1SElrNjZrcS85YTMrWjZnTXc4cUZKNVdmc1djRHNma2tnK1JhamhuQU1k?=
 =?utf-8?B?OFIxME5KL1VyQUlad0IxNnlLdldwWmJrY2F0aGxBelFxbm9QYUxCWXNQcTRK?=
 =?utf-8?B?cG9STDBxTFRacnV2YjY3VXRyQVlKbHE5Q0Z1SDJsUFVJZUJKdUlWY3lpUjBy?=
 =?utf-8?B?ZDNKUnE0bVJ1UmRiOUNiSExhbllvaFNReXBWcFh3UzNob3ZqYlNBVkN3MktE?=
 =?utf-8?B?NGFxMzFBcThhQ0ZCUS9GUGhId2g0NUdWU3J1RzVxUHYzcDc4QTI1VDB3TzZa?=
 =?utf-8?B?aEtGd0JlWVUvcWIxdkhuc0dvaVhDais0QVJNZmxLQmFBYVNrUHAxM0xxTlpE?=
 =?utf-8?B?aHV5aHhkYUhJVjFJUWF0d09MSDFiNjhhUXYrcyt2ZDNyNC9XUVhPbWt0bkVF?=
 =?utf-8?B?VWcwY1lLcjBaS21JbEZjODdoV3k1ZWhTQzV0SFUzSW9YSHpxd3RRcVQ4bXRs?=
 =?utf-8?B?RUVRd0hBc2phdlgrdkxNNGVqRGpYOXVicmkrSklKaXNFcUsrKy80S1U1djdS?=
 =?utf-8?B?a2FkU0tqajF1dGlqRVdka2Rhd0NqcEE5RTZlcUNnVDBmVXdIOGhJTmhlaVQ2?=
 =?utf-8?B?OTdPQjlranVEVkYzQW8rOHBXdW5BaG5ubnlMbnpUL0xINUpsSnQzVFE3TFc2?=
 =?utf-8?B?Ymdtb3ppS1NjUmVqaHJ3WDFJTTlQWDI2ZGJwK0xJQWppSFExMjNFYjhWcW1v?=
 =?utf-8?B?RGF3b0YxUzNOcTg5QXVEazI5dnlGUXkrUmtKV0xjd0lRZUhKUDZIN3hobmF2?=
 =?utf-8?B?d1Rxb0dhT3FPMUxBdkljUS9lVDZQOVUySnZFa09lcFJXOHpsTU56TWYzS0Z3?=
 =?utf-8?B?VHZSM1pqNVdyQUs3RXhCSHBuYmwzYzNpdUcwV2w4bDRMR3F5eU1yQktzelNL?=
 =?utf-8?B?UnhkcWt0NXdZOExicWNyeHQ3cjRHdVI1eHlrZ1ozMEhoYTB1M0xsQnB1TUZ1?=
 =?utf-8?B?NENlOGFTZ0x0dW1rdUgreU5mWlVxc3dEUEZHb1ZOVHdWb29kd1k5Q3ZZaHpj?=
 =?utf-8?B?cU1oay9GZHMzV1FOeVd0Y2RHNlpVTStXc0ZkR3A0eUM5WUNDcGZjS0w5Ry8v?=
 =?utf-8?B?Tm50R1p3SFhaS3FMVyszMkV5bXNtT2VQN0tJdTBTcEtnaVluditJL0c2MzVS?=
 =?utf-8?B?L0pIOVh3R1VVQ1JONVB6QXlMWUJGNkJTYkpXMW9mR21mVXFmMXpTUVdRWU9G?=
 =?utf-8?B?SlY5SUNxTVZnOEtmOENDbjdDTzZ6bEtqM0RVeVlPMVhDWnMyRFk2bGwvenk2?=
 =?utf-8?B?K2xGUGF3Qk9rMHJUdUF3WFEyNDhRcHNjMjg3amR2emJKcTVMcmZZOXhyaUtT?=
 =?utf-8?B?U3dIK1B0d2U5bDNKclNFY2NiUURaZFlhMUVvRExlbzdJeXVVeG1tTDhQdzVs?=
 =?utf-8?B?U0MwcGJzNVUybTlaYVdvN3BrdktDK0paeVJJZXBXdXNaeHgvdHU2UnB2R0oz?=
 =?utf-8?B?eDg4aStJenR5RGZpOG1xdC9oV1hOR2xjVEJNZVBmMmVIN2NJS0RFbUh0cVpD?=
 =?utf-8?B?bUtBVjA1eHVPaEJxeG42WlJVVy9Bdjh4YllIWmdsc0tyWUJxRFJydWtUSjVR?=
 =?utf-8?B?OCtaRGxIdFc5KzVPWkc0T0ZaQzVGNDVYNGFhaGFpUFc5YUszQkgzT3UwVmFy?=
 =?utf-8?B?TjBZb0lqak5xcW00c2dZZ1l4S0wweG45YnJhZkp2Q2Z6TktJUWRMUzBlREVY?=
 =?utf-8?B?UDJkSlRnOGphOWNOdHdrU01iZmNCTWFOZzZrZ0ppNHFtSmxwZUI4MU81blZH?=
 =?utf-8?B?MGtyZ0NpV1pUcU84WUtMT2c2S0RCTHVGbzVTV1ZCeXlEVUU1blhKZ0hRbTBk?=
 =?utf-8?B?MGtTTEp4emMzaUViZG16MDJxNFNXZm82Q0FiN01UWG9xbXJ6RU5uN3R1bFZD?=
 =?utf-8?B?Nng1VEloTGhSUmVjdFNVVnRUaUdoc1JGbXVPQXFYTDVzL2RYQTI2QjZCTDMy?=
 =?utf-8?Q?e30Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b3ddde-8479-4145-c403-08de0b643111
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 20:56:48.0685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxD0qkgpD2RvG6sq1riP1dn56AdYQvQaJElAxnraiZPV7jd/rlXYUtlbMMPupahTgn/O6537nKYNEsVfXzwVlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7147
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgQWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtseW1l
bmtvLCBBbmF0b2xpeQ0KPiBTZW50OiBNb25kYXksIEp1bmUgMzAsIDIwMjUgNjowMyBQTQ0KPiBU
bzogTWlrZSBMb29pam1hbnMgPG1pa2UubG9vaWptYW5zQHRvcGljLm5sPjsgTGF1cmVudCBQaW5j
aGFydA0KPiA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNv
bT47IE1hYXJ0ZW4NCj4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+OyBNYXhpbWUgUmlwYXJkDQo+IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBTaW1laywgTWljaGFs
IDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IFNpbW9uYQ0KPiBWZXR0ZXIgPHNpbW9uYUBmZndsbC5j
aD47IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsNCj4gVG9taSBWYWxr
ZWluZW4gPHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+OyBsaW51eC1hcm0tDQo+IGtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+
IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybTogeGxueDogenlucW1wX2RwOiBTdXBwb3J0DQo+IERS
TV9GT1JNQVRfWFJHQjg4ODgNCj4NCj4gSGkgTWlrZSwNCj4NCj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTWlrZQ0KPiA+IExvb2lqbWFucw0KPiA+IFNl
bnQ6IE1vbmRheSwgSnVuZSAzMCwgMjAyNSA3OjQ5IEFNDQo+ID4gVG86IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47
DQo+IE1hYXJ0ZW4NCj4gPiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT47IE1heGltZSBSaXBhcmQNCj4gPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgU2ltZWssIE1p
Y2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBTaW1vbmENCj4gPiBWZXR0ZXIgPHNpbW9uYUBm
ZndsbC5jaD47IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsNCj4gPiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT47IGxpbnV4LWFy
bS0NCj4gPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybTogeGxueDogenlucW1wX2RwOiBT
dXBwb3J0DQo+ID4gRFJNX0ZPUk1BVF9YUkdCODg4OA0KPiA+DQo+ID4gQ2F1dGlvbjogVGhpcyBt
ZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXINCj4g
Y2F1dGlvbg0KPiA+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9y
IHJlc3BvbmRpbmcuDQo+ID4NCj4gPg0KPiA+IE9uIDMwLTA2LTIwMjUgMTA6MjEsIExhdXJlbnQg
UGluY2hhcnQgd3JvdGU6DQo+ID4gPiBPbiBNb24sIEp1biAzMCwgMjAyNSBhdCAxMDowMzoxNkFN
ICswMjAwLCBNaWtlIExvb2lqbWFucyB3cm90ZToNCj4gPiA+PiBPbiAyNy0wNi0yMDI1IDIwOjE5
LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+ID4+PiBPbiBGcmksIEp1biAyNywgMjAyNSBh
dCAwNDo1MDo0NlBNICswMjAwLCBNaWtlIExvb2lqbWFucyB3cm90ZToNCj4gPiA+Pj4+IFhSR0I4
ODg4IGlzIHRoZSBkZWZhdWx0IG1vZGUgdGhhdCBYb3JnIHdpbGwgd2FudCB0byB1c2UuIEFkZCBz
dXBwb3J0DQo+ID4gPj4+PiBmb3IgdGhpcyB0byB0aGUgWnlucW1wIERpc3BsYXlQb3J0IGRyaXZl
ciwgc28gdGhhdCBhcHBsaWNhdGlvbnMgY2FuIHVzZQ0KPiA+ID4+Pj4gMzItYml0IGZyYW1lYnVm
ZmVycy4gVGhpcyBzb2x2ZXMgdGhhdCB0aGUgWCBzZXJ2ZXIgd291bGQgZmFpbCB0byBzdGFydA0K
PiA+ID4+Pj4gdW5sZXNzIG9uZSBwcm92aWRlZCBhbiB4b3JnLmNvbmYgdGhhdCBzZXRzIERlZmF1
bHREZXB0aCB0byAxNi4NCj4gPiA+Pj4+DQo+ID4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIExv
b2lqbWFucyA8bWlrZS5sb29pam1hbnNAdG9waWMubmw+DQo+ID4gPj4+PiAtLS0NCj4gPiA+Pj4+
DQo+ID4gPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jIHwgNSArKysr
Kw0KPiA+ID4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+ID4+Pj4N
Cj4gPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5j
DQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jDQo+ID4gPj4+PiBpbmRl
eCA4MGQxZTQ5OWExOGQuLjUwMTQyODQzNzAwMCAxMDA2NDQNCj4gPiA+Pj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMNCj4gPiA+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94bG54L3p5bnFtcF9kaXNwLmMNCj4gPiA+Pj4+IEBAIC0zMTIsNiArMzEyLDExIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgenlucW1wX2Rpc3BfZm9ybWF0DQo+ID4gYXZidWZfZ2Z4X2ZtdHNb
XSA9IHsNCj4gPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAuYnVmX2ZtdCAgICAgICAgPQ0KPiA+
IFpZTlFNUF9ESVNQX0FWX0JVRl9GTVRfTkxfR0ZYX1JHQkE4ODg4LA0KPiA+ID4+Pj4gICAgICAg
ICAgICAgICAgICAgIC5zd2FwICAgICAgICAgICA9IHRydWUsDQo+ID4gPj4+PiAgICAgICAgICAg
ICAgICAgICAgLnNmICAgICAgICAgICAgID0gc2NhbGluZ19mYWN0b3JzXzg4OCwNCj4gPiA+Pj4+
ICsgIH0sIHsNCj4gPiA+Pj4+ICsgICAgICAgICAgLmRybV9mbXQgICAgICAgID0gRFJNX0ZPUk1B
VF9YUkdCODg4OCwNCj4gPiA+Pj4+ICsgICAgICAgICAgLmJ1Zl9mbXQgICAgICAgID0NCj4gPiBa
WU5RTVBfRElTUF9BVl9CVUZfRk1UX05MX0dGWF9SR0JBODg4OCwNCj4gPiA+Pj4+ICsgICAgICAg
ICAgLnN3YXAgICAgICAgICAgID0gdHJ1ZSwNCj4gPiA+Pj4+ICsgICAgICAgICAgLnNmICAgICAg
ICAgICAgID0gc2NhbGluZ19mYWN0b3JzXzg4OCwNCj4gPiA+Pj4gSSdtIGFmcmFpZCB0aGF0J3Mg
bm90IGVub3VnaC4gVGhlcmUncyBhIGNydWNpYWwgZGlmZmVyZW5jZSBiZXR3ZWVuDQo+ID4gPj4+
IERSTV9GT1JNQVRfQVJHQjg4ODggKGFscmVhZHkgc3VwcG9ydGVkIGJ5IHRoaXMgZHJpdmVyKSBh
bmQNCj4gPiA+Pj4gRFJNX0ZPUk1BVF9YUkdCODg4ODogZm9yIHRoZSBsYXR0ZXIsIHRoZSAnWCcg
Y29tcG9uZW50IG11c3QgYmUNCj4gPiBpZ25vcmVkLg0KPiA+ID4+PiBUaGUgZ3JhcGhpY3MgbGF5
ZXIgaXMgYmxlbmRlZCBvbiB0b3Agb2YgdGhlIHZpZGVvIGxheWVyLCBhbmQgdGhlIGJsZW5kZXIN
Cj4gPiA+Pj4gdXNlcyBib3RoIGEgZ2xvYmFsIGFscGhhIHBhcmFtZXRlciBhbmQgdGhlIGFscGhh
IGNoYW5uZWwgb2YgdGhlIGdyYXBoaWNzDQo+ID4gPj4+IGxheWVyIGZvciAzMi1iaXQgUkdCIGZv
cm1hdHMuIFRoaXMgd2lsbCBsZWFkIHRvIGluY29ycmVjdCBvcGVyYXRpb24gd2hlbg0KPiA+ID4+
PiB0aGUgJ1gnIGNvbXBvbmVudCBpcyBub3Qgc2V0IHRvIGZ1bGwgb3BhY2l0eS4NCj4gPiA+PiBJ
IHNwZW50IGEgZmV3IGhvdXJzIGRpZ2dpbmcgaW4gdGhlIHNvdXJjZSBjb2RlIGFuZCB3aGF0IEkg
Y291bGQgZmluZCBpbg0KPiA+ID4+IHRoZSBUUk0gYW5kIHJlZ2lzdGVyIG1hcHMsIGJ1dCB0aGVy
ZSdzIG5vdCBlbm91Z2ggaW5mb3JtYXRpb24gaW4gdGhlcmUNCj4gPiA+PiB0byBleHBsYWluIGhv
dyB0aGUgYmxlbmRlciB3b3Jrcy4gVGhlIG9idmlvdXMgIlhSR0IiIGltcGxlbWVudGF0aW9uDQo+
ID4gPj4gd291bGQgYmUgdG8ganVzdCBkaXNhYmxlIHRoZSBibGVuZGVyLg0KPiA+ID4gVGhhdCB3
b24ndCB3b3JrIHdoZW4gdXNpbmcgZ2xvYmFsIGFscGhhIHVuZm9ydHVuYXRlbHkgOi0oDQo+ID4g
Pg0KPiA+ID4+IFdoYXQgSSBnb3QgZnJvbSBleHBlcmltZW50aW5nIHNvIGZhciBpcyB0aGF0IHRo
ZSBhbHBoYSBjb21wb25lbnQgaXMNCj4gPiA+PiBpZ25vcmVkIGFueXdheSB3aGlsZSB0aGUgdmlk
ZW8gcGF0aCBpc24ndCBhY3RpdmUuIFNvIGFzIGxvbmcgYXMgb25lDQo+ID4gPj4gaXNuJ3QgdXNp
bmcgdGhlIHZpZGVvIGJsZW5kaW5nIHBhdGgsIHRoZSBBUkdCIGFuZCBYUkdCIG1vZGVzIGFyZQ0K
PiA+IGlkZW50aWNhbC4NCj4gPiA+IENvcnJlY3QsICppZiogZ2xvYmFsIGFscGhhIGlzIHNldCB0
byBmdWxsIG9wYXF1ZSwgdGhlbiB5b3UgY2FuIGRpc2FibGUNCj4gPiA+IHRoZSBibGVuZGVyLiBU
aGF0IGNvdWxkIGNvbmZ1c2UgdXNlcnNwYWNlIHRob3VnaCwgZW5hYmxpbmcgdGhlIGdyYXBoaWNz
DQo+ID4gPiBwbGFuZSB3aXRoIFhSR0Igd291bGQgd29yaywgYW5kIHRoZW4gZW5hYmxpbmcgdGhl
IHZpZGVvIHBsYW5lIHdpdGgNCj4gPiA+IGdsb2JhbCBhbHBoYSB3b3VsZCBmYWlsLg0KPiA+ID4N
Cj4gPiA+PiBHdWVzcyBJJ2xsIG5lZWQgYXNzaXN0YW5jZSBmcm9tIEFNRC9YaWxpbnggdG8gY29t
cGxldGVseSBpbXBsZW1lbnQgdGhlDQo+ID4gPj4gWFJHQiBtb2Rlcy4NCj4gPiA+IFRoZSBibGVu
ZGVyIGNhbiBpZ25vcmUgdGhlIGFscGhhIGNoYW5uZWwgb2YgdGhlIGdyYXBoaWNzIHBsYW5lIGZv
cg0KPiA+ID4gZm9ybWF0cyB0aGF0IGhhdmUgbm8gYWxwaGEgY2hhbm5lbC4gSXQgd291bGQgYmUg
bmljZSBpZiB0aGVyZSB3YXMgYSBiaXQNCj4gPiA+IHRvIGZvcmNlIHRoYXQgYmVoYXZpb3VyIGZv
ciAzMi1iaXQgUkdCIHRvbywgYnV0IEkgY291bGRuJ3QgZmluZCBhbnkgOi0oDQo+ID4gPiBJdCdz
IHdvcnRoIGFza2luZyB0aG91Z2guDQo+ID4NCj4NCj4gVW5mb3J0dW5hdGVseSwgdGhlcmUgYXJl
IG5vIHN1Y2ggZXhwbGljaXQgZmxhZyBvbiB0aGUgSFcgc2lkZS4gQWx0aG91Z2gsDQo+IHNvbWUg
YmxlbmRlciBtb2RlcyBtYXkgdHVybiBvZmYgcGVyLXBpeGVsIGFscGhhIGFzIGEgc2lkZSBlZmZl
Y3QuIExldCBtZQ0KPiBjaGVjayBpZiBJIGNhbiBmaW5kIHNvbWUgdHJpY2sgdG8gbWFrZSBpdCBo
YXBwZW4uDQo+DQoNCkFmdGVyIHNvbWUgaW52ZXN0aWdhdGlvbnMgSSBtYXkgY29uZmlybSB0aGF0
IHRoaXMgcGF0Y2ggd29ya3MsIGFuZCBpdCBpcw0Kc2FmZSB0byBhY2NlcHQgaXQuIFRoZSBaeW5x
TVAgRFAgYmxlbmRlciBpZ25vcmVzIHBlciBwaXhlbCBhbHBoYSBpZiB0b3ANCnBsYW5lIGFscGhh
IGlzIGVuYWJsZWQgKHdoaWNoIGlzIGFsd2F5cyB0aGUgY2FzZSBpbiB0aGUgZHJpdmVyKS4gU28s
IEFSMjQNCmlzIGVmZmVjdGl2ZWx5IHRyZWF0ZWQgYXMgWFIyNCBieSB0aGUgaGFyZHdhcmUuDQoN
Cj4gPiBZZXMsIG15IHByb2JsZW0gZXhhY3RseS4NCj4gPg0KPiA+DQo+ID4gPg0KPiA+ID4+IChG
b3Igb3VyIGFwcGxpY2F0aW9uLCB0aGlzIHBhdGNoIGlzIHN1ZmZpY2llbnQgYXMgaXQgc29sdmVz
IHRoZSBpc3N1ZXMNCj4gPiA+PiBsaWtlIFgxMSBub3Qgc3RhcnRpbmcgdXAsIE9wZW5HTCBub3Qg
d29ya2luZyBhbmQgaG9ycmVuZG91c2x5IHNsb3cNCj4gPiA+PiBzY2FsaW5nIHBlcmZvcm1hbmNl
KQ0KPiA+ID4+DQo+ID4gPj4+PiAgICAgICAgICAgIH0sIHsNCj4gPiA+Pj4+ICAgICAgICAgICAg
ICAgICAgICAuZHJtX2ZtdCAgICAgICAgPSBEUk1fRk9STUFUX1JHQkE4ODg4LA0KPiA+ID4+Pj4g
ICAgICAgICAgICAgICAgICAgIC5idWZfZm10ICAgICAgICA9DQo+ID4gWllOUU1QX0RJU1BfQVZf
QlVGX0ZNVF9OTF9HRlhfQUJHUjg4ODgsDQo+ID4NCj4gPg0KPiA+IC0tDQo+ID4gTWlrZSBMb29p
am1hbnMNCj4gPiBTeXN0ZW0gRXhwZXJ0DQo+ID4NCj4gPiBUT1BJQyBFbWJlZGRlZCBQcm9kdWN0
cyBCLlYuDQo+ID4gTWF0ZXJpYWFsd2VnIDQsIDU2ODEgUkogQmVzdA0KPiA+IFRoZSBOZXRoZXJs
YW5kcw0KPiA+DQo+ID4gVDogKzMxICgwKSA0OTkgMzMgNjkgNjkNCj4gPiBFOiBtaWtlLmxvb2lq
bWFuc0B0b3BpYy5ubA0KPiA+IFc6IHd3dy50b3BpYy5ubA0KPiA+DQo+ID4NCj4gLS0NCj4gVGhh
bmsgeW91LA0KPiBBbmF0b2xpeQ0KPg0KDQpUaGFuayB5b3UsDQpBbmF0b2xpeQ0KDQo=
