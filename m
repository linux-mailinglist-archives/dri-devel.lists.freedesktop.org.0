Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AC98CC58B
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 19:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6102D10E031;
	Wed, 22 May 2024 17:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mn0Co1zt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A051D10E031
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 17:31:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoYUoU3Nw/y3wMbSJGfympZzNw86zK2LHv6i5XvDt0rWyLcnwicvnl9XftUPtQ9Zquimxp4ElxIv0yie4g2Bi6KSt1MlyZjXvOysJtuNlnS04kvOU9cPuG5YAVPFwfgxcLyGbmA2qxjJxUIV1ntHQorGC78fxSwWkQ+z4ohon21dKe8IT9AxyPsdMjC8YICJF2VVbiekFjqcS/jJuKeCUABsQWy+MBEQaCQ6CVCRFClzHlHR1qvG78HId+78PvhIUtnW+5uiP3N23HcmxB3RErJ5CkX+Azi6Fl98f6+POk2LeKyPj+iDIDg/H7qNE8Lsdp4zV2+Yy1Y8f3QWOc/HIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIdpomd3RPkdah0YhoZT3DC+jPz5/qcKrVmmJWN9HE8=;
 b=ZgYxx+VQ89htc4zfEVsEh8poSFcLpeCUrTAViJ3zclxTdWvqRgb+TPWGFqdx0ZfOqoWs4w5w32KN80JV9AqhWmqe8RH/bFqRtmnIeaOmLGSpsV2ZHg1Eox8zokKTnCKAutvkHnUt3pXFGagRIe0JKo3RiafBHsOemXJtuEnEC8YMSqdGP/2L6uYE5CkiECHByKDT9KG+GtMXvnxboH4X8DUBrd58eOlUXLtEM07RNC6lCk7one+BPfCWseZW88qDn/nC2VImGSMInXAPomShodrngj2QYbk6XuXFQJFmqm5rXKoYbYsUTvDVCsa4AsgpkxzY03k+g4qPycKF9Lzwvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIdpomd3RPkdah0YhoZT3DC+jPz5/qcKrVmmJWN9HE8=;
 b=mn0Co1zt9ro5ArO3CKldwKqhp877maLpWboWP0MmJSXN7sn75CsXzA0ay3a+/7vfMvhMjWBI9VfLMVUhz5ADJUDT70egYDGCO7uhOamm3cLsZwERgYbVFgO9fB4EcwyFjdOyx7XWX4UV1a3pwma8WCiNrc25svexf19pvor9lVc=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 17:31:36 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::710d:5ae8:24f4:58dc]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::710d:5ae8:24f4:58dc%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:31:36 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Palmer Dabbelt
 <palmer@rivosinc.com>
CC: "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: RE: [PATCH] drm: xlnx: zynqmp_disp: Fix WARN_ON build warning
Thread-Topic: [PATCH] drm: xlnx: zynqmp_disp: Fix WARN_ON build warning
Thread-Index: AQHaq4s/Q5VX0gTSRUa0Jpg0XOJ0LrGjVeGAgAArYuA=
Date: Wed, 22 May 2024 17:31:36 +0000
Message-ID: <MW4PR12MB7165AB0B7208467C2F0B085DE6EB2@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240521142814.32145-2-palmer@rivosinc.com>
 <20240522144401.GA9789@pendragon.ideasonboard.com>
