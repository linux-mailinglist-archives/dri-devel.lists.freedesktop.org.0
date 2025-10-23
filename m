Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E814C03AD5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 00:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B0B10E96F;
	Thu, 23 Oct 2025 22:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Ga4WT94L";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ga4WT94L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A6F10E96F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:32:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JNpw8RHAGv8DwubQpAdrEoybCKqcduAIJqcJk7TIJCq4emZD0xoDnwkVTolqRpKk8j/GfziLOON32/mNKL9ZctKOGmuGb5Gj4I6cO5ttV/MU2lbfkWvEldd9LYXvSvpPDZHR2sdowsVIL+WRzl9sHfuXG6erBoXYUSX99CW3ysgMTUanRHgrWoTeWalRQZucVJH4Yi2EzwfOQXN3Q6mDGuTk8rBgMrziaPtN8HYkUgQbOnNjiUgUgu5/WJnQIPIcJITJ3BXOTllq58jvpbaahq7GMog4biKQBxd/wD4hYyLozNDIBrGWLTfVAqUEnB0wXJUbNZ9N8clguGBF+Y5rMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcxRp9GHeoYL2hiiqQvwynXlECrb1A85/qHhCtiZd/s=;
 b=jmMc2kNrlCmQ4K/IoHiFF4fDa+wKUdxLRN38u2o2q63uKDdbwNBNztoQgACDZe+HeRxd1NEfbJVEPFGQrCIGSXdJKFLOx18eSP8vjuu+BWNFSvZd4qND2YtXXE1vt9PwknMjJrlUIQnDOc4dtM2rYY6jUEl2tGYQM+DA4PXhNZrpXbzANC5xzUm+ZpKRj7P9BT5F9eC44/F/yBXkthSu8G8QiRELN/vZRjhfgLy5TEtvEsNg1oku1rB9LXjQ7SvqIbsSflYy5BwYmI3txPRD64WpIPulfhKJVH1JpyLt+KLSD9knV1zjeFTrXB0R+58jsmQ4OkOkEnH1WI1ka28JWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcxRp9GHeoYL2hiiqQvwynXlECrb1A85/qHhCtiZd/s=;
 b=Ga4WT94LfvUTsKiA2Y/uWvQzIPBhezqFhWKIvWesMakFBKHXjQZGsWvzI88UDMnEjxwM8fv3zuSfYRSSEcMvtBXaw8XjuVtL0h/lo7rCWDi7feEzdPfIojeX573Vh0BlgFDK+zThefjGHmjIjMGvK/eLxyfirhK8M/OdV6xe4S8=
