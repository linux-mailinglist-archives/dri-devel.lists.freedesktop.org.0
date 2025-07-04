Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8726AF894E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A08110E950;
	Fri,  4 Jul 2025 07:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SSIE7rTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E06510E950;
 Fri,  4 Jul 2025 07:25:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvDzExKrHP4o6qLAgo/Uohzn6btFKt3oDEMh6EDXdAvcubV3vpntZJWUyLz0ep7p4FyiuWY7fmoFjeQZGz/bX5G58PY7/y4g6lzillP6LmsoFFZVLwmEppBCftGNLugo5disD1B02kzjT905fwUCFUH+oueOnwrQv0y7zRNm6bqeuG1qxQ6hs9C7PlAQ4uoxM6wfc+gKzwI7JaR7zgqaVhGbMd7o4Wu6pkpKxSrpHHJevU2Zvfg/iHoxbPgc3N8Gp04Gp6tyLyOVluvgfGmvfMU5HuNz0oGa8J/8O6cNkPIs9J5ftojztuGm6z+/4bkvhyXHOUJ/Qs6c/Gl80fz3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uTrdfpIlt4vCDartqaTeHmWvrQhBGQ9t5ida3m0EYo=;
 b=fVT2RxaoMYQaOtNUpnL3bc3gj6TZ9a1aE0iMyhVWqI/LVgKamulOfMn3eOkAQR8r2ElkJgb2p7ttWlnSArLxOI6EVZk/FjZoKqK6na5OA4VWHIRjB1mwvhnyaMJMnhNSBhVY4DiIAdM8asc5fhrJm75eQuTt6MtKcnxptXRCj7bxrnvPOa9wIKG7DPOmGASe1QjPrDwXtqSpMdpEz3iqLNL1LsKh+4M7Lfz6KK28OyWl64n2L1a6MM6vbUdDVl3xOCNsF/m2aia2NoNTY4e1tEXsPIqNhkJLchrd6oPRX1T68tbhNEdZvPiaeMUnS8463+nbHZFczY1bdowiC6DBxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uTrdfpIlt4vCDartqaTeHmWvrQhBGQ9t5ida3m0EYo=;
 b=SSIE7rTVZJK29rhKDF01YApLWglz5FtVGpDcJZfIE3FTkFMhHHgUejGX71tpW56FJ3HK1H7AGLLnKdYbyc690Peia3WJLJGi61ccLCMYxGOV8frQRz98mOyj2vU+JCT+NLlaUo1AGnSkrYP2cY+DLgyWWf4+mpW1fpfE/9c4KI+/OBvGyv0Cz9YUYwM14GmJD0ZmhJB03n+1bj0NykNVdhtZ/42NCrruoVCRgeZSueI8ZCnigJNE4HrNcYz2bmFiMVnxNFPe6Zn4S1MiJpr009hK/atm5ifMau1eHcJDI//fbUoGzalUlWOIigF+fToi3vgc6D7GPSneChSUaAnimQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:10 +0900