In-Reply-To: <20240522144401.GA9789@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|CH3PR12MB8710:EE_
x-ms-office365-filtering-correlation-id: 7834d279-7a53-427b-6b6b-08dc7a850831
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|7416005|366007|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?V3h2K0ZaclZmN05reGQyaUtubjhoNitVSzVCT1JFdzhKWXU5b1lVMk1YeUlm?=
 =?utf-8?B?Ty91UkR6YTAxSzlnMEdYSXpXOFFlRVg1d0d4TGV3YlhPVVpheXhvSThjWTE5?=
 =?utf-8?B?ZFJ4K0lTOXArRXB0bTY1alBMWnh0RG11UytJRXRNWkJjM1RHTjZQYXFBT01Z?=
 =?utf-8?B?OWpiNzRLNVVYbFVETzdqZXExMU9mQlpkY3NwNm1ld3RuVUp5RmJWcG9kTHpq?=
 =?utf-8?B?S0wyZ1RZWnZpMTdQN2F3RlUxR0xUdjNTYzhJc3lCczNyNGlpQjFuTTN5UGlj?=
 =?utf-8?B?MGlrcWlkLy8zR2Q0R0xRZ2dGVGRyYlUxTXZzQmo4RnZvS0VSSFVTNVN0YTgr?=
 =?utf-8?B?c2dwVGl6V01HMXo3SFN6YmNWZmNiVU5qQ3JqQWJqemxJLzVVRG9yU2lYMWtU?=
 =?utf-8?B?SXY1eGpkTFBjV3NSNng1TnZkUlBnTVozYUJNK2M4SUN4ek1ObGNtWXd0cG0v?=
 =?utf-8?B?eDB2MS9IckZqOXNWKzVuVSsrN1NQVGptZk5IaHNwVzBVMFU1MXYxNzV0YXVl?=
 =?utf-8?B?TzZkd1hzMTBuV3k2RTNBT083N1BKejhmSE9vdTExUlRRVXltL212RjRZdjVl?=
 =?utf-8?B?dkdJZmhWNVBKNlVLWVJkOHZDOXlxc2ZkOG5jbWxpNEZvZnBqcDJIb0dPSExC?=
 =?utf-8?B?eGgxMStvNWViWTFZdE4yZkhvdjcwa0hmZjdSNU5odDJOajFGUUtBZkFhK0J3?=
 =?utf-8?B?YS9uRjZTT0hTMGJjS3NlcXpyYWNTd2s2UitRenp4RHV5UjIyKzh0bXJpc0I1?=
 =?utf-8?B?WmVGVXpPYWpHeTR2U0k5cVhJbENYR2IvZkcreWVYMFBSdFdxZFpPbXNKdHJ6?=
 =?utf-8?B?M044NG1jTFp1V3Y4UEw3SEl5MkFRZWxIYXB4cmF1T015YXQwNjhSaWc0QUFC?=
 =?utf-8?B?MllFQkk3L2VUWTBKSUdoeHhlOHRacEZMQlpITzdocVJJdTF4VnBUcHdFUlNp?=
 =?utf-8?B?K0lTbzdwS1hUa0ViTFNkdUhUZlhicHJSa0h0Y3A2bmg3UXMzclpYM0pCaFla?=
 =?utf-8?B?OVFEckk1WFJ1OTkwMVNiMnVXMUE3dGtJTjNjeFBibHhOekFtZTlnSWhZbXRn?=
 =?utf-8?B?Q1BRdTJtcDlCVWVIckpCVUVUeTdCTXlib3p2VmR1WFYyUUJ1a0xwOTRnV0lE?=
 =?utf-8?B?bkZPK3hleFp5U0I5YWVZVzgvZ0ErUjFBNVpyTVdKMS9yT3pOc0cwMGc3ZnlV?=
 =?utf-8?B?bHppN0ZiTWpKZ29aYk9QVjlYUXlWaWhCL3RvMWsyZmdWaitKV0NCL2VkSURa?=
 =?utf-8?B?WUNxMzhJTkRPbkdhMzc5TGlZbDFYSGtDTy9ZNjY0Ukk3YmhOUnoxNk9mclpm?=
 =?utf-8?B?YmwyVGFoWVcwZ01ORU9LVFpCVlBjNE1QdXhmM0xReko4NUE5dlpJVExZNTF3?=
 =?utf-8?B?MGhUdFNPblIrcFB5TmtSVEMySExKWjlFOG5aMXhCaDRqMWoxaWNrWU5Ja0RV?=
 =?utf-8?B?UHRKUGpHaUp3WmdWUW1ScHNlb29CZDB3Q0d2bnY1ejZYYk1CR2w3SE0rU3pD?=
 =?utf-8?B?VVMzc041OEZMYTJpeGhZdUZJMytxWlpDbTZueXpDc1lBNTQ2UytjSVljOGdW?=
 =?utf-8?B?bE5oeVdLdVd2SGxkdThSZU5lZ0thRjFSaCtEVzVCbDZaaTFzcmhwRHRXUklD?=
 =?utf-8?B?N1A1RXRFc0dNYmNiVUVTREwrVEdNK21TYmp1MmtrUHRKRk8wa0NuSkMxd2pv?=
 =?utf-8?B?WXBZVGhqNnVKdFlMRWNyV05CVzdwNVdsK01nNUx1TE0zNXhhLzFzM2dnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHRjcVppbVExYlRjMWNyNFkvcjBMdktCVVFrMlBGNGl6Y24rME5YZHRPZE0x?=
 =?utf-8?B?c05RU2FST2VDSGl2WENMa0ZHMVFTQ0I2Y2UzOC9ZSEpCZC9wRDBDMVFSaGEy?=
 =?utf-8?B?Z1c3VVhMVXZBWEoyL3JOdWFocTJzRlNyditxWXJ4WUNraG5WT3lCS3Rlb0hW?=
 =?utf-8?B?cFc1eXNvTUdIWFdJRXoraXIxakdnWGZIU1JrTFU5YVRuZW9hQnBpa2N0ZjZs?=
 =?utf-8?B?UUZ4N0Q4dGFxVzJZVk1UQi8zSGNMOVVxU1FDcXREa3hHRnRCWUVEdGRTWGg5?=
 =?utf-8?B?cExiNjNNU2NBNEkwcmp6eCs1T1BxNkpac0xOZDJpYXVaaUhzU3F6Vm5hbHhR?=
 =?utf-8?B?QXZzT1pOL1NuUjJYcVQ2K1hHVldNV0I1SkpzTFJjQmdNMVFWdUQvdVV4RGtr?=
 =?utf-8?B?MEtxbGpUU0ZSV2JhRGFpN2tocmxlcCtYVWVkNmI2UVQyMkxrZi96Y2NhRFpU?=
 =?utf-8?B?a0U1QUVWVnEranphSWV4NzI2aVM5dm5SSDVTSWtROFdvdGJxMzlHaGlZQkVP?=
 =?utf-8?B?TzhqNG1CdHhUK1lKLzZURE1yUHZFa0dDMmMxSjZhUEdwMERFMVlRNUgrRzlZ?=
 =?utf-8?B?VnBzUFNRbExUWW5CQjZ0RmEwd2RqemowclJkcGVPTFlDTHVPM3l6dXNHLzEw?=
 =?utf-8?B?QmJDdnVqU013ZDlZYlJiS1RJMFMrU2ZoTnlRUGR4enA3bVJ4NEtWWllBYWNV?=
 =?utf-8?B?citqdWRnVGQ3K3V5U09iZ3hVRE5Ldk1tNGV5WHh2QVFiSUwydlFRTnhyR3VG?=
 =?utf-8?B?M3lJUjlIMmdGWHZYNG95WXZNNXQzT3lBbnJia2E3dkRlUHI2Y1NiNUVrMXZT?=
 =?utf-8?B?WXF6V3R4SGpiM1hHVTEvVlB0cEhVcm0zbi9JOGR0WEhRNWh1T2dvbUlWVU9H?=
 =?utf-8?B?VjBrMGVUZGF1ZE9qWFJ0ZVJLVWxWM0NIRWJzaEc5QUdHbHBXUi9mdUlLRmVq?=
 =?utf-8?B?d1htMTdLd1dOVkZUMnVoSmFEQyt5d2xhaSt3Z1c1RWdTcVY3UTN3YVMwYmJ1?=
 =?utf-8?B?SWx2dnNndlNvd2Ric0JTcUU1cFlWb0FIUmZQVlVWc1FSRGZxdERTZWdGOFY0?=
 =?utf-8?B?c2tuYktPR21iUmIrRDV2TDZ2bnB0THVWMVc3ZnpaK3YvU1R6UW9aNGgrbGlv?=
 =?utf-8?B?eGdZVlBJSllycjBLS3JrTG9jREFJRWVLdExBdVdaTGs4aGllRjkrMFlVd2J2?=
 =?utf-8?B?VTgrYmhYdkR0ZlNXMDN6V25FVnFzWlgzSDIwdE4wUGxMT0taSnVoMm9LT2x2?=
 =?utf-8?B?b3pCZ2lrL0hRdWw3dUo0MVpQR09MUWxsWWNidkpzYW5sb3h2SGJaZ2Q4M3ov?=
 =?utf-8?B?WFI2R3NwTERhWTUyZVF3MmVwNU54aTJDYThVYS9hdGhzUUVLS3lNUW42cnN1?=
 =?utf-8?B?TU5ybXZKdFpzc0Z3L1ZieXl0bUhYZytaZjBqRXIrTXB0MTVOVXp6eTR4WG5L?=
 =?utf-8?B?Vm1mVnZvbWpFeGJmT1RRS0NoQXRHQnZGTUJvWFR3Y29kakhuUXV2MGwxbitD?=
 =?utf-8?B?UGtWNDQyNHZEbGhyN1hBUlFyY0t4MENUVGdZZlpqSUozUFZpOWlrUVhESTI0?=
 =?utf-8?B?d0c5Z1F1NnRvSEMxYnVaWkdSS3NMcUx1Mk1hK3g1RjRyTFVHa0JNOGFoaEZJ?=
 =?utf-8?B?TnRJV1V1TWxOeWd0QXBmQm54dzV6Mi9QeEVaRkNFTGtnVjVYbVFQQmtjSFRv?=
 =?utf-8?B?azRrSHIyZ0p6VzhXVHVrZkhzNjZlWUNOUHFaZk1paDR6QzE4MkV6TXpMdlFR?=
 =?utf-8?B?YzZMdmhydy9wNTU4SmZIZThRcnlHbTZSSm9QaVRWYlNSRWNCeU1BckRyQzBI?=
 =?utf-8?B?T1UxdnNnbTNLUkhYSVF2TkhlaVpNV0ppVk1mcnZBbFFObWhjR1A0eWlyeGxS?=
 =?utf-8?B?cWx6Nkp3Tjk2aHF0RnlUS2l6M0dCNkhaN3NlMkhvWkpFeW03MzBFRXExbzBa?=
 =?utf-8?B?aUNHcHh0WjBQQUpVdWxNc3NSRUJFa0kzb1Rndm5Vb1dsS1JrREZSWFdwS21N?=
 =?utf-8?B?aFJLeDluakVnTloySmxtd3l5dHpDNVZtNmlHbkc2NjcwVTlTbG03bmZOc1p3?=
 =?utf-8?B?VW5pNDVMT0VHZmZXenE5cDliQTl4Y1ExajhqeURoNVkvVXVNWU1VZ3puTW9y?=
 =?utf-8?Q?DjBE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7834d279-7a53-427b-6b6b-08dc7a850831
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 17:31:36.6420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S/IUgOu5nWGPWzkI6HcliexZaBo4Ef5/QlpWaVJUlXHPdlHY/oFGBcoj36KP7Jp/auZLwbJBpGx1AzWbTtXFpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710
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