Received: from DUZPR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::17) by DB9PR08MB6427.eurprd08.prod.outlook.com
 (2603:10a6:10:25a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 22:32:02 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::8d) by DUZPR01CA0039.outlook.office365.com
 (2603:10a6:10:468::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 22:32:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Thu, 23 Oct 2025 22:32:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hE4oKisJrvnQuMXcxRb7Hi2SCidvxPT5xa7EcwLcUf0F1qRsU2J77OGtSWN/6vtNLrC66YjVGOJFTjiTmon36YoGpSxVC/3aBiCTmYequtmSTQL03YAHXRSnFIfwDQ3vEzNCw1cswPA4tLQ8t7sw3DGr0rBPVH6CxwKfqbWdgV+of/Lb82GVrhq2qdUz7Wato9qi5DLizAt11LLFdUmrn9zwKY7v75opsnLZrENXsHkuNoZg67ho0H5dJhHHT9t2jgiOo4vzsL+56v5vNilJEbmhOvpnMkG5kzuRA6OMrn48lLNCzc+xSNFQilXdkc/iqUCqNLSQZyNRe87rWdLnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcxRp9GHeoYL2hiiqQvwynXlECrb1A85/qHhCtiZd/s=;
 b=tmJq/syDPu1PvsbQL5vEoPmmaVzgqX2wRHqJTpwfmcP55JYhlb234LDJm04ad6wQCnn79GV6Xg9N0IrcIL+cwQZkDsVTvEERIbaPbsYvTKNAKwo5UzX6F/p7PsGffx8YDYx9N2iDyXcDGx4gwRdidlgUF789Kqgkjy50SfpOOqjiSOVGi7l9QTjI/IkIKLI85qoKEhDO9b9n4E+XDdkejWL9zUSXPWGF9ZDAlHaJA/X9D4dosa6XORzKa/ADbUL5zzpv3FuipbmERp0nuiXTg5vuV24tvsnKWg32XQo6CeG2FqUgfIJ50W0zJc2jnkHtqbjKkJQajXd4vnkRuPXEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcxRp9GHeoYL2hiiqQvwynXlECrb1A85/qHhCtiZd/s=;
 b=Ga4WT94LfvUTsKiA2Y/uWvQzIPBhezqFhWKIvWesMakFBKHXjQZGsWvzI88UDMnEjxwM8fv3zuSfYRSSEcMvtBXaw8XjuVtL0h/lo7rCWDi7feEzdPfIojeX573Vh0BlgFDK+zThefjGHmjIjMGvK/eLxyfirhK8M/OdV6xe4S8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB7691.eurprd08.prod.outlook.com
 (2603:10a6:10:3a5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 22:31:28 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:31:28 +0000
Message-ID: <42dd4e0f-0ac8-411d-bfdc-754fe3e8ab67@arm.com>
Date: Thu, 23 Oct 2025 23:31:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/10] drm/panthor: Implement soft and fast reset via
 PWR_CONTROL
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-8-karunika.choo@arm.com>
 <7be294e2-e6fe-4c47-8bf3-507443e3b1d5@arm.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <7be294e2-e6fe-4c47-8bf3-507443e3b1d5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::30) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB7691:EE_|DB3PEPF0000885C:EE_|DB9PR08MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: a30dc93a-1ad9-496d-12f1-08de1283fcd2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?M1B6VWgweHhOZnJVNjRxd2VOQ05hS1Rla28rVXNGbUJobkcwaHlPMEJDbGJD?=
 =?utf-8?B?N2UyYStnU1kzcWJsR1I0N25lT0YzRFZYTld2eEUrNXhKSFRYeWRFK3pyR1lu?=
 =?utf-8?B?VkNFUEdhS2REcHZiQUlPTnpNUkhiclBjNVZLei8rZXI1KzdIdXJCSUNkR2hy?=
 =?utf-8?B?OC92NlF4azdWTHZxdUs0Tkc0ajl2MGxOWnRYRFpPMUNpSzNJRDVhUERQaFov?=
 =?utf-8?B?NXh0aGlvQi9LQll5YVBRUi9IVUxOenRIZnBPZUVLOUhqc3RpQXpvQjNtY2ZC?=
 =?utf-8?B?RTYxbkNJUkdKSE92cStjSVFVQXloWm1UM1pqWWhwbzMzYmxoQ3hIOVFpK1pL?=
 =?utf-8?B?ODBKcVRFenkwNFljNmN4aXdoNk9kNHJEcFNYNDRKa09mYzhLempRZ2lmSlEw?=
 =?utf-8?B?U2hQTFkxWkp5NGJtMUZLdXZYZTZ5Njc2eEtTaUNDWmVyV0JxQ3h4Q2krVVJr?=
 =?utf-8?B?dkZZcUhqbnBCaVBaZXJaQ0puRS9Na0t4MG5iVkRrdjUwVHZaVm1qUkNNMkNr?=
 =?utf-8?B?WUVBckw0SDFaVnhaZ0NVKzhrSGxUVUo2QTBnZi83Q01sYWZMZ3ltWjlUYnBv?=
 =?utf-8?B?Ui9zTUhlUktNUnNuNTdlWHUyQzlzemtzWWs0ZnBJMnRWYnZFdmRNUHpybFRo?=
 =?utf-8?B?SVNMWjRmVFd6UXpFYURPYTFlZzRIcFF3aUJaYVNUVGRaZG1YMnJSbnhrQ2Qz?=
 =?utf-8?B?ZTA2bjZQRTZiUlh2Tmg1Ni9JMFlQbmQyZVBaZWJWclpNelNFd29mazFVL052?=
 =?utf-8?B?eC9UdFpQWVN0WmROWDZoKytOUCszd1N3cjRvR0c5cVpkeEdDb0cwMm1RUTdQ?=
 =?utf-8?B?WU9lbXJackJPSUZ0aTJZUW1uQjRXbDRxaE13OVdJaWJCUS9MK0lab0lBUzFR?=
 =?utf-8?B?K25QNXVYTmR5Q2JaeHRBdUhGNXNobzZWZ3lMRG5Ba2c0aWRPbE1BdStlREhk?=
 =?utf-8?B?MkxRQmRNZmk3VHRPdStvSXJ4MVpvT3lNWEhOTW83dTEyRi9aK2pnUDRuQ21O?=
 =?utf-8?B?dWEwd3hFcmI2VkN5WEVlZzFyL1pMRzgwSFNReHM5cHNFZUNKOURseU1UR25S?=
 =?utf-8?B?aFE2WE1NczhNd01EdHpaOUd3RHBqZnJrNGZhRitlZ2N4TzFTUFJyeEdUK05z?=
 =?utf-8?B?RzNVR21ZK09NTXFHNlhyS3ZQMnRlWlZxMGk0ZkdDMGNFeUtQUk42Y1R6TmFl?=
 =?utf-8?B?T05KY0hGOXpmZC9MaE0wYktHNEExbHp4RUxPRGxrTmt3alkzbWZwNTRqQ0c5?=
 =?utf-8?B?c1M5QS9SdS8zVGJqb0Vac1dYMTFBYis0d3F6OTNnL3YyZ3BZNURqVTJsVXhr?=
 =?utf-8?B?NDYreU14ZXZZTCtGOHFLWTRHVDRleGh0SEdGU0Y2QzhDZWhMeFJCTFVINGQx?=
 =?utf-8?B?cHZXcWx6c1ZRUUwweStwTFByL3lUTjJBcFVzcHk0SDdxWldVNTNPTy9tdGFw?=
 =?utf-8?B?QmdPMm5wMWltb1BHSm85MU1JRnArbXVrbDZYV0pGSnRYQmdRR0hBT1hlWFNH?=
 =?utf-8?B?ZVp5dldvZjdkTnUyNmNKZjZZSURjUHJmL3dFTDk4RFk3RDRsdVBWMndta3pX?=
 =?utf-8?B?NDJodWxOQkhsVnVXWkYxOHJ3SUNWcmJzV3lwV0tnMkxqcVMxdGNPSGhaZmhZ?=
 =?utf-8?B?R293ZDE0M04ycndVdExFUUt0bGxTR0RtWkVUdVRRT3pJUURuMTRXbjJQWDJn?=
 =?utf-8?B?K3NwRHJjNFFLWitOYWIzaldMSytxRFZSUGtreW9mYmFQYnEra0lsZUh1RUlF?=
 =?utf-8?B?WG8xOHdHbnlQU2RObDdhQU5qZ3o5UXdsckFiVkFVbGFDSXJaUjg2c1FmYURF?=
 =?utf-8?B?VzNhQ3c0b2duQlVSaG0yYUtMV2hNc3VnN05FeHFXc3Nnb0JVTXZ2L1FvT2c4?=
 =?utf-8?B?dE1sUktKV3VUZzJJTTNXV1ExcnRXREZCZHYwb1A0bFJkdmRtTlpkTGRnUFp0?=
 =?utf-8?Q?1UFtmyF4ikWxNwxmdIC18K8jjndQeanh?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7691
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 57ee7e95-f4b3-4f23-62ce-08de1283e867
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|14060799003|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWcvNFEyanVrdFdjQXdINTFSck1rZ1VBZTJEczYyeFAwNE9ZZjdRaWUxL2x3?=
 =?utf-8?B?czVFR296Zm93M0c2S3J6RzVlVE1BbU9WNFQ4djhhQzJwTXZEY3FpSnJnenNz?=
 =?utf-8?B?QjR4TEJxbGpSeXJwRC9FOGFuQWxMa2VCdnZFYmt4L3BFSlo3b3ZoWUVNTlZ6?=
 =?utf-8?B?T08vZGY2UzRWcG9NdkRhb2hGL1pZOFU0OTlCamI5VldyQXZWVk9mVDU0Tnkx?=
 =?utf-8?B?bjkxZHhGNWMwVG5NYS9PaElIVExWRGlNakVVM1ZhSFVHdGExWFBMTThKdEFZ?=
 =?utf-8?B?eG5GeXZnK213ODFxa1AzS3ZmOFhCc29YUFZXMk95cGNzd0dVR3lBN0tHTXBH?=
 =?utf-8?B?MzNtYXYxd3BhTG10ZGpSTHJpNlJHMmdldHNEbHdLVWl5WWFHSDVjbzJ5Wk9G?=
 =?utf-8?B?QlNOdnhja1lVTkZtWGJSd295d3hlMlF4YnNzZ2ppL2lxSGZqSWZYQjdFUHVP?=
 =?utf-8?B?UHJtQXA2R3BBeGtnbW82Mjh3bXNiemFJY1JrZnhLSERUTjlHUDJ2enV5NUEr?=
 =?utf-8?B?d2EweGdkeEl3cENzV0g0WjB5N1BGVERFS0JjcWtqSlg1c2dFamZ1cENQbmdL?=
 =?utf-8?B?citveGQrdFo0Ynd0VTgxb3BJK09FY3dpeURGa1JkcTdLaG5IVUpaNmpJK09J?=
 =?utf-8?B?RDJmdXM2Nng3MzVhSkJNZDBXazNFU3d5MFRINllWY3dPbVNoNXRpaGNJdlFC?=
 =?utf-8?B?eTlGNHd1TmhCTFM3djRscU1nL3ZIKzZlTXJzcjFLNkE3aVQybE1xd0wxZDFY?=
 =?utf-8?B?WWQxU1pqZTVVOTdsdWNEQU5qODZNaTRUUEkwSmVvclVIYmZrYUpaeWZLY3Qw?=
 =?utf-8?B?VG54cCttZVJUYTljVlNCZHNONENJUnJyQklCa2FzYXpaTFNMNnlWYmJVakZ1?=
 =?utf-8?B?UmFQNEh6dkpkWlROVGdFTEduYmR0bEU2R0ZDeXFtQklHSHYyOXRJR3ErS1Vq?=
 =?utf-8?B?bkQra1REUDhoZjd6bGlrazFJRnNaNFA4aWlYTU5zeXdOSUorUUxTWlB0YTUz?=
 =?utf-8?B?cXVTSGhMU0ljSGNmei9wK2tBNG5yQzViQitlcEluNUZ1RUdNMHNWc1JpNnQ4?=
 =?utf-8?B?TFloQnpJL25QSkhOdUNUTXJscmRlZmwxMjZJUzBRQnhMbXRTT05PUFFsd0Fr?=
 =?utf-8?B?ck9sMjRVQmhaOHJqWUducW1VL0RmWW9oS3JKcWJsU0l3UVo5aThaUTVRalky?=
 =?utf-8?B?SnRaRmMxWHVTZ0dXLzBUL3dUNTFpL0dXME0vQUVWWnhvSzB6ODFTWDMxRW9z?=
 =?utf-8?B?K3Jhd1lFWUI4cWEyVHI1M0V1b1lkKzcxKzlIcVBnN29kRjJRVFRZZWI3UGVF?=
 =?utf-8?B?YnZhaFZiL3ViWEpUNWVOS2QwTEgvUnlpRDVYVVdocHh6T0o5SDhPMUhWSDlL?=
 =?utf-8?B?QzFNVDFmcDR2aG1JOFFJd05BMWF1YThhVERuKytLcWwyVHI3V3huK0xESGh2?=
 =?utf-8?B?cTR1NGZ2aTV4clVQalVrMkszVjE5STFOcXZUV0hjTkUyMngrUm0vNTZ6cURm?=
 =?utf-8?B?TldacHBpd09jS05vaEo2cWozcTU2WlV3aDFNWCs5ME1Sa0Y0dVQvWXNuaTFI?=
 =?utf-8?B?bTRNS1g2WnJKeWlvbkV6bkdYNGExaU5tVVlDcndPZmJUeHNSUmhZcWs5d01r?=
 =?utf-8?B?Qzl6bDBwZVliRWRkcnlTTDBjc1ZKYllsQTRscXZpQlNaaDI2Nnh5V1dkblVi?=
 =?utf-8?B?TXprN2pyNWtLa3BqSHRBaWU2UXcyZHBNaU9qSE13Tmhkcis3enMyaFJDb2NZ?=
 =?utf-8?B?VitkSnZFd2U0aGc1Ymk4cjNlQ1p0cThZOXM2aU1pN1NnQkxXSlIwN3N2VXdq?=
 =?utf-8?B?Q0xXc1RsV0F4blVja3ViSytidk9yYzhCVlc0alhvMVZockd6MUkwVjIxdVJC?=
 =?utf-8?B?VGN2UkMzcGczUlBtQkRhSndIVDJ6Q21tZzNlWVFnZ1ZDNlJYSXd3MjFjRGdP?=
 =?utf-8?B?a3FxYWtZbHloRGo5eFZPbVBNVkNaN3FXT0cyKzNoLzcrczhsMVl2eG1nbTRm?=
 =?utf-8?B?cnJxL0xaRWdVWDRpVVdnYmFMZ0hKSUYvYmhaYWtTSEd0QVBDcEg2YmZKb1Vs?=
 =?utf-8?B?S3dXS0RUNkw3WEF2eDJMOUxXMWJ2RUpuR0g0dUZpYTFDYmxUcEE1cERQdjBH?=
 =?utf-8?Q?cb7Q=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(14060799003)(82310400026)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 22:32:02.3704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a30dc93a-1ad9-496d-12f1-08de1283fcd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6427
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

