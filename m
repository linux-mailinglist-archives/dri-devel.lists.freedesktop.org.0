Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA348A96404
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 11:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FAC10E19D;
	Tue, 22 Apr 2025 09:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xKpqjbYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2063.outbound.protection.outlook.com [40.107.101.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6513810E19D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 09:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/ShtvVCmnQ44NF1JbW911lLX40wXQlie3FdxxDjJFgrEQOAHaSvHM6raRXxk25Xj2xVRwXQU/B/+LOrzJOVi6+mJ7qHyqhGJA4a90nE6mXIJIGTdKaoQlzrGQKGE/JIHh+f7TeBeAMLLk11x91WtIPqOO59Bp7Yffqz+msYcuX8oII8xiKWbMkDhWI8vW+fuKu0Ra2Die9fljqBzUcb4lWEtgyDSmvDtzqojikC67G97XTrHxEPZEAs9tvPelUX/vCVNYrfwZ3FuzL0J7B34OEIccu47BLhz4pPJRl9eJpAIuOl6S2WU1BmZ6eiTzHL+SjIi1136XFLN0i9qKD/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6bbKEK817/32KuWu3drd0gOiZRFKYh6X6c8DxJOJq0=;
 b=Mn1Pr760ecKwsD8EffRVWB2jUi1STOqCEa4SuV5Of0up/4RxyaPnd8ykSTeazn47JmyojsNXs2uq2Pr/qiRcFFAVFHYioxicBRlfdRG5MYrCcRHHESsbqq3sa9LRLKi0e4mK4lQbyQzuivfWLMlcCz+QuhN1zHacqma60NMI+ur1B9QCHjVPui0/Zh68ZpPsM7OnsuZ2obv3/A6oZeIBOjbkb6mbig9EsXuC2ZmKKYZzN2Ehe5RhpjtXS4M9kdXdFI3IhVDsbUpsYfCJxQI1EuSJUoptmmKkvCfgFlxUczG2R24ZvOdvUqSlPHGnal57CpSGSrfSEYS/UaHh9kKtpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6bbKEK817/32KuWu3drd0gOiZRFKYh6X6c8DxJOJq0=;
 b=xKpqjbYfV7FqzIU7tRjR3bKp0H5CvuRxy3eAjhLfflo/esM4NFQO8amB1qycXMudCNthKZFJ3lda5o3eC7h5ALQw+gmgMQd8tFVWHNERYFiiZabUaW4mLVHegFAVulhmpLCt+93s/iqt1PmBqub6ODYLMKFUOJGxN04wODQhOyg=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7945.namprd12.prod.outlook.com (2603:10b6:8:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 09:20:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8655.025; Tue, 22 Apr 2025
 09:20:20 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: AW: [PATCH] drm/fdinfo: Protect against driver unbind
Thread-Topic: [PATCH] drm/fdinfo: Protect against driver unbind
Thread-Index: AQHbsH6A9sU5gErEeEmfRpoBns43XbOvbnsR
Date: Tue, 22 Apr 2025 09:20:20 +0000
Message-ID: <PH7PR12MB5685C40A8B0058293A9A8AE783BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
References: <20250418162512.72324-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250418162512.72324-1-tvrtko.ursulin@igalia.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-22T09:20:20.051Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5685:EE_|DS0PR12MB7945:EE_
x-ms-office365-filtering-correlation-id: 3f7bdf49-50f6-41ac-e848-08dd817ee77c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?pTMjR8MtmtW0cr/4xPlJcX2xMDvtJlROyyzhOAbPiipip9DvB5yCbpoDmU?=
 =?iso-8859-1?Q?mzyVqdvWZZVHmXoPsuQsHShRoTwrd4JI9tCanbhwS/eQFyk9zyVJVUmVm8?=
 =?iso-8859-1?Q?aanzclvPMiEdESCx6aXvNm8QYY5ERBIxVgUx+vRBb5JFr8Se6L3lcHApDL?=
 =?iso-8859-1?Q?Kp000RkGMDKUpWkmYiGJUm9MVZIRCvPI7LKOYMvI8y4n4G+sEKl107nBB5?=
 =?iso-8859-1?Q?3XSuhtODcXfp51/KE66wH5+jval163wHK28mipmOVgR8Z6DAzV6EQuvfKP?=
 =?iso-8859-1?Q?efk2McfcJMpLRxhJE5fBwCjl4o0O83A65YVMgl6o7jQ7busyb+VQwWUqBA?=
 =?iso-8859-1?Q?Ih8kgTJfzvM+gjnJLw0AJTnyQu7wFzg1wgwZu/ah4LrD++4ZSgXx8Iq7yi?=
 =?iso-8859-1?Q?WoH1m+l4rEUP5M3EmCvOOOvLD1m3nFqDdaXfP5dZMi1bNpjhzahZU4EYPo?=
 =?iso-8859-1?Q?fuhsYkxitJhNLM6xvm8VLYk97luVPp7MNlwIgBmiHRyMG9wplvNjmuzQ39?=
 =?iso-8859-1?Q?lDGjVWDjrDakhEPLkXEdDgk6Q0jDUrBnY7bv9RNW+/HJJM36i8Lq+F+uSQ?=
 =?iso-8859-1?Q?LevMWdBWaDs9D7QL2Gl8vuTzlxL2nLUjS8fluINAITe5GZpCR/lem/pHyH?=
 =?iso-8859-1?Q?RdqBj+kT8zt97yvZeruO+ws4ZX2jPofI24rO+5Hz2+KjDIXyNASlkq3d9B?=
 =?iso-8859-1?Q?3oACjMb7Vy8sKcv/MVwV+FciWUB6Dr6lbZ6u7L8IVtqyUySGk98Dtfsux5?=
 =?iso-8859-1?Q?qixA51jBsG5zzgRwyJFefE3dsbAH6yIKTg4GADvS4f5xJkSO/cIJp21vGH?=
 =?iso-8859-1?Q?6TzR9MoLMcKiommAaTEkEhgieZ2cpcrXOqTeljFAKV6xdCXGlZqpr1Zg1O?=
 =?iso-8859-1?Q?H993BfU9C4IPJp9gNo/WPBeq7YcVHosd7zEtJCQsOHdKmTTS+UKorKVjQB?=
 =?iso-8859-1?Q?+wTvhcb7rDSLv7upJo+tly4QHCheJGk9VBKkjDMJKt9951ILdJQ/Zxlh/1?=
 =?iso-8859-1?Q?MwdqnqykfNsXFyyEQf99ZMWNFFzYrpGeuf8Mwz94PF6OFdMqsqfqLycMBy?=
 =?iso-8859-1?Q?JPncdkZnZ4BOF698NtHLtYpr6LSD+exi9vVz/daMe8qczt0IC28qqgid3o?=
 =?iso-8859-1?Q?vwANX9IJlrRfaMgV0ubGab/z1BEAwKuSPTfqqZJ+AMlsSL7cxGfjbQf5T9?=
 =?iso-8859-1?Q?BxXbDW1rXo5y12qB8BEEJ2S0KndElEK9hmu7E1wvO4fSYBxO+WIHitDq0T?=
 =?iso-8859-1?Q?nDF13PJR+sZ9uF4j/46unAEIQT9yzr1t6NX4ykFpyLwzMc6r9WJFbLpzp6?=
 =?iso-8859-1?Q?t/eT/tZNogl+cElTaE8uHCh8MxGl5doQjvCLLYLz3CJoNV2kmpzz4t7FyT?=
 =?iso-8859-1?Q?grCIsYK3F9cOXLhjdzdxsLh9KE/bUUlzC7MAfOMYJDEnD7M2F9bvn94QAB?=
 =?iso-8859-1?Q?bwhsFf+JloD0z6mQpkZ7GN57Mb9VKEuEifYSlrDz+I4FccnOLLpYlPavy4?=
 =?iso-8859-1?Q?HK+wY7zSlgJOg7iqkh4vz4QiNfFTDqz3D/riIBMr3lBs+GXDPJCdxqMA6Y?=
 =?iso-8859-1?Q?VKBcQso=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8xHonnkcfdEH3lfsFollrGR0Q+yYryEke5gjyJlzMqJJWpZWcTcOBQ+1aI?=
 =?iso-8859-1?Q?7uYzQIdLC2utBrerDq7/GJtsJsF6syiy0B4pPXk33mbJM501xCvkMoTxtM?=
 =?iso-8859-1?Q?hqwDxSI5PkvAURVKzga/8mfjPu6wwhzlL4WT+hYVfq+6ktopD9Duqmed5v?=
 =?iso-8859-1?Q?Itu0pRSNzGX1i/TGpc3SGg8mjk4BGG4iB1nO/ZcOQld3GZ130RYfhF0TG0?=
 =?iso-8859-1?Q?eSVpRvngHZ5EcrLxyBZos8PH+yOfxmfS2Hnkzdf6Vx594uDu3ZMaoagoNr?=
 =?iso-8859-1?Q?u2RDQpqR18SNiNyqdlM4gLZTOLgx62UxzWFHEORuX24nMM7L6/7iQLdAwz?=
 =?iso-8859-1?Q?lut8fo/X58aB4tRV/UWzrY4xnVGBfE1YLpcwwEWLm7oiXnromgLwlLi5gL?=
 =?iso-8859-1?Q?ipY1IkzOtgFe6cE9mkW2mnGRLqhrVmVrsU5WhBbB3HvLHICXIWT0dQO2zS?=
 =?iso-8859-1?Q?/20gskKSj4tnjk9IXgZ+/1UUQsxG+rmuSh9nmhVAChA+kovUyIBhKwlIKY?=
 =?iso-8859-1?Q?cwG8xnNjkVgTRMqXhBvwSbUvGnT1bOq6WDjz81Pgb74rmbcuvblzpzFlbp?=
 =?iso-8859-1?Q?jDJw9fmWqbXRYpVpr7wW8mZ09ogz8Zz4vBn06Td065o9IPjeV+zrMJB9Iw?=
 =?iso-8859-1?Q?fmg/plRzz09370PYlfduvrXQmhXpLA2/MJFdpK+4AG9qBjseVPjhEzmIGV?=
 =?iso-8859-1?Q?3ha8KSJ9gMfUKzZoQZKAeqHfIryRHK7kweQrGPQai4HPPQ9FFgyJLYsAel?=
 =?iso-8859-1?Q?/efhXbOC1LMft+4dh29m5PX82X6E7i8dKl0cpGZj3CWUKFFf451E6vgivm?=
 =?iso-8859-1?Q?aZniSPCJFI9O+3a0uWGehRbJZ1kEq4NZ3/HsPWdIT8MDpXJAiB9P4ZVWwa?=
 =?iso-8859-1?Q?S7Xr8PIOAmrc1JhKc25Wj8L/637Jj2xIAdjGv0TG3EUFOUOYxkBPVKVpVT?=
 =?iso-8859-1?Q?DfzcA3hC1boswpuHIrZQ9N0NP1iTXzpowF257rj5kJILSevsKcqxuKfyJY?=
 =?iso-8859-1?Q?9z5cJ3JHNKLKYJhO2x+3VYBRKngCDkCNwmAX1CN/heqxj/U4wLIDF6vjro?=
 =?iso-8859-1?Q?n2ulU03hDzIpwgx5Q0pbJ48ZTw7Qc1vYxie/Y9diGzzB0XvwOMvj9AmCVM?=
 =?iso-8859-1?Q?VoNlYhEr8iyciilVfrtoOmKvGk3jbfYXnwvTZ2Kxdw2JmFcD0S8QdhFch+?=
 =?iso-8859-1?Q?aJeW1XPuwTUDiYnbWnbjGK03Br89NgfF6pH5XjfJ19kl8120fjv60663ua?=
 =?iso-8859-1?Q?GUpzU6YQB/hOnkJa33yyDbuPJbIeVmIGPGKvX8eRp+76k//PEXaagK26Wz?=
 =?iso-8859-1?Q?/W+H1vIimgG9xqRONVrRup4BbQp+EHgJ6APwq8o3tz+h1rq0WFD2NtYyOd?=
 =?iso-8859-1?Q?e6gkg4bfOHOsTmgIJ9imh6QMWCa1AXMmYfiWEw9yZfZhKieJA1HhF73gHZ?=
 =?iso-8859-1?Q?Qho40GLfzwwJtWi2VnNkA+QaGxj04PF3UDxWw6Gz5JEgNlhnVMCoppgdmg?=
 =?iso-8859-1?Q?FxVGKX2QNIExqeHiNALYee/qPgtVyKlZwDoJxICuoVfN4exT8WI7DZ/q5d?=
 =?iso-8859-1?Q?SloKazHlXPohTkE4rSw/FGaLB7pOKpt6ZujFHyoaAIdmWKpM1AGk3HzDLy?=
 =?iso-8859-1?Q?LV8b/xuVyoLk8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7bdf49-50f6-41ac-e848-08dd817ee77c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 09:20:20.5542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rfP3d6AiTDD9dIh1DZqhA4iS5pbbnZeg2Txh/LQU1GMQDnhNqM6NDmM2I/mzj0VF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7945
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

[AMD Official Use Only - AMD Internal Distribution Only]

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

________________________________________
Von: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Gesendet: Freitag, 18. April 2025 18:25
An: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com; Tvrtko Ursulin; Koenig, Christian; Lucas De Marc=
hi; Rodrigo Vivi; Umesh Nerlige Ramappa
Betreff: [PATCH] drm/fdinfo: Protect against driver unbind

If we unbind a driver from the PCI device with an active DRM client,
subsequent read of the fdinfo data associated with the file descriptor in
question will not end well.

Protect the path with a drm_dev_enter/exit() pair.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian K=F6nig <christian.koenig@amd.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/drm_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c299cd94d3f7..cf2463090d3a 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -964,6 +964,10 @@ void drm_show_fdinfo(struct seq_file *m, struct file *=
f)
        struct drm_file *file =3D f->private_data;
        struct drm_device *dev =3D file->minor->dev;
        struct drm_printer p =3D drm_seq_file_printer(m);
+       int idx;
+
+       if (!drm_dev_enter(dev, &idx))
+               return;

        drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
        drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
@@ -983,6 +987,8 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f=
)

        if (dev->driver->show_fdinfo)
                dev->driver->show_fdinfo(&p, file);
+
+       drm_dev_exit(idx);
 }
 EXPORT_SYMBOL(drm_show_fdinfo);

--
2.48.0

