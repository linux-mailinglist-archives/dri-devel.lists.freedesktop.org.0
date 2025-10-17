Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147FABE5FB4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 02:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157AC10EACB;
	Fri, 17 Oct 2025 00:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VVca9+nB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC0C10E0AE;
 Fri, 17 Oct 2025 00:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lpe7CeRlZPDJnWLgziHVJ3uvrrRd9oCmvBBrQJ9VrrssSrD1P97ZqPve7JUOflgKx9HqN45rfnx0wOiL6kTfNYdqiQvD3BEBqCarEU3Epk/tbxB73wav1/ANuGwH5kvKv/9rfEin2N1OzGihMkuS1EcnNFQJwfc4DrvDszfubjedGFONEL6MQ064C6hAobm7hsq/SERCdLQVIyVoEzGlVmEV/UY8mLqPQY2aU5p7clRWgNEc9mJZysSAy1xM7H0gQwlMzhb4Y5zsg/UsYBn/bD2EifVEHqp5E+69IXcYXV1tM6a1WFRGHBlKX7yg0rA+RbM87onXoeMU/8/KuNvOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6k949euExRHaTJs+pVTO38BL9vasnO2enAy6/dLtJtU=;
 b=elXUVUe1tVcF9oPohFweZXoknm/oZ1bgBFBBRMlS4KmazbyBBNUNnvA9B1syZBJ+oCMC9sjI9N+Sl5d39dMTlZu/cSNWCTTe3VvNh/bpE/LZcm/Noy+PpWpMGK2jhCVrsxuQhai8IvMlAIYfEekjqKVPYmT5u7NYbkTrICCV6JEfHm3sdUlSBxLliHC/0jtdaCFIfJSN8u9Y+U/Cv2WqMXugeCnjsn7gxwWinxm3br2zCiKkrk9oJAAKgqlA5rHWnhibL5p9uYCcmpfcL5v4SQflQnW7cLyMHamCy0DLNYohqQgY2es/wbqEtE9yw8rQeC1pw4B1WY97UUWtoyQFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k949euExRHaTJs+pVTO38BL9vasnO2enAy6/dLtJtU=;
 b=VVca9+nBCQfBTczw2B5iKjoCKE8u7i4uCkzNo6R1wkHXG0pSgeydXY/gBenDGVKk4KQs4uBYw/uaBicF/6UuXgHzs10/PzEZpBGaJYJJX1vuNTVTKiwIxLVTOJj6TPfzcMVyKA7I5wVSanvzeMLqZU6NhWpW4B1LaHDUO87jDq15aEDAL0/FfTbCMPkxRmFmCjrtwqNQ4wx0ZsQ1ju92d1NS3CUvtz4ik/qjie1vOkzay15ajx/HdnWeWisj49t+tJpC2YmeH8+/2PbDq4CXhN30+HVb2NaucMxQWZ3OrvtckIASAPzycbuH6ng8F7ncwvNAYLyKIG0iAUtecJYT4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:138::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 00:43:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 00:43:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 09:43:04 +0900
Message-Id: <DDK6IHKS13RS.3UVIM301BBFUP@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alistair Popple"
 <apopple@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