Subject: [PATCH 09/18] gpu: nova-core: register: add fields dispatcher
 internal rule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-9-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:404:28::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 1adb1cc3-0e81-487f-55cc-08ddbacc026e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnRjVEdwRVNiOWkrSDRlQkt2Tms4a28zUmJWbDFjcGhuUldEZ0JDQURlZXli?=
 =?utf-8?B?c2UrelV0TkxjbUZ6RHBibjhDVUVMNVF3d0lHME1MbFYyRVA2aEJzRE9xbWlH?=
 =?utf-8?B?TVRBeEVxTFZoSkprS2NqYVY3Kzc2SmFuYTk5V1FiV0l2SThKS3hJQVlxNG4x?=
 =?utf-8?B?RDRRUW1SSExjRTNXcTJLYzJkL1dVVmgzNDhXcHUweUMveVY1WklQa2l5OFN0?=
 =?utf-8?B?K3hZZysxZ0tuN0RiTlRFNGJ5eVNZcUtxeks0TSsrTDFGS1FzN0l4RERKUlBG?=
 =?utf-8?B?eUJkcnFnNlRRMXZNSlJ3cHM0R2xUTjRnRmRRSW1rU2ZiVE0yS0s3ZFFwUFlS?=
 =?utf-8?B?WkJnMUdrdkhsWk1qQmpJWEdpNDAxYmE1bVhxOGtSN0p4aFozRlFzZnI3MmV4?=
 =?utf-8?B?VFNuMDVpaXloby9Ta0lGQWRGM2FwZXpuQTA3M2NObXRocWlKY3pDUDNUNW5D?=
 =?utf-8?B?RitGWEVIbVp4MVdoKzgzS0plQUNPR1U2ZzNPZ1dGK1BhWXQ4T0lIb2NpNlNn?=
 =?utf-8?B?MjRCV3luZlVkQnV0WUJGVmlhTDNvazAzdTQzbC9XczZ5OFN5Q05QVUJpb2kz?=
 =?utf-8?B?bDRRYWdCb3pFbU5qTVFjZkNPSzJRdmY0SW55YjlyVFREYnlwczkzMXBRRlFV?=
 =?utf-8?B?Z2MzVTRkOFliZG5GQmUzYlVzdHAwZDVXNm94aGl3cHgvZjRyczA4V1cvT1pE?=
 =?utf-8?B?UWViRXE2QUJOQTB1VVdwSWZWMWRnMDZKa0FhMjNZMTVOcVdXd0dYVHQ4RGJT?=
 =?utf-8?B?M2JsdmpsNllQTjB2R3lKNmZ2R0pjYndNTlVOemtML2NndGpQNFc2ZkJuakdD?=
 =?utf-8?B?UXM0bTRmVnJFV3RrYnFSZ3hGbDcwNURQaE1BSVdITjZoTU9qMnFYQ2tTZDFk?=
 =?utf-8?B?OUNHSThFMld3U0c4TDdJZU90V2QxVEVNU1U1S2trSE82aXlUZ1hMOW1Nd2Nk?=
 =?utf-8?B?VXRRUzZGY3dmekxpdWdrTDFDU21kRDNRZnJHVHpKNTc1OVgvU1U0OUlKVTl0?=
 =?utf-8?B?b1d2OUJ5Qm1icXdvSjVub2VXeUs4L1JLbEpuRllBd3pmTlowUkpWeEw3L1Rz?=
 =?utf-8?B?NGJaaDBDUUxmcXl3RUtNdDdEUjI2Nk8waCtaRytVT2lsMmFoMkdqaGN2dkpC?=
 =?utf-8?B?NUxySGZ5VmthaUoxaWhxWWRJRTl3MVd0WHp0ZUR6ZmpHUlN6WHduNkVvQTRM?=
 =?utf-8?B?Nm9mejBpSG9VQU4yNDdJUlk4TXVjTVQwNmxEMC94ejdYZkxvQTFHNy9QN1ZU?=
 =?utf-8?B?RWFQVmNxSHVON0l1YytFeUtsWkFtTmdteVhkdnFFanA1eTBHWDBVK0tpWE1R?=
 =?utf-8?B?ZFhaZkZ0WmN5NjFHc0FTL0YvSENhTllsQmpOcThJa0w4MnMrSEU5RG9UTXg4?=
 =?utf-8?B?OFQ1TXFyTGFHUThpRDcwMXZwejROZlJmc0wwM3VrZlp3WndFaEFiTmk0SFg1?=
 =?utf-8?B?U09SWi9Ua0ZDTTZsMlZhSHcreFNTNDYzNzRHZmpKc0E1eElPcCtRU0VRTGdW?=
 =?utf-8?B?dm9TOHRYMkZxQ3VBSjRkTmw5YzNsVWJxWjBwcjNyVEM3ckE5S295cUtUTHVF?=
 =?utf-8?B?Ulh3OG5LRlVGS3JmdktFb0FiazVBTThOSCtkbDg1SzZhQkx2aVdLTTYzVmcz?=
 =?utf-8?B?RlllTndLNWRjQ2FJZTV3NS9JYkxhZTRaa1RXWDBRalFMcExibGdkQitub05D?=
 =?utf-8?B?Mk1QMDF3TXpGeTEwaGdGV28wdzBhekMzQjdlc293N2JVSEl0QU4yNVlZRklu?=
 =?utf-8?B?YzBrenl1bTlIcmxjUXpVblMvWjVLUU1QdXU0VGEyVURvL2JwUCsrRzE5WGUw?=
 =?utf-8?B?akw5a0Qvajl5MVB5amZNOVBwaVR1MlBXYUg0VXd5Q0VWWGpvZmM2Y3RXQWtt?=
 =?utf-8?B?ZFgyYUM2cEplSjVHQ0lNTUFmdFZVWmZwdnVtakNYNStLTDFLNk5pVWpxd1U1?=
 =?utf-8?Q?QcrGQGZMb+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3hPNkl1MlRaelNDZ0ZJajhBQ1FlYjYrdXpRd0xrRlk0NkJleTREVFhVL0Y3?=
 =?utf-8?B?c1hPMFRhNllwaHZ2VkNhbFZMWmtPUnpJaXlPVUlsRWdLa0JqNmNJdzFramNH?=
 =?utf-8?B?eUQrSWtoM0JyOXk0TUl3NWtGQVB0NjJvYTJ0OVpDQ2sxQUc2MS9GUGlpeEs0?=
 =?utf-8?B?amtST2hHam9CMTcxbi9kM0Jxem5NOUR2VTBET3FqcTJ1bVE2SytmYXVEN3Rm?=
 =?utf-8?B?TU5NbytDdDNuTm9lSkdndk1TdTNHalBOUlFtcGFMalNhMDZCSmJtZVFYdk1H?=
 =?utf-8?B?NWc2d1ozeGJFYmtldVh6SzNuSFA0VjFUY2hFUDd5bVYrOUFGcnd1amFibXlP?=
 =?utf-8?B?YUsrRlFDWmk3bUJ4SDNHZEJPbThUbmFqN1M4QS9NSitHSG94Mk8xK095MytH?=
 =?utf-8?B?N0ZNVkgyYTZvNk52bzZJVllkTlRrUTNnTDg4a3JZaHlONHM4bEE1aHlnVnhj?=
 =?utf-8?B?emFXdE9DYnVBS0hqREdLcytKMnhWWTZwVjNEQkt0SVV1enVEc0NoTlpqSzFh?=
 =?utf-8?B?R0RkVlhhVmY3Ti9rbXhTdm1PTElIbU1RenRMcmxvRmhBaUMyYXhBTSs0RXBK?=
 =?utf-8?B?Z0E5bzhaLzNTRkxKTVpjK21Lb29VNlI0bERKaE43OERoLzNqTTNYUkhpNVBv?=
 =?utf-8?B?STlxY09Zb3dCVFJ6L2NSYnhmazNncExHZXd0R1FmS29CMnJVV085V3ZjQWE5?=
 =?utf-8?B?L1lHczMxeG5JTmN3RU1wUC9kc25EYkVOK2pMRmduTlNSS0VrWnAyTTFmVlJm?=
 =?utf-8?B?c21sVTdibS9xL1VBL3FtS21NVExGeDUvc1R2cDJpU2NhcEVmQlJ0KzFoYVZh?=
 =?utf-8?B?NnFOR1JNWTVRTStJTFpFS1VHZGFvMmkzTEpVOXpQbWlmYndsWGlBWjI1clkr?=
 =?utf-8?B?WWlvUDhzWUdIRmcvOWNhcWJYSnZzQlFyZGIzWWdMdE1oS2cvWTU0NmVTUzFQ?=
 =?utf-8?B?YkVSUEpQbVBKVG40WHdRYnZLSjRrdGd5UzladTliUFNMZWRJcHlaLy9DTTJz?=
 =?utf-8?B?L3ZaTW5mUjhHSnJrK2VzTGdmREtPcTBNcG5kRGJyUUNyRjNTbjg2d2hERHly?=
 =?utf-8?B?Z09SdVM5anBZNnQxTngvVURIM05uRkNJQTluUTBvUVozRDd6OEZIaVJrenIw?=
 =?utf-8?B?Nm5uVlVWRFdrd1BLMS9PVlArVnhleVBIbDVXVHE0TitHWmo4L2oydk1ja1Qy?=
 =?utf-8?B?SW9pTVc2OFkrSUVVbHBHM3ROMTBLaTdCOHFpaWtwZDB5RHlRMCtxYjhNd01B?=
 =?utf-8?B?cGo2WUFVaElCTjF0eUU4NTZ0RDVLL2x4UXdxcnVGcm1PTUtzVnNWbkJvKzY3?=
 =?utf-8?B?aFN2REpEUFJNWVlQYkdnZDB4WCs3cGo5ODR4aE1NQ2ZvaVZMYWc3WkF4ekln?=
 =?utf-8?B?bzRzaUFXeDIrUFFqclBsdlR5TmVCS2VuSjlCNkc0L2Zady80cWxJeldTRStC?=
 =?utf-8?B?ei9vRVBvMll3dUJQWklaVmJWeGMwcTRzYjJqbCt2UXprSVZXTStKbUJoQkM2?=
 =?utf-8?B?N05ZSVRLWmNoQko2VHRqdXk1Ylg1TVJSNEppdEFZSlFaUXpWREk4TXo2Z0py?=
 =?utf-8?B?TG1kWjBiRHBXRTZBaFpRcmZINlZqakQrbzRBaXZaQXVpL1dDQWhqNkppdjlt?=
 =?utf-8?B?MGdTTXFkVGhuT2w4L0cyYjZ5eGlBdDg5cHVUd0VwTkxFM0hTcE5Fd1FyRUVv?=
 =?utf-8?B?Vm80dTMvWG5HaHYyQWRoanVCU1Q0S0JnZUFFWDZhZjN0MExCU1lUTlFHWXRG?=
 =?utf-8?B?VklmQk56VU1FTUhWMVEzZnhoUGxPY0tFbVFZbVQ4aXhhWG5CMlFvVWpwME9T?=
 =?utf-8?B?djZMdVZuSExHQzJlbU0vOW1kNzQzamp1NytnMjRrOCtEOTdLQldZeFBJS2lV?=
 =?utf-8?B?aGZMRGh5U0N5T1FLSGRDUFJIanU3ZHRPS0ZKakZHNFJvZ0ttdUZkUCtmRGJT?=
 =?utf-8?B?dWZoT2hRMDRJa050bDQvd0FJVzg1bjNZbzNIZVFhYWJpQjJ1ZGhoUzJUa1lR?=
 =?utf-8?B?blBlYlRFS2trcVhiUHdubDF2S3JlSjltSzdDTkkyR29Jd1dkblBzN0ZUQjhj?=
 =?utf-8?B?alBvamluRnJuRGtEbTlpTzRIRHQ2WVFWSVJzVU40U2R3MDZ0RGJpVVN0cDd2?=
 =?utf-8?B?U0R4Q2w5RzF6VjQ4RU9TZG45eVJXVHVKUGZ0RThvZHFoajR2d2JYQTBrdkNi?=
 =?utf-8?Q?zLgRskGmzAotks4gnlC8my5mb2YIN1Rtv63J8DGkXFyd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adb1cc3-0e81-487f-55cc-08ddbacc026e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:53.4298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umWuw02N3iM/+x0kTPE8bLjEKx1Th31W2P+hq1/zPsmNRraRw1URIQRVpGCizz4IUwU6Gbx6mnkjelfyGfkQSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

