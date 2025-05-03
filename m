Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7FAA7E55
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 06:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E86110E329;
	Sat,  3 May 2025 04:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oWdT3rUw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A32210E2E4;
 Sat,  3 May 2025 04:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOdjBUQlBPru/NMq94B3CQjEV9jRfrPrrTMTLkJsiLO0mn9ZF5N9XR8Cw6C7E1qAzmEbQIb6SEC5oWxh5KFfM2+ROWL/6eNUlfhglTwMKcurVaOVjDtcFUsNMcDaDtl0OvoqQ77QbnSHM1egRjxp2DiaRGsfsQ0c6ZyQBRnSgYqCd9IxQkaZjnW6Fdri8V+pnjtu0/4IGdWCP/M6DXZ+WNmU4oz/5RA6aI+Bt9EV0UE8nP78Dw1wvAveLpde5I9DsF/PlYYsA7nnjf7arG3Bq8I6U/z/7JwNq14tsH7zWTIEa0Tin8f3Vrj4pQ1humnPdLZp3qXXL6qVE4+U6FBioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgTqiPFj5ay0uk3Fl52h99+Q6ODuD+v/r+wqbDZ+Y78=;
 b=URfUYMoJ+qONazIHxTk+y8MhWeXrn7KgBYyVG0JO5zeDLS4nmCcssFarUlgIcjOnauN5VF181PHQB8nTAnEQH6j2E7OuSjPFzT1Zo0fHnpsTho5P6ClnWBMXZm75RwUD2IYDU8abDSVSUAi/0+ueup/Qr/oA5Ta6msYMRDDZYD2r1O4kvU6R3xldxrUaGDLL/uWIAFLj2FZqpiW+byfyDYrbcOTbLaRZn0COoB09cYlud56dJVDzyD8hFfISmlmrhQhJgWd1ArCUfWslWooWEGeC6xBE6xbslsX6ukwNipzSP/GaoQeoe7184+5j5ZNjutVsRV9BUSDnJXyNWS8wPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgTqiPFj5ay0uk3Fl52h99+Q6ODuD+v/r+wqbDZ+Y78=;
 b=oWdT3rUwVfhPnMCB4utv7zQDKABCrkPGr7xBEsBpgkuCQmbW9bXehgknpLxzkIbk1p2hpeNdjkHd5nDIOTF6n85wbj7AvSSqZkCLpXsycDQBi+ZNiY0pqlhKviI1/FSJ9PwAB8hBZti4vYEGMSrj906l/vsJ3i1JGMdFknJHHws4td1nDnZ3lTNvaOCP8EyF6kp5V8zdT/csuSux4DcmnrD2wmTaZy/vIJ9PNOoJ+apuY9HUPFbk8PWvaqsPzILyu04UpmAn4U3MGgW/LvYJ/vIKtz/DXnZ/TSE27rdRfm6wLR8tnPGNqEOv1iyxj6/lgySu/0y5afUEVmCZcDoATQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 04:08:14 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Sat, 3 May 2025
 04:08:14 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2 3/7] nova-core: docs: Document vbios layout