SGkgTGF1cmVudCBhbmQgUGFsbWVyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkgMjIsIDIwMjQgNzo0NCBBTQ0KPiBUbzogUGFsbWVy
IERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+DQo+IENjOiB0b21pLnZhbGtlaW5lbkBpZGVh
c29uYm9hcmQuY29tOw0KPiBtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb207IG1yaXBh
cmRAa2VybmVsLm9yZzsNCj4gdHppbW1lcm1hbm5Ac3VzZS5kZTsgYWlybGllZEBnbWFpbC5jb207
IGRhbmllbEBmZndsbC5jaDsgU2ltZWssDQo+IE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+
OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGtlcm5l
bCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPjsgS2x5bWVua28sIEFuYXRvbGl5DQo+IDxBbmF0
b2xpeS5LbHltZW5rb0BhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm06IHhsbng6
IHp5bnFtcF9kaXNwOiBGaXggV0FSTl9PTiBidWlsZA0KPiB3YXJuaW5nDQo+IA0KPiBDYXV0aW9u
OiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHBy
b3Blcg0KPiBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3Ms
IG9yIHJlc3BvbmRpbmcuDQo+IA0KPiANCj4gSGkgUGFsbWVyLA0KPiANCj4gKENDJ2luZyBBbmF0
b2xpeSkNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVHVlLCBNYXkg
MjEsIDIwMjQgYXQgMDc6Mjg6MTVBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+ID4g
RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+DQo+ID4NCj4gPiBXaXRo
b3V0IHRoaXMgSSBnZXQgd2FybmluZ3MgYWxvbmcgdGhlIGxpbmVzIG9mDQo+ID4NCj4gPiAgICAg
ZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYzo5NDk6MTQ6IGVycm9yOiBsb2dpY2Fs
IG5vdCBpcw0KPiBvbmx5IGFwcGxpZWQgdG8gdGhlIGxlZnQgaGFuZCBzaWRlIG9mIHRoaXMgY29t
cGFyaXNvbiBbLVdlcnJvciwtV2xvZ2ljYWwtDQo+IG5vdC1wYXJlbnRoZXNlc10NCj4gPiAgICAg
ICA5NDkgfCAgICAgICAgIGlmIChXQVJOX09OKCFsYXllci0+bW9kZSA9PQ0KPiBaWU5RTVBfRFBT
VUJfTEFZRVJfTk9OTElWRSkpIHsNCj4gPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
IF4gICAgICAgICAgICB+fg0KPiA+ICAgICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vYnVnLmg6NTQ6
MjU6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8NCj4gJ1dBUk5fT04nDQo+ID4gICAgICAgIDU0
IHwgICAgICAgICBpbnQgX19yZXRfd2Fybl9vbiA9ICEhKHgpOyAgICAgICAgICAgICAgICAgICAg
ICBcDQo+ID4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4g
PiAgICAgZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYzo5NDk6MTQ6IG5vdGU6IGFk
ZCBwYXJlbnRoZXNlcw0KPiBhZnRlciB0aGUgJyEnIHRvIGV2YWx1YXRlIHRoZSBjb21wYXJpc29u
IGZpcnN0DQo+ID4gICAgIGRyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmM6OTQ5OjE0
OiBub3RlOiBhZGQgcGFyZW50aGVzZXMNCj4gYXJvdW5kIGxlZnQgaGFuZCBzaWRlIGV4cHJlc3Np
b24gdG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcNCj4gPg0KPiA+IHdoaWNoIGdldCBwcm9tb3RlZCB0
byBlcnJvcnMgaW4gbXkgdGVzdCBidWlsZHMuICBBZGRpbmcgdGhlIHN1Z2dlc3RlZA0KPiA+IHBh
cmVucyBlbGlkZXMgdGhvc2Ugd2FybmluZ3MuDQo+IA0KPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGhh
dmUNCj4gDQo+IEZpeGVzOiBiMGYwNDY5YWI2NjIgKCJkcm06IHhsbng6IHp5bnFtcF9kcHN1Yjog
QW5vdW5jZSBzdXBwb3J0ZWQNCj4gaW5wdXQgZm9ybWF0cyIpDQo+IA0KPiA+IFJlcG9ydGVkLWJ5
OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gPiBDbG9zZXM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNDA1MDgwNTUzLnRmSDlFbVM4LQ0KPiBs
a3BAaW50ZWwuY29tLw0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPg0KPiA+IC0tLQ0KPiA+IEkgY291bGRuJ3QgZmluZCBhIHBhdGNoIGZvciB0
aGlzIGluIExpbnVzJyB0cmVlIG9yIG9uIHRoZSBsaXN0cywgc29ycnkNCj4gPiBpZiBzb21lb25l
J3MgYWxyZWFkeSBmaXhlZCBpdC4gIE5vIHJ1c2ggb24gbXkgZW5kLCBJJ2xsIGp1c3Qgc3Rhc2gg
dGhpcw0KPiA+IGluIGEgbG9jYWwgYnJhbmNoIGZvciB0aGUgdGVzdGVyLg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jIHwgMiArLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL3hsbngvenlucW1wX2Rpc3AuYw0KPiA+IGluZGV4IDEzMTU3ZGEwMDg5ZS4uZDM3YjRhOWM5
OWVhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jDQo+ID4gQEAgLTk4
MSw3ICs5ODEsNyBAQCB1MzIgKnp5bnFtcF9kaXNwX2xheWVyX2RybV9mb3JtYXRzKHN0cnVjdA0K
PiB6eW5xbXBfZGlzcF9sYXllciAqbGF5ZXIsDQo+ID4gICAgICAgdW5zaWduZWQgaW50IGk7DQo+
ID4gICAgICAgdTMyICpmb3JtYXRzOw0KPiA+DQo+ID4gLSAgICAgaWYgKFdBUk5fT04oIWxheWVy
LT5tb2RlID09IFpZTlFNUF9EUFNVQl9MQVlFUl9OT05MSVZFKSkgew0KPiA+ICsgICAgIGlmIChX
QVJOX09OKCghbGF5ZXItPm1vZGUpID09IFpZTlFNUF9EUFNVQl9MQVlFUl9OT05MSVZFKSkNCj4g
ew0KPiANCj4gVGhhdCBkb2Vzbid0IHNlZW0gcmlnaHQuIGxheWVyLT5tb2RlIGlzbid0IGEgYm9v
bGVhbiwgaXQncyBhbiBlbnVtLiBUaGUNCj4gcmlnaHQgZml4IHNlZW1zIHRvIGJlDQo+IA0KPiAg
ICAgICAgIGlmIChXQVJOX09OKGxheWVyLT5tb2RlICE9IFpZTlFNUF9EUFNVQl9MQVlFUl9OT05M
SVZFKSkgew0KPiANCg0KWWVzLCB0aGlzIGlzIGhvdyBpdCBzaG91bGQgYmUuDQoNCj4gQW5hdG9s
aXksIGNvdWxkIHlvdSBjaGVjayB0aGlzID8gUGFsbWVyLCBkbyB5b3UgcGxhbiB0byBzdWJtaXQg
YSBuZXcNCj4gdmVyc2lvbiBvZiB0aGUgcGF0Y2gsIG9yIHNob3VsZCBJIHNlbmQgdGhlIHJpZ2h0
IGZpeCBzZXBhcmF0ZWx5ID8NCj4gDQoNCkFjdHVhbGx5LCB0aGlzIGhhcyBiZWVuIGZpeGVkIGhl
cmU6DQpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lk
PWM3MjIxMTc1MTg3MGZmYTJjZmY1ZDkxODM0MDU5NDU2Y2ZhN2NiZDUuDQpMb29rcyBsaWtlIHRo
ZSBmaXgganVzdCBtaXNzZWQgdGhlIG1lcmdlIHdpbmRvdy4NCg0KPiA+ICAgICAgICAgICAgICAg
Km51bV9mb3JtYXRzID0gMDsNCj4gPiAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiA+ICAg
ICAgIH0NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQotLQ0K
VGhhbmsgeW91LA0KQW5hdG9saXkNCg==