Fields are complex and cumbersome to match in a rule, and were only
captured in order to generate the field accessors. However, there are
other places (like the `Debug` and `Default` implementations) where we
would benefit from having access to at least some of the field
information, but refrained from doing so because it would have meant
matching the whole fields in a rule more complex than we need.

Introduce a new `@fields_dispatcher` internal rule that captures all the
field information and passes it to `@field_accessors`. It does not
provide any functional change in itself, but allows us to reuse the
captured field information partially to provide better `Debug` and
`Default` implementations in following patches.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 42 +++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 60e5e6a2250a9db453a7a648108af6acaa047342..1d473ceb7b97e18e36246569abf0bb04e7b02060 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -88,37 +88,33 @@
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@common $name $(, $comment)?);
-        register!(@field_accessors $name { $($fields)* });
+        register!(@core $name $(, $comment)? { $($fields)* } );
         register!(@io $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@common $name $(, $comment)?);
-        register!(@field_accessors $name { $($fields)* });
+        register!(@core $name $(, $comment)? { $($fields)* } );
         register!(@io $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address.
     ($name:ident @ + $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@common $name $(, $comment)?);
-        register!(@field_accessors $name { $($fields)* });
+        register!(@core $name $(, $comment)? { $($fields)* } );
         register!(@io $name @ + $offset);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => + $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@common $name $(, $comment)?);
-        register!(@field_accessors $name { $($fields)* });
+        register!(@core $name $(, $comment)? { $($fields)* } );
         register!(@io $name @ + $alias::OFFSET);
     };
 
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
-    // and conversion to regular `u32`).
-    (@common $name:ident $(, $comment:literal)?) => {
+    // and conversion to the value type) and field accessor methods.
+    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
         $(
         #[doc=$comment]
         )?
@@ -149,6 +145,32 @@ fn from(reg: $name) -> u32 {
                 reg.0
             }
         }
+
+        register!(@fields_dispatcher $name { $($fields)* });
+    };
+
+    // Captures the fields and passes them to all the implementers that require field information.
+    //
+    // Used to simplify the matching rules for implementers, so they don't need to match the entire
+    // complex fields rule even though they only make use of part of it.
+    (@fields_dispatcher $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+    }
+    ) => {
+        register!(@field_accessors $name {
+            $(
+                $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+            ;
+            )*
+        });
     };
 
     // Defines all the field getter/methods methods for `$name`.

-- 
2.50.0