In-Reply-To: <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
X-ClientProxiedBy: TYWPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 125ce894-79bb-419a-d990-08de0d1623c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N01mRDBxamR6M215RktyNVQ1Q3drN213aW15K3VFZGdKMVoyMVFIUUdPeHJy?=
 =?utf-8?B?K1QzUFpVRVVwdW5XeEh5YmpkdFhlaHR0bGZCeUR1N0h2d08ySWFkZWRpTlhZ?=
 =?utf-8?B?SVlUamlMVytqa2tVUXhLa3F6Tmt2cytoaTZMRXMyWFBIaEpNOGhlK0llWlZG?=
 =?utf-8?B?em14U04ySkdsSHU2WkU2SG5vNy9oMGJXVEhMUGNrdzY1YUlWYkp6UEsySjY5?=
 =?utf-8?B?M0hycWlCOFVqVCtSOG5CYmx3Q1JZUyt5UU02SnYrTjJvNHI4NjZ3blltRmJC?=
 =?utf-8?B?YStJOWYrQkF0b2JnQTdFOHBRNGJmdVk4czVLUnVIbm9vMnViM09FM3pGNG1l?=
 =?utf-8?B?Q3JtRm5iOEhubklUWmNHc3VKM01Ja04yWWlWaUZKQm53MDBORXl4MVAwazFu?=
 =?utf-8?B?Q0kvd2IrNmpBRkZaUkJxbFZrSDVFZGNqWldEemY4MUc5cHYyd1BYRVpKUk4r?=
 =?utf-8?B?RjFwcGNMRWVkdG1tRUNGdEgyZUc4ODFmTHB5UEQ3cTVQRHNuZnF3UklseWo2?=
 =?utf-8?B?R0RxLzUzVUtGUGVKVUZEUEV2azFWamVoV3I2dmFrKzU3bFNLQ2gyeGtYZTdM?=
 =?utf-8?B?V2Jqb0VrcWZkdlZ1QndnTG5BaTZ1clRZZ3MyY3BmeldmdFZvc3JNdHJ6QWRX?=
 =?utf-8?B?bDFxRzFCZjF3RTNCVWU5czZSbkM3aDVTNStrcEZ5Q2w4VXVlUXJXWDFQbnFx?=
 =?utf-8?B?MDl4M3ZtSk1aOFNMSXgzWGhXeE1FQ1g1OTZJcXZESlo4UHViV3BBTTNUM29q?=
 =?utf-8?B?ZGVaTkU5LzRmYnRaZ01KVHpnMGxhdmZXNVRwMUQzUDRwaG1WeFBNbElOSzdU?=
 =?utf-8?B?RWdIOHZ0V2h1aFdNSm41QzZEekE2NmdEZWIrSXA0SHpwMDhYZjVoSnRGa09t?=
 =?utf-8?B?TlZ0azROQlFJVmlLZHdTME4xV01WU01sQklvSGRKbmpXY0ZCZ0EzbE13YURG?=
 =?utf-8?B?SkVwQWlXL2g5dHYxOHBRNWc2YzYyLzN1WmZyZXMyK21WZnRqL2lneE5rTFBo?=
 =?utf-8?B?S25HSzlmeU0vcUc3dDhiOExvUGRLM1daWXV5RU9EaEljQTF4WFh4VzN4dGJJ?=
 =?utf-8?B?R3dMSmE0cmJBdHh0TDFGREowdnFSWkRWWHQ5NGpOTFdycWFNeS9BOXU0ZEVB?=
 =?utf-8?B?TWdJRE9MbUtVMWRYdk9JSDlHSm9meEpsVVhybFg3QTZ5Y3UvTDdHVzAyV3cz?=
 =?utf-8?B?QldxWWFuMUhpd2tGamEvZUxmaVVYdVVBYVpDVzJnOEdsVVhYSm90V2JYS3hF?=
 =?utf-8?B?eDh2bGQ0eTZUblUvNjdKSTJjc0FSRC96dmM0K2dQWEZyeWhoVzhkUmlzUm4z?=
 =?utf-8?B?N1JseXorQ0NxTXoveE8wLzh5clV5VUEza2FKRTEra1pGUnd6TldXdXpsT1Vu?=
 =?utf-8?B?aytMOTRabGppT3FZNk0zMk9Nc0J5NzF1NVFqMmFuSkVJYkJpRWN5em1WSytv?=
 =?utf-8?B?SVNER3dncE9MUUd1N0h2TVl0aEhUQk1uL0llanc1Q2RvMzF0N3F6NzNOcjJF?=
 =?utf-8?B?Q1FQVmVmbWJiTFNzcFlzaGg0cVpxNnF4eExwU2xjQkRkQjFUZVp5Y0x2UFYr?=
 =?utf-8?B?QUE2QlliZ1dTMy9YYkVvMkVETXMxcG1EaGVPb2xUOFhDZDE4K0RYUVdKZWxo?=
 =?utf-8?B?YmVhVG1leFVzaGlyZlBrNVRyVUR5K3diOW1aRmZpbS8reWxOcndEWGJra2xi?=
 =?utf-8?B?MlVnWXNWZG5lY2tUMkxwTk5aUGVjUFk2bmNrbDRxSmZrenJtaFByQzdXRHBB?=
 =?utf-8?B?QnVVRW9Tb2NLdjVOTXNyWDMzQ253OHlKbkwyekZzZC9JMCtFNGtpVGJjOTdz?=
 =?utf-8?B?TGdEUTFTdFUxTWRkczlzc21kSW4yRFZwQ01xaStFZDc1Q0Vuc2tCSWRScE5o?=
 =?utf-8?B?Y2lFM2h2TW1uVVJvaWFqTXBYSkNXd3o0VGduWlB5cTMxWmxHN00rRy9rNGN1?=
 =?utf-8?Q?FlSr6xMqeAXUp8R+E20bHJKw2m8j1j5L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGIzNEJZYy9FOVZ1OUtZeUsrVmNiVjNXc1NMZnd0K080THBTYmk1cVhSRWFX?=
 =?utf-8?B?TnlMU29RUkVHNFFmcTJpVXZmWGNXaG9WODJ1MmRocFNoZVE4UXhBTVh1YW56?=
 =?utf-8?B?ZkVOSFlHdlRsNUNWNHN2TGljSlhNOGluVDRvOTV5S3VaRW50MzB0SnlURi9V?=
 =?utf-8?B?UXZ3QlRWSGQ4ZmVwSUtuTnpaTWtvVzJFS0puLytBWHdRNEgxQzEyb2RuTEhY?=
 =?utf-8?B?Q21zVUx0SWNVVVltb2pXWGtOVWhNbkxqanBHTDdERVdtZHkxcmxnZWRKNWxs?=
 =?utf-8?B?RHJZbzRZOXVpREw5V2hxVkpLaFMrVEVobnRySThpOXFjbTVjK2d3aGRVK1NX?=
 =?utf-8?B?MkFsaFhweFAxODh3TEF3c1hDYmJHd0pTOE5QRE93aUxHblIrYTdVZVcvRzFE?=
 =?utf-8?B?cTIxTzlpcC84TjZmRmJ4eCtta08veWV6MUZqUWVNMWVReTFGNVZESTZrWjhR?=
 =?utf-8?B?emZpejNjdzVJWi9lTUt4SnpmOGZYNW43dEUxRU5EMkt0N3g5RTlrc2RkQkJ4?=
 =?utf-8?B?cGlFVHhLUzFaeFMyUVp6VzZaMTQ1a3liWEp3YVVmQVZWVndXSU9FVHYyUUZz?=
 =?utf-8?B?WHNiOWpWMWQ4ZldNRURaMm9XamQxZkgrazVFU2tGYk1mY3ZaQUREcmlqanpS?=
 =?utf-8?B?THJkRDV0aUNFb1N3TXVZdGR6ZVlPS3E0TVZiRWtoVUY2cHJ0NUNnVlMya1h3?=
 =?utf-8?B?OE4rc0pDeG5CUndnYktKTHFyWnN6RnNIUjVCbUN2Q0dyZkdaYU1oSEZKdjJ0?=
 =?utf-8?B?clZ4N2RwSTZ6S2FBWENCMnZPeHF5WjlqU1hxNzZmL0xzM0Q1anp2OEdmK3ZE?=
 =?utf-8?B?UVJ0L2RTbWtrYmx0Qll5UEoyZUJqTWE3Vm9zdkZ4NXhXUlZWM216bG9DazQ4?=
 =?utf-8?B?QlNKUllxTUNzR3Z1U0UvdEY4Q2kxU0E3NVZ4ekU2SnIwdU1BaWc2RlJnWHlp?=
 =?utf-8?B?cmpSVlM0S2VpQjNmM3pHWmp1VlhsYXRTU1VDZUQ4MTZkNjBVa010a0NIcDdV?=
 =?utf-8?B?VllEUlprWVV4NWM4UlZWRWNVZkFOMHhvbS9uQ2x0MnZsRElLeHZ6aXZ1Vy9M?=
 =?utf-8?B?ZmVQZ1pQazJja0xBUzhrMnVDeDIwZ2tFT1YvTUt3Y3JWUG10MVduSFZjZ0FZ?=
 =?utf-8?B?YVlhWjhjL1ZDaXNLRVVEc3NCWGdKZ0Vlb01tWGtRTDhLTHY3dmtIdlVFWXdj?=
 =?utf-8?B?UWhkVTgwSVpjSDFuU0ZNSkVOZ1VobTdwNlRpbTdqUjdad24zWGZ4dDRsejQ2?=
 =?utf-8?B?dHc5RXRsemVkclhYU0tHMzJUWGRBMytCanp0TjVBQlM2WGIyQzY1Y05ueklu?=
 =?utf-8?B?TFRUdjNMb3ZKQXhzelVTK3VCNEFYSFNkS09WVmx0NktLTnI1WjlOWTBXOG9Y?=
 =?utf-8?B?ek95UXN1SHNhaXk3dmhtaVR5dnp4MjdtNEVXRFhRWEZsc09sQjlJYWFoQ3M0?=
 =?utf-8?B?czZ2dHJrK2JHSWNxZ1ZBQmlLS09ob3V6Um90S0dtNWhPYjhZaEcxYmw1NXFh?=
 =?utf-8?B?YkFFSjRKdGR3Q004ZXViT0Zmb2ZWK3hvMDR0NDJzNkQwaytIcWVIMUVMMXp1?=
 =?utf-8?B?Z0hqeFFBRi94RWt0UUZkOXMwWkluSmVoL2NWVk9YL2NqZlRvWXF3dXZ6bnV5?=
 =?utf-8?B?Q25yMk1CN0NteXZ6clFLUlFSS0hFSmdHZFVveDJNVFp5aGxYbnhPK1JsazdV?=
 =?utf-8?B?dTJuNTRuVURkTGV4OGNtVSsxQk83NW91MFZObzFWK25NR1BXYW5DVTdlQ20z?=
 =?utf-8?B?TitQTkd1ZlB5ZHNFT0tsSE5ib2MxMDcxRHJBSjA0QllJeG4xOGVxLzlyYXFT?=
 =?utf-8?B?aWcrd1czRndmdnowSloxOG05dlJvay84TWFXOUZFWXpiN2dRSFh0UFJNU0FY?=
 =?utf-8?B?RE5MVTZwVzlDR3pMQmZ2VEphZkU3b2s2M0JseThINWRzRzhjRzIrcWJDd3gw?=
 =?utf-8?B?RklBYU9zS3E3VEh4RmdhUWYzWUhJYVg4TzVBcjhLQUlTdnVIQ1JzbXZVbkFa?=
 =?utf-8?B?TFRCMno5SVBnOTNlM2F1OEpWUkhoVnBmZnl6bTZITkFkQVlDTWxxWG9pb1M2?=
 =?utf-8?B?QUJnejBRb2NjWEJzS0phRk41Nmw5M1JxbDFSYlV4Nm1rU1FndmJHaGtnTkQ2?=
 =?utf-8?B?dHlTdVByMkNVSmpRNHU0OVdMOGd0NzIxTEZYNTZmZVZCUS9hVEo1bFlhcThx?=
 =?utf-8?Q?+pUXz1ywOX0Ql71AgergwEV2rWK8z5qr1prJJ/uCN/Zv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125ce894-79bb-419a-d990-08de0d1623c6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 00:43:07.5989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IKraKrkAKQran/BOZT7oRcbn9y7cprOs1CX39hPgs2nfbRXOyf/U7l9gBe6poXJZRIpxQ+jXAzXjGQRUS1gZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704
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