Date: Sat,  3 May 2025 00:07:55 -0400
Message-ID: <20250503040802.1411285-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250503040802.1411285-1-joelagnelf@nvidia.com>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0529.namprd03.prod.outlook.com
 (2603:10b6:408:131::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 1023db09-e44f-40eb-ead1-08dd89f8205b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGx4czlETVB6NThva0N3RUpmUnE0TTVtOVh2a1VQdzlyWTF4RVN4a3pYNXQr?=
 =?utf-8?B?ZEVBQSs1KzY4eWJiY2w5L253TnRZMkVSVzI5T2oxNnpIRjRJRldjbDBNNjZq?=
 =?utf-8?B?S0E5TndGd2hMWDhCTDNrbjhxOEFGUVB3eStuQ25Zd1A5SnJtTWQ0cmNybEMz?=
 =?utf-8?B?bFU5RERGQlNhZWpaWWZSVnByMG5YVjlUUzk5NFdZYkFrUzZrTkE5TGhBUnVt?=
 =?utf-8?B?Y0h6c1JjcUtUUW1RUlBFaXZGWFB1Vm1nVy9JZ0x3bExKbTRFL2ZpU2lGdWdG?=
 =?utf-8?B?MGVYVFBDdVJJU2syOVlBK0RHT1pCZVlCVHFybHpaUkNDWDBTZUE0NDRGRFY1?=
 =?utf-8?B?SEk1RTJUZU1LNFZZOXNVRG03TVh5SXh6UXNxd05lODdCekNwdDBCNnMvck05?=
 =?utf-8?B?dGhsOVFuQ21sQk5GQ1pQSGNBQWd6UHN0K1EwZ0xhT0t0QkFxR3BGeHBjZk9O?=
 =?utf-8?B?UFkyNlJQclpqdUpMQ2RnUjYwb3BHMnVySHlvalE4VEJYVjZUbGNiaWlvRnA4?=
 =?utf-8?B?Z1YzY2x6YUNUY1JQZCtoc3dSelVDVGx6OGErV1pMVEhJVE90KzE4TjNsMXFu?=
 =?utf-8?B?QTZubUFrUGxHa2FYeUtwUk1WRHFyTms4T0J2Q0ZFNStMUVpHdWFybGNlQWtP?=
 =?utf-8?B?TVdTdW1nSFFhdE1KSFZ1UnJGcWIycGZTd2N5eGJTUWVMMkk3bUFPSG1XenM5?=
 =?utf-8?B?S1ZVQmswTzFTL1A2OExOOEM4UHdGbjlNTjRJbHIrWGZDZ2M4UTYzdXh4YmRG?=
 =?utf-8?B?K3ZOaGMwTXh5Q0tmenZTOU9oNThvQ2FtcmdUUWxiS0NkQktBcXVNNEwraDRi?=
 =?utf-8?B?RExDUVM0Qkt2ZHJHbS9IYmhxNnhTRlJoRWhDaFVlem0zK1g2VXZoeE9KZitI?=
 =?utf-8?B?RDB3dmI5QXFrdjkwbFB2ZUVKWUFPWjZQdkdoVkg0eXdqQlVZdm9VZElLbWdo?=
 =?utf-8?B?NWhuVk1lNVdydTFBejZFK1QxS3F4UzdUdHpxL1NWNUNxdTlJUHhzVlp6N0hY?=
 =?utf-8?B?MXBXTnNUc1lvTXpwQ3g5ZjZNWnRTemkwakplV3FVSit1ZlplMGE2SElBa1ZP?=
 =?utf-8?B?TFhwR1ZZMHRRcU9VYmFveGg3a0hnZnBZOWNQNTN0RXhOdEczQnRnbnlaVWtB?=
 =?utf-8?B?bjVTbWdicXFEVWN4S2NwWm5qNE1wZzRlQUpTenJCejBvQWRNNFZrM2xYSWJt?=
 =?utf-8?B?eGx3bDJKNG9obVhxb2FQaHRvNk9VdHJNRzg0OTBZQU9PRE9QT0U3emNuU0Fv?=
 =?utf-8?B?NGhMSHg4NDZmc012RHBUb0l4dUlGbHJyOTVFYmdwandNT01pbU1LaUV5dGtN?=
 =?utf-8?B?b2pQeFdiRE5XbWNhUlI5Y3RLc0JZNm1PY3dOZzVBVXRkcC9Db1cvZUlCRFcr?=
 =?utf-8?B?dHBoQXRBZWpNa2pNWFpMY2JsQUczVHJRcnFKU0hHVmNkVEl2NTFMRmtJZGQ2?=
 =?utf-8?B?Qm0xTUZPTGREZ0R0cjRqdmh1RlZBbFp2bmxDcTVuUElwSlU1SlRNOXhQZEZV?=
 =?utf-8?B?dHBnOVdoaGZhOGYvYU9EY2FlUVNSczJ4c1VDNnluTGpCbmdMTUh0WEtPT3N6?=
 =?utf-8?B?cUlNc0NEak10OTh2Sk83b01XMGJkUWpqN3hlU3hsekN6YUx4UisvcEdNdmc0?=
 =?utf-8?B?L0VDNUs2eXFCUWh5MnlUL0hSWEg3M1VZZkxUbG05d2M3ZmtQU0VqY2d4aWJ4?=
 =?utf-8?B?aWhSdDFEYzlWbmxrVVRhQ0lmZllYT2Y0dmFoMzAzeDYxTmF1azdwWmJJb2ZV?=
 =?utf-8?B?aWc4eU1OaVZGNlkxSkVVM0xOSDQzVTllTWRSUmF1d281c1Rwd2o4b0RIT3po?=
 =?utf-8?B?Z0JaNUhkcHpBV0pNZUVYN3RqejlkN3I1dXBTaWJoZVNOZFI3QU00cm5Qb3VV?=
 =?utf-8?B?Y0ZSV0VVMkxQRGxtSlBYYllVZFZiOHh4ZEh6Y0FDMGxiblJpMkFhakh5enZE?=
 =?utf-8?Q?vNZxlscyDtY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDFGbTNaOGplcDZ6NG1keERLQm94NXRIajZhdlVhNDl0ZFdueGZqRFJ2RzVZ?=
 =?utf-8?B?aXRvNVh0TjdjTTVXV0k5aFZha2RzSW50U1NlTlB1K3JIcy9tS254TTRsdjNW?=
 =?utf-8?B?eEpkZ0F6UjBaUkF5blpoUzRsa0NheXd3TmVDY3JXakxsT0N4WnRQVzZqS3FK?=
 =?utf-8?B?TmdvV0c5Wm5mYng0VU8vRXd1WTI4aHRIL2d0RFJNY3YyNnJCbXlyS2U5K2o0?=
 =?utf-8?B?bWIyYXFvMGVwcXVRMEIzNHUzZ0lVTm9XRk1tRVloYklJNzcvMHh3YTE3NzBx?=
 =?utf-8?B?eVAwVjZ4OVN4YzRaYk02WDBubjlMMGhHUTZaTjMyRFc2emU5eHVCd1g5RStx?=
 =?utf-8?B?WVpacjNOa3M3QlFha0JGci9TaEJnaHBCMTlVQkFIbFlYNHBhMXE3RVIwWnFv?=
 =?utf-8?B?Q0oyTjFrMUpmaWRCZTFQZlNnaTI5eXBicG5nTDlQcC9WSklaQ25PWXhVZWJG?=
 =?utf-8?B?NWNXWkYzTEVpdzl6MTVNNmUrTGY2S3UvTlRQTmdvZEtYNEdwc3ZDYkZJbGRu?=
 =?utf-8?B?bDNYZUdlUFY1dVlKdUhJeUdSemhESmRmWGZueVpQc3pXNktMbnpaYnVIMTUy?=
 =?utf-8?B?N3JqLzB2c3JPSkp1ZzArWkZnVCt2Q2lkbUpmMHY0dUpERkRhZVZKT2xraElC?=
 =?utf-8?B?em9yWDdvWkRwVUFoREx1UjZreDJld0d5RGk1Qk12WTM2aStteUxFaGdFd2dt?=
 =?utf-8?B?RTdNUWpMVXhNTzFDazdGcWRkS3hCalB4aUZsRVg0NlREc2tqdHZOa0dXcjh1?=
 =?utf-8?B?WWVNSlB5ckxTZ1NBRytqTWczWVNpQVdaOUpJZlE2ZEN6UXp2VWphS3FlbmpN?=
 =?utf-8?B?OUtYY2Z1S09oZVRUS0pPUE5FbTdOZVVCbXZpbEQySmJURW1jNXNuRWZ6aENo?=
 =?utf-8?B?dzJPNCtvUkNvTXFvK25tNWo2Z1RVdFhBVExKOU9TTTAwZ1FqU28rWm1LaSta?=
 =?utf-8?B?M3F0amUxdDBIdGRYUG42VVRYN2FCcUQwWkxTWGR4Zlh5YjZXRW1pT0pxN1JE?=
 =?utf-8?B?MUZhMkY0UVA3c3ZkMkpUV3Bma2RWV3R2d1c2aU54Nml5ZUJLMVhYWHNCYjNl?=
 =?utf-8?B?aDUvZlpDZlEyNmhuNFFTdEJrZTgrUTBqYklDNHdkUU9PWXRaUGFZbUlta2Y0?=
 =?utf-8?B?Qzd6VUtiaWtDcnhnYnExTzNaN2VudlpSY21OVC96V3FXbGI0bUt2VWtDaWxa?=
 =?utf-8?B?azd0UXk0NXR1czFuaHNiS1VVVk5jWHZYNm1RUlZkdm5RYVphWjJ5NVI5NU42?=
 =?utf-8?B?V0xSUHRxU2NPc0JUdExIbEQ1SVl3V0R2WldDeExBRE9mZkphSXFFOUx0dUJ3?=
 =?utf-8?B?QmtFQ2dUZDd4TytQR2hJWTFMSUZ3bXE1WU82OU9UOUVrWlB4NlZlNUtETDFN?=
 =?utf-8?B?RHlmVEtPNHdhOHJraGp3ekZQN1RJakp6UUh0RU9oZFNzUHpFQ1dvMUQ2UTI0?=
 =?utf-8?B?Nyswc21NUWR2aFFMN0JOemVlNlBRanR3Y082aUcyTmFaUjUxY0ExM0VkanEr?=
 =?utf-8?B?QktpRG9lODFFV0RZL3QvTWpoOTJ5OU9GTVhvRElUTk0xdktkM3JVemUyK3Ux?=
 =?utf-8?B?Q1dtQS8zVS9keFNXcnc5UC85WmMxalY5YnVrSFcxTVF5UHNhbVZSRkVrb1FE?=
 =?utf-8?B?OCt6WVFtN1NmS0tjNlN3QlExWHZtV2FBRWhtZGt0b2d1YkhJb3pwclZxWUdH?=
 =?utf-8?B?QStwMUVnSTcxMmw2REZMaHlvK0FrdE5aV3JwbUl3MHp2QjhZbGJxU0pOTEZo?=
 =?utf-8?B?emZ0ZC9BSTVBMnFtWUtiVUo2VDUxZ2l5NmlPcDNVdWVzNnc0dFc3NTlLU0l6?=
 =?utf-8?B?VENEeWpQbUFpV3dicVpiQU8vWU5QWi9OczRES0VzY1pMRmJjWThyVzJYUzBi?=
 =?utf-8?B?MG4wclI5bll5dW9sTHBYMk0xOWtZbXhwaU4xK3NPaEJUdGdrcW1SeFhjSHdT?=
 =?utf-8?B?TFlPaDU1OS82Y0FkSlZma25ISWpRS2srdHk3bEdndU5qRHA0RmIwaTllQ0Q5?=
 =?utf-8?B?THpvZisydjJoQjNBTERNR29kY0dDZkI5anFQWFBjWG94L0dHZ3Nxc0lXU0o0?=
 =?utf-8?B?Myt2RkY2TkhPMTJjVFRNRjBCbTczOWFpU2hTNXBnNTYzNzdlK3NscXJya3Js?=
 =?utf-8?Q?sBRaX2Ob8udzaLOSRddgBgVkS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1023db09-e44f-40eb-ead1-08dd89f8205b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 04:08:14.5109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +W57i/bpWH+ejeoFkY5xnHDiCEiEAkH89ealfCqtHx9qQVOVjudBpFAFyLX7lzAuoKPr0oeR+xExdF13GWgyGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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

Add detailed explanation and block diagrams of the layout of the vBIOS
on Nvidia GPUs. This is important to understand how nova-core boots an
Nvidia GPU.

[ Applied Timur Tabi's feedback on providing link to BIT documentation. ]

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/vbios.rst | 177 ++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst      |   1 +
 2 files changed, 178 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/vbios.rst

diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/nova/core/vbios.rst
new file mode 100644
index 000000000000..04ced35648cb
--- /dev/null
+++ b/Documentation/gpu/nova/core/vbios.rst
@@ -0,0 +1,177 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+==========
+VBIOS
+==========
+This document describes the layout of the VBIOS image which is a series of concatenated
+images in the ROM of the GPU. The VBIOS is mirrored onto the BAR 0 space and is read
+by both Boot ROM firmware (also known as IFR or init-from-rom firmware) on the GPU to
+boot strap various microcontrollers (PMU, SEC, GSP) with critical initialization before
+the driver loads, as well as by the nova-core driver in the kernel to boot the GSP.
+
+The format of the images in the ROM follow the "BIOS Specification" part of the
+PCI specification, with Nvidia-specific extensions. The ROM images of type FwSec
+are the ones that contain Falcon ucode and what we are mainly looking for.
+
+As an example, the following are the different image types that can be found in the
+VBIOS of an Ampere GA102 GPU which is supported by the nova-core driver.
+
+- PciAt Image (Type 0x00) - This is the standard PCI BIOS image who's naming likely
+    comes from the "IBM PC/AT" architecture.
+
+- EFI Image (Type 0x03) - This is the EFI BIOS image. It contains the UEFI GOP
+  driver that is used to display UEFI graphics output.
+
+- First FwSec Image (Type 0xE0) - The first FwSec image (Secure Firmware)
+
+- Second FwSec Image (Type 0xE0) - The second FwSec image (Secure Firmware)
+  contains various different microcodes (also known as an applications) that do
+  a range of different functions. The FWSEC ucode is run in heavy-secure mode and
+  typically runs directly on the GSP (it could be running on a different designated
+  processor in future generations but as of Ampere, it is the GSP). This firmware
+  then loads other firmware ucodes onto the PMU and SEC2 microcontrollers for gfw
+  initialization after GPU reset and before the driver loads (see devinit.rst).
+  The DEVINIT ucode is itself another ucode that is stored in this ROM partition.
+  
+The Falcon ucodes once located have  "Application Interfaces" in the data memory (DMEM)
+of the ucode. For FWSEC, the application interface we use for FWSEC is the "DMEM mapper"
+interface which is configured to run the "FRTS" command. This command performs carving
+out of the WPR2 area (Write protected region) in the VRAM and placing important data
+called 'FRTS' into it which contains power-management data. The WPR2 region is only
+accessible to heavy-secure ucode.
+
+.. note::
+   It is not clear why FwSec has 2 different partitions in the ROM, but they both
+   are of type 0xE0 and can be identified as such. This could be subject to change
+   in future generations.
+
+VBIOS ROM Layout
+----------------
+The VBIOS layout is roughly a series of concatenated images as follows:
+(For more explanations of acronyms, see the detailed descriptions in vbios.rs).
+
+.. note::
+   This diagram is created based on an GA-102 Ampere GPU as an example and could
+   vary for future or other GPUs.
+
+Here is a block diagram of the VBIOS layout::
+
+ ┌────────────────────────────────────────────────────────────────────────┐
+ │ VBIOS (Starting at ROM_OFFSET: 0x300000)                               │
+ ├────────────────────────────────────────────────────────────────────────┤
+ │ ┌───────────────────────────────────────────────┐                      │
+ │ │ PciAt Image (Type 0x00)                       │                      │
+ │ ├───────────────────────────────────────────────┤                      │
+ │ │ ┌───────────────────┐                         │                      │
+ │ │ │ ROM Header        │                         │                      │
+ │ │ │ (Signature 0xAA55)│                         │                      │
+ │ │ └───────────────────┘                         │                      │
+ │ │         │ rom header's pci_data_struct_offset │                      │
+ │ │         │ points to the PCIR structure        │                      │
+ │ │         V                                     │                      │
+ │ │ ┌───────────────────┐                         │                      │
+ │ │ │ PCIR Structure    │                         │                      │
+ │ │ │ (Signature "PCIR")│                         │                      │
+ │ │ │ last_image: 0x80  │                         │                      │
+ │ │ │ image_len: size   │                         │                      │
+ │ │ │ in 512-byte units │                         │                      │
+ │ │ └───────────────────┘                         │                      │
+ │ │         │                                     │                      │
+ │ │         │ NPDE immediately follows PCIR       │                      │
+ │ │         V                                     │                      │
+ │ │ ┌───────────────────┐                         │                      │
+ │ │ │ NPDE Structure    │                         │                      │
+ │ │ │ (Signature "NPDE")│                         │                      │
+ │ │ │ last_image: 0x00  │                         │                      │
+ │ │ └───────────────────┘                         │                      │
+ │ │                                               │                      │
+ │ │ ┌───────────────────┐                         │                      │
+ │ │ │ BIT Header        │ (Signature scanning     │                      │
+ │ │ │ (Signature "BIT") │  provides the location  │                      │
+ │ │ └───────────────────┘  of the BIT table)      │                      │
+ │ │         │ header is                           │                      │
+ │ │         | followed by a table of tokens       │                      │
+ │ │         V one of which is for falcon data.    │                      │
+ │ │ ┌───────────────────┐                         │                      │
+ │ │ │ BIT Tokens        │                         │                      │
+ │ | |  ______________   |                         |                      |
+ │ │ │ │ Falcon Data │   │                         │                      │
+ │ │ │ │ Token (0x70)│---+------------>------------┼──+                   │
+ │ │ │ └─────────────┘   │  falcon_data_ptr()      │  │                   │
+ │ │ └───────────────────┘                         │  V                   │
+ │ └───────────────────────────────────────────────┘  │                   │
+ │              (no gap between images)               │                   │
+ │ ┌───────────────────────────────────────────────┐  │                   │
+ │ │ EFI Image (Type 0x03)                         │  │                   │
+ │ ├───────────────────────────────────────────────┤  │                   │
+ │ | Contains the UEFI GOP driver (Graphics Output)|  |                   |
+ │ │ ┌───────────────────┐                         │  │                   │
+ │ │ │ ROM Header        │                         │  │                   │
+ │ │ +───────────────────+                         │  │                   │
+ │ │ │ PCIR Structure    │                         │  │                   │
+ │ │ +───────────────────+                         │  │                   │
+ │ │ │ NPDE Structure    │                         │  │                   │
+ │ │ └───────────────────┘                         │  │                   │
+ │ │ │ Image data        │                         │  │                   │
+ │ │ └───────────────────┘                         │  │                   │
+ │ └───────────────────────────────────────────────┘  │                   │
+ │              (no gap between images)               │                   │
+ │ ┌───────────────────────────────────────────────┐  │                   │
+ │ │ First FwSec Image (Type 0xE0)                 │  │                   │
+ │ ├───────────────────────────────────────────────┤  │                   │
+ │ │ ┌───────────────────┐                         │  │                   │
+ │ │ │ ROM Header        │                         │  │                   │
+ │ │ +───────────────────+                         │  │                   │
+ │ │ │ PCIR Structure    │                         │  │                   │
+ │ │ +───────────────────+                         │  │                   │
+ │ │ │ NPDE Structure    │                         │  │                   │
+ │ │ └───────────────────┘                         │  │                   │
+ │ │ │ Image data        │                         │  │                   │
+ │ │ └───────────────────┘                         │  │                   │
+ │ └───────────────────────────────────────────────┘  │                   │
+ │              (no gap between images)               │                   │
+ │ ┌───────────────────────────────────────────────┐  │                   │
+ │ │ Second FwSec Image (Type 0xE0)                │  │                   │
+ │ ├───────────────────────────────────────────────┤  │                   │
+ │ │ ┌───────────────────┐                         │  │                   │
+ │ │ │ ROM Header        │                         │  │                   │
+ │ │ +───────────────────+                         │  │                   │
+ │ │ │ PCIR Structure    │                         │  │                   │
+ │ │ +───────────────────+                         │  │                   │
+ │ │ │ NPDE Structure    │                         │  │                   │
+ │ │ └───────────────────┘                         │  │                   │
+ │ │                                               │  │                   │
+ │ │ ┌───────────────────┐                         │  │                   │
+ │ │ │ PMU Lookup Table  │ <- falcon_data_offset   │<─┘                   │
+ │ │ │ ┌─────────────┐   │    pmu_lookup_table     │                      │
+ │ │ │ │ Entry 0x85  │   │                         │                      │
+ │ │ │ │ FWSEC_PROD  │   │                         │                      │
+ │ │ │ └─────────────┘   │                         │                      │
+ │ │ └───────────────────┘                         │                      │
+ │ │         │                                     │                      │
+ │ │         │ points to                           │                      │
+ │ │         V                                     │                      │
+ │ │ ┌───────────────────┐                         │                      │
+ │ │ │ FalconUCodeDescV3 │ <- falcon_ucode_offset  │                      │
+ │ │ │ (FWSEC Firmware)  │    fwsec_header()       │                      │
+ │ │ └───────────────────┘                         │                      │
+ │ │         │   immediately followed  by...       │                      │
+ │ │         V                                     │                      │
+ │ │ ┌────────────────────────────┐                │                      │
+ │ │ │ Signatures + FWSEC Ucode   │                │                      │
+ │ │ │ fwsec_sigs(), fwsec_ucode()│                │                      │
+ │ │ └────────────────────────────┘                │                      │
+ │ └───────────────────────────────────────────────┘______________________│
+
+Falcon data Lookup
+------------------
+A key part of the VBIOS extraction code (vbios.rs) is to find the location of the
+Falcon data in the VBIOS which contains the PMU lookup table. This lookup table is
+used to find the required Falcon ucode based on an application ID.
+
+The location of the PMU lookup table is found by scanning the BIT (`BIOS Information Table`_)
+tokens for a token with the id `BIT_TOKEN_ID_FALCON_DATA` (0x70) which indicates the
+offset of the same from the start of the VBIOS image. Unfortunately, the offset
+does not account for the EFI image that sits between the PciAt image and the FwSec
+images, the vbios.rs code compensates for that with appropriate arithmetic.
+
+.. _`BIOS Information Table`: https://download.nvidia.com/open-gpu-doc/BIOS-Information-Table/1/BIOS-Information-Table.html
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 2701b3f4af35..91cc802ed94f 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -27,4 +27,5 @@ vGPU manager VFIO driver and the nova-drm driver.
    :titlesonly:
 
    core/guidelines
+   core/vbios
    core/todo
-- 
2.43.0