On 20/10/2025 12:24, Steven Price wrote:
> On 14/10/2025 10:43, Karunika Choo wrote:
>> Add helpers to issue reset commands through the PWR_CONTROL interface
>> and wait for reset completion using IRQ signaling. This enables support
>> for both RESET_SOFT and RESET_FAST operations with timeout handling and
>> status verification.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_pwr.c | 62 ++++++++++++++++++++++++++-
>>  drivers/gpu/drm/panthor/panthor_pwr.h |  2 +
>>  2 files changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
>> index 594181aba847..ecb278824d06 100644
>> --- a/drivers/gpu/drm/panthor/panthor_pwr.c
>> +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
>> @@ -3,6 +3,7 @@
>>  
>>  #include <linux/platform_device.h>
>>  #include <linux/interrupt.h>
>> +#include <linux/cleanup.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/wait.h>
>>  
>> @@ -31,6 +32,8 @@
>>  
>>  #define PWR_RETRACT_TIMEOUT_US		2000
>>  
>> +#define PWR_RESET_TIMEOUT_MS		500
>> +
>>  /**
>>   * struct panthor_pwr - PWR_CONTROL block management data.
>>   */
>> @@ -80,6 +83,42 @@ static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command,
>>  	gpu_write(ptdev, PWR_COMMAND, command);
>>  }
>>  
>> +static bool reset_irq_raised(struct panthor_device *ptdev)
>> +{
>> +	return gpu_read(ptdev, PWR_INT_RAWSTAT) & PWR_IRQ_RESET_COMPLETED;
>> +}
>> +
>> +static bool reset_completed(struct panthor_device *ptdev)
>> +{
>> +	return (ptdev->pwr->pending_reqs & PWR_IRQ_RESET_COMPLETED);
>> +}
>> +
>> +static int panthor_pwr_reset(struct panthor_device *ptdev, u32 reset_cmd)
>> +{
>> +	scoped_guard(spinlock_irqsave, &ptdev->pwr->reqs_lock) {
>> +		if (!drm_WARN_ON(&ptdev->base, !reset_completed(ptdev))) {
>> +			ptdev->pwr->pending_reqs |= PWR_IRQ_RESET_COMPLETED;
>> +			gpu_write(ptdev, PWR_INT_CLEAR, PWR_IRQ_RESET_COMPLETED);
>> +			panthor_pwr_write_command(ptdev, reset_cmd, 0);
>> +		}
> 
> This would be easier to read as:
> 
> if (reset_completed(ptdev)) {
> 	....
> } else {
> 	drm_WARN(&ptdev->base, 1, "Hey, we're already resetting?");
> }
> 
> [Message modified to taste ;) ]
> 
> I'm also wondering if things would be easier to read if you switched
> from reset_completed() to reset_pending(). Certainly here it's the
> 'pending' test you are trying to do.
> 

Oops. I might have made a mistake with the logic. Let me fix this in v2.
Thanks for spotting it

>> +	}
>> +
>> +	if (!wait_event_timeout(ptdev->pwr->reqs_acked, reset_completed(ptdev),
>> +				msecs_to_jiffies(PWR_RESET_TIMEOUT_MS))) {
>> +		guard(spinlock_irqsave)(&ptdev->pwr->reqs_lock);
>> +
>> +		if (!reset_completed(ptdev) && !reset_irq_raised(ptdev)) {
>> +			drm_err(&ptdev->base, "RESET_%s timed out",
>> +				reset_cmd == PWR_COMMAND_RESET_SOFT ? "SOFT" : "FAST");
>> +			return -ETIMEDOUT;
>> +		}
>> +
>> +		ptdev->pwr->pending_reqs &= ~PWR_IRQ_RESET_COMPLETED;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static const char *get_domain_name(u8 domain)
>>  {
>>  	switch (domain) {
>> @@ -407,9 +446,30 @@ int panthor_pwr_init(struct panthor_device *ptdev)
>>  	return 0;
>>  }
>>  
>> +int panthor_pwr_reset_fast(struct panthor_device *ptdev)
>> +{
>> +	if (!ptdev->pwr)
>> +		return 0;
>> +
>> +	if (!(panthor_pwr_read_status(ptdev) & PWR_STATUS_ALLOW_FAST_RESET)) {
>> +		drm_err(&ptdev->base, "RESET_SOFT not allowed");
> 
> Copy/paste mistake on the error message.
> 
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_FAST);
>> +}
> 
> I can't actually find a caller of this function within the series.
> 

I will remove the fast reset option entirely in v2 as there is currently
no use for this function. We can reimplement this in the future, should
it be something that is desired.

>> +
>>  int panthor_pwr_reset_soft(struct panthor_device *ptdev)
>>  {
>> -	return 0;
>> +	if (!ptdev->pwr)
>> +		return 0;
> 
> When would this happen? Is this not a programming error?
> 

I will remove this. Thanks.

Kind regards,
Karunika Choo

> Thanks,
> Steve
> 
>> +
>> +	if (!(panthor_pwr_read_status(ptdev) & PWR_STATUS_ALLOW_SOFT_RESET)) {
>> +		drm_err(&ptdev->base, "RESET_SOFT not allowed");
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_SOFT);
>>  }
>>  
>>  int panthor_pwr_l2_power_off(struct panthor_device *ptdev)
>> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
>> index a4042c125448..2301c26dab86 100644
>> --- a/drivers/gpu/drm/panthor/panthor_pwr.h
>> +++ b/drivers/gpu/drm/panthor/panthor_pwr.h
>> @@ -10,6 +10,8 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);
>>  
>>  int panthor_pwr_init(struct panthor_device *ptdev);
>>  
>> +int panthor_pwr_reset_fast(struct panthor_device *ptdev);
>> +
>>  int panthor_pwr_reset_soft(struct panthor_device *ptdev);
>>  
>>  int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
> 