On Fri Oct 17, 2025 at 8:11 AM JST, Danilo Krummrich wrote:
> On Fri Oct 17, 2025 at 1:03 AM CEST, Alistair Popple wrote:
>> On 2025-10-16 at 17:23 +1100, Alexandre Courbot <acourbot@nvidia.com> wr=
ote...
>>> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
>>> > +impl GspFwWprMeta {
>>> > +    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayo=
ut) -> Self {
>>> > +        Self(bindings::GspFwWprMeta {
>>> > +            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
>>> > +            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
>>> > +            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
>>> > +            sizeOfRadix3Elf: gsp_firmware.size as u64,
>>>=20
>>> Very unfortunately I'm afraid we will need to replace the `as` in this
>>> method with `u64::try_from` and make it return a `Result` for now.
>>
>> And presumably most of the other `as` keywords in this function dealing =
with
>> usize as well? Have made the change but would you mind quickly explainin=
g
>> why this is needed? Is the concern that usize might be more than 64 bits=
 or
>> something?

Indeed, the concern is that `as` performs a lossy conversion without
warning, which could catch us off-guard if e.g. some type changes in the
bindings.

>
> Since nova-core depends on CONFIG_64BIT, I think we want a helper functio=
n that
> converts usize to u64 infallibly.
>
> This helper function can simply generate a compile time error, when
> !CONFIG_64BIT, etc.
>
> We can do this locally in nova-core, but it could also find it's place in=
 the
> generic infrastructure. nova-core clearly won't be the last driver runnin=
g into
> this inconvinience.

That would definitely be the correct way to address this.
