Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADFBC1073
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 12:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F1210E5EA;
	Tue,  7 Oct 2025 10:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R+criTYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C9E10E183;
 Tue,  7 Oct 2025 10:36:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH2KN6HTVOXHiya+BEfHN+MrF+1wb5QDq69qJNiPay1103reXy3d5SO17S3WbtxObUoCBYWGnTRTOpxUrz0KNLfVrQGtg94LTnRb/mxiVPEgM8EKr0YVTixMIbPl7T4yBB1ytk5yM9j/Dx6u51/zRJzgVFPxWuGlIDH79jZjTXwN++Dkuqt0XgxgAf59HlNr0Mc61TOo6rhCdHSpkBJZrlCZDuXUMh4a2pyUIljYo3dV0tfNJX/PrTbEgz3QtN55eo1yqyM2fDZhe+/1lNTBKyD2s9JNztqYYa/J8K07AEMAwuC2SwEx9sMHgEr1gxBYNjucwAgYQ/yIxUjXLJ6sHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHhrnavh2iDdeSPusYznlNNRZ3nWDD15b2MvtoW57dI=;
 b=WXiNoWYLb2OfLftzA/5ZQtWNzxyKmarYE+LO1cIpMpCMmsUuTW3TUKj1077CuoWIu361xFTfrJSa9MKDVrv5qmOJ6QvK/3UztHNkz1Q1wDcxXhJd3A7rDGbykFwb8H/nafkvAWKFOwZaJMoG9sMYSixQk/BVm2FKGSvxBeCKmdrIEPaWf6niokSQoV4spGTw/2/WvlfySKPgkWnxYTKWGC5XyYiPvFccl/2MjC3LiB5nLvsKPbNT6y7fL70yc4K94O/FUIQKIvk5ASkmmOkUeUT8YOuNtS70TqZ28jLCZPbqUcl4fRpt8TAjNRBfc719lgL+GG/fFls/OiSlzte4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHhrnavh2iDdeSPusYznlNNRZ3nWDD15b2MvtoW57dI=;
 b=R+criTYrRTnH/o0BzMP48c/i2EkecULheZ7oUtugr9pz09TguFKVl7catm4SzySwqqZUB08l0nDgHwWVtPvPubxNHVvJbZcncAnMvT3DDnKJAR8pqJrfMfhzvT+ZNRHK7F1+tyYhVVPitu7nvc1+szy+8P9mc0LUfE+UGl+xEDKgQwGqTWiPIRFvGiVHeLrOontz58KxeSiSPDpwIqii86aXZF0TN/GZGQk9WHDtrcKg0DcpnmBGg7MZPlsFcokETSzTHPP+ULa4t551U1QcF7MUtODH4e6/o1gvINicr3EDRa+3YeAnmGkSW3zsFbKtDt9LE9PP/c86mATlMNJMXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8858.namprd12.prod.outlook.com (2603:10b6:806:385::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 10:36:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 10:36:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 19:36:21 +0900
Message-Id: <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
To: "Yury Norov" <yury.norov@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>,
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury>
In-Reply-To: <aORCwckUwZspBMfv@yury>
X-ClientProxiedBy: TYCP286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: db3c5756-6f44-4aab-a07a-08de058d5d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1p3em5wQVM2Y3NLSEY0UHVzT2drY2R2bUN4cmNEMXhoZXRwcG5zUC9jejR3?=
 =?utf-8?B?WGZRWitjeld3eE51UTZudDFnMGdKUlJTREw3TVViekVQRkMybHVycGRhdVVU?=
 =?utf-8?B?dEdSeDdLY2NaUm5lN1ZHcXFQYXoydXowZ3hUOFA2a08ycXc0NG40UzVXdld6?=
 =?utf-8?B?aGFWSlpXNHQ2dkRIcEVwNkptSzJ1dVp1YlN5OVh3dEQxK2xGeGJEZXdVdE9X?=
 =?utf-8?B?b0dSMzliazN1dThwQ29vSk1XK05EOUtrUGNCUWhCZHpDcWFEVHMxVmpWNnZw?=
 =?utf-8?B?ejQ0cjB1NCszWWVwQ1Z3VjBUU2V5VXN0ZjdUdlBJUXFQR01vNWpsa0dncjI2?=
 =?utf-8?B?L2hmOWp3a2xMK2YzZCtkRXQxa0dFUW9UM2JuZ21DdVc4UmJnNEZyNGI3aW96?=
 =?utf-8?B?ZzQ1M3diVU40QWd2VDc0NHZtVVhCUW1DSTB0TGRXa2VKRSt0MklhU2NkdUVI?=
 =?utf-8?B?bjdQWGw5NlEvb1drR3JCMEwwMmw4VkhPRVhRVXE1ZHNYRG00N0lOZW9YUjlS?=
 =?utf-8?B?QVdBWHVScjhXNTcxWUZuSERIazF0OXdHN1BVRFlQaHpxZnRFallqSzdUSjNF?=
 =?utf-8?B?akdTb3ptK0ViUzNmV0hEZUNDTXpVYjVmbkdxbkx0QlhqWlhoYWhPcmU2ME1p?=
 =?utf-8?B?K25zMHhQNWRPZmQxTVIzRU43WUdLQTNTZXZDUldwcnNPMlRLeG1rY3U5RlpN?=
 =?utf-8?B?QTcrdUQwZEFXbmdiaGhqRGlFOTlWUDQ1ZHF0VE1RNExtQml1d3pTckpMaFIx?=
 =?utf-8?B?dFJtaVBBSk9OVnNnVlhhVmdOK3MrNGZyR2RUcHg4a0FYSlh6b09CSVdwanpZ?=
 =?utf-8?B?NVBiZHpXQVRvVXp1c3Q1VkJBN3hxZ1J4SXBpZ2Jia2QyR3ZyRFdCdjZQbmlS?=
 =?utf-8?B?cXBoaXRHVjVTalB1YktDRjhNZmtPN0hYcVV2emVrb0VOOFZPY3hDdVM3TlFq?=
 =?utf-8?B?MWNWZlBCWFRVbnZBdkViS3FoWUpiTG5zUzA2QVBnQ25EVjlmU2Q2QnNDSGw5?=
 =?utf-8?B?YWM2V3Q2cURod0EwdGR6STk0S041ZVRGN3l5dWpqT241NGNKUHlBdy9kUGdk?=
 =?utf-8?B?blhiOTU2ZnN3aExwdmlZUDhYTnpvN3lZanVQaXIrSVROY3cyQm1oOWRWUWJa?=
 =?utf-8?B?K1VzK0hRckVJckU5Uld6RCt0ZTUyS2ZsbHRoeFZhTmI5THV4N3FEZnRyY2RE?=
 =?utf-8?B?UXVmZnBWcG45dTRJZXh0a3ptYkNYcHNXRngzelo0NncwTGlYKzIzYU5YbWRL?=
 =?utf-8?B?dGFOd3dtV0NFdXpieXpxNkZiUnhxTlVRemJJMUNkaFJzNjBkcVpudWl3WU56?=
 =?utf-8?B?ZjB3VEtZdFV5WlgyUFZrQTZkR0dDTStLbU8ydzBmVHV2bFhWUjloV0dZOVJk?=
 =?utf-8?B?VW8zUnJ0MXJIQnFBSU5lMktUNDhBUG1TU056NzhVck43TGtsZjdvRUl6WkI2?=
 =?utf-8?B?TDBIZURXbVNIZVZWNWdMTFhpVHFkNjhxS1pzRFdFVEEvTXBxTlBaSnZRQVFk?=
 =?utf-8?B?eEFod09jdy9OZzA2TGlzbUdyQVNKNVU5bi9vUEowa2V2Zlczcm9PZUVTbC9V?=
 =?utf-8?B?dDVZaWVWUmlTSGtmNWpSZlE0Vm1Ja2x1MHB0WWxFSkRMNjhzTzVVR1I2cHBy?=
 =?utf-8?B?OGtqeXFvK0dtQzFvTC9rclg3cFJZNEFNN09OcU1NOTdmdUpjM2Q1VFZRaGVk?=
 =?utf-8?B?TXV4M1d0NTljWndraktQclJ4QmVFSThvS1V3RWhUdE9jaU1ZaEU4cGdnTmlK?=
 =?utf-8?B?L2lKdEZjUURUYThCNDdkRWJWelZNL1g4Ti95bkFOYU9tZlBKSCtnVkQ0Mjd4?=
 =?utf-8?B?SjRKVUVNaUtiME9RYmNWOGxjZnJ1ZXFmblNQdFJZbGIrbnh4TWhsMVU4TzZv?=
 =?utf-8?B?eHZ0MkdFMWprc0dKczdhOHFQcjRoQkxseWlNTk45cGNsUFNRQlByc0Q3STVZ?=
 =?utf-8?B?bHZrZ2hVUFRETDR0ZjVCRDlEZjNKT1NxSXZLVCtZQWNoYzVLSzFtWVBGUjV2?=
 =?utf-8?B?WHpCNGI2akl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFFWMTcrQ2NhdlNoVlBhQlpLaWZ3c3FOaTFQcEwxN1dlb2FYVTNybUV4ZXZQ?=
 =?utf-8?B?NDVOZElkY0NvQnU2RzRTaHhrN3Y3RXNocDg4OGFXb3NrSTZ3SG9YY1ZmV0Zv?=
 =?utf-8?B?M1pCbDY2VDcvdUdyM3Z0MTZLQnBPMFZzTU9FSjVodFdsSDBpZHl6NnFxS2Yx?=
 =?utf-8?B?TWYrTm13ekhpNlFVdjFaeUxBbjFNanY3SXN6WWdNdDR6T3R0ZmNMTW13TWtG?=
 =?utf-8?B?MndnOERsM1NHZmJhR3l0WDRVNDd5cWJtbDZuMzVlak02MjZoajdwVmN6Y3lY?=
 =?utf-8?B?dDBKalIxZ3JMQnE1MDBKazJOUlVBeWVyZlc5b2Qxb0YrblUrY0pJWkp1bnRh?=
 =?utf-8?B?V3RzSGVVU0Vwc28rNC94S0M1KzBsZVRKMTVaeGpNRzl0d1ZKNUZuK1VZV1h1?=
 =?utf-8?B?UFo5dzZmVUhaOVJiRGJSY0xxTVhIUXBibXlTNmk0UStCbThRc3RYdDRVZ29l?=
 =?utf-8?B?ejUyL0phQk5VWmxNcENmNllHbzhIcWdvVjU4WXRsMHVheGtQRis5aXZPa1JB?=
 =?utf-8?B?WU5hUUE1NCtjVENIaFNpVXIyYkEyemE5MFRmak5KNUhuY3RQRjF1WXlGb1hK?=
 =?utf-8?B?dithaTd4dzhrV21JeWQrSkJkNVp1TDVERFNqK0hVU0dSYWJXSGt5MEZnWU45?=
 =?utf-8?B?Zk5Qcm9DZWRXZGJ3L09DYjBkYXlEN1gvdTJBU1k1Y3dLeVJITFhPWU5pbW5T?=
 =?utf-8?B?ZEl5NUhIR3JUYzNWdGxlSU9xOXd5RWQxN3oxcERxcGl2MXgrSmZ0V3JQd1RP?=
 =?utf-8?B?M3VaeW9mUzhjaWhmbXpwTG1MV1VmVW5GOFdPRGt2S2tzdzNIQmdLdWw4U1VU?=
 =?utf-8?B?MVNVcGEyWEhiZWZleW85cmM5ZXY5NkJMRnN0T1NYUC9WWVhFN0NHcU1Sb2lT?=
 =?utf-8?B?UlBJZ0VYR0tJZFZGcWZWQW4zMDM1ZmdMWGRrcS9EWHMxVTVKWGVVY1I4dGxp?=
 =?utf-8?B?MzA5ZmZLTkdvV2FyNThvaE1IM3RVbTdPbVV2YlE4QUpVaWJxSUJXZTVDd2lX?=
 =?utf-8?B?emhqTnIyNkpTZzNIVXRiWTlaVDQveXBBcmJGSnRNQ1d1RFI1SnBFT1YreEFH?=
 =?utf-8?B?VExFditQSHZCUGhYRkkwMG80TWgrM1dzTlNXSTk1Y0JyK1VIZGdnNjNTOGgy?=
 =?utf-8?B?d3ArOGkwYW5FbFFpcDUwUWVibTVJQnBQM3Y1UE5CbTJXL3UwZkRnZjZDYmxR?=
 =?utf-8?B?a2c4djRXQnM4SG5WQ3h4M2FvNDlQbXlJQjIzQjVxZXdkcUZDSzhXbnR6NExL?=
 =?utf-8?B?U05PU2M2dVhxNXFoeUJNeWFBS1BVbFMxWEMzWEpjTHBpQURiaEM5YXREWGlS?=
 =?utf-8?B?VnBWaWFJRDBWc1NKRGIva29yYzduVXdscGxIa09xTEw5QmxGWkVRWlUzcm12?=
 =?utf-8?B?eVRSOUJ2NFZGa0VYNGN4OUFNRk9uR2VxdURHL1pqZU5GZHZxbWdVZ1A4WktK?=
 =?utf-8?B?bG81TXY0MzEzTGd0S21NNDh5RW4xeXVKZjRPcTYraUIwa2ZCRFhhUjZsMmoz?=
 =?utf-8?B?TXZCM1hFSVRsL3JId1hHMFBvTVhDcVd5L2FwZnJ6VnUxRm1DNzV3SlJjRVE1?=
 =?utf-8?B?cmdZWHplRld6WlZmRTc5VkQ1Y0JqR2QxQjE5NFlYWDZ5RGdWN0FHbzlmb2FK?=
 =?utf-8?B?THZGbnBxWHYyRXUrMmpkWmNsbSsxUHFoZENnRGNJMno0RkJhMDVGRHJkQ1BF?=
 =?utf-8?B?dlo0dWlaSHBhZUtkcDk5UlM0L0xtTGVtNS9CUGVHb3RqQVFHMVVwWkZ2NHpI?=
 =?utf-8?B?ZTlHRGIxUUw0Tkk1bkZ0MWVPeThtR2djelRrVG80eHN2OElZaXhVUll2TTlS?=
 =?utf-8?B?NWc1NW9YcXhGQm5xTEJGYllPVkhzS1BBVzUxbzkzOVFuUjJwcCtjMkl3dDZT?=
 =?utf-8?B?K2FkT2VqN0NKQjdwUlFlbEhwb291QWx6UVkzWXRXWHppdHVZMUN2TGdYVVhO?=
 =?utf-8?B?eGszMDg3VkdaYVFWb2hQcGkvVUgxa3RpU1EzeWlydExtaVgwMmgrVUxFUzNY?=
 =?utf-8?B?UWo0dklyK2NVakJ4Y2JCeWpQeks4RStzNGxGZ011T2svTk5GNUM4ZVBBREpE?=
 =?utf-8?B?aDF5d0dQSGlIUzV0Q0wycC94eXZOU3JlUDh4MGsvNkJ1WXp2RklVQjdMcmlL?=
 =?utf-8?B?TjZ3ejcwejIyTGlEZ0NFWGw5TEhPYUE5SzhmazgvWE5DUjVKekhuTGd5VWRF?=
 =?utf-8?Q?gXWKa5RBMUnWpGKVckHXJ7pz1AuOKN01CYd76ON0wjid?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3c5756-6f44-4aab-a07a-08de058d5d57
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 10:36:25.0207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuhN/AvwTUgvOLUIOsU8cEpKK5AUX+VkWNPfUJOQOJfyjMWbXXDxqAlDO8zvZrwpYGfNeQ/JOH1Lt2I+lL3SRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8858
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

Hi Yuri,

On Tue Oct 7, 2025 at 7:29 AM JST, Yury Norov wrote:
<snip>
> Regardless, I don't think that this is the right path to move the
> bitfields into the core. The natural path for a feature that has
> been originally developed on driver side is to mature in there and
> get merged to core libraries after a while. Resctrl from Intel is one
> recent example.
>
> With that said, I'm OK if you move the bitfields as a whole, like you
> do in v5, and I'm also OK if you split out the part essential for nova
> and take it into the driver. In that case the bitfields will stay in=20
> drivers and you'll be able to focus on the features that _you_ need,
> not on generic considerations.
>
> I'm not OK to move bitfields in their current (v6) incomplete form in
> rust/kernel. We still have no solid understanding on the API and
> implementation that we've been all agreed on.

Initially the plan was indeed to give this code some more time to mature
in nova-core before moving it out.

The reason for the early move is that we have another driver (Tyr) who
wants to start using the register macro. Without it, they would be left
with the option of either reinventing the wheel, or poking at registers
the old-fashioned way, which I think we can agree is not going to be any
safer than the current macro. :)

IIUC your remaining concern is with the possible loss of data when
setting a field that is smaller than its primitive type? That should be
addressed by [0], but as it introduces a new core feature I expect some
discussion to take place before it can be merged. In the meantime, it
would be great if we can make the register macro available.

Because letting it fully mature within nova-core also has the drawback
that we might miss the perspective of other potential users, which may
make us draw ourselves into a corner that will make the macro less
useful generally speaking. We are at a stage where we can still make
design changes if needed, but we need to hear from other users, and
these won't come as long as the macro is in nova-core.

[0] https://lore.kernel.org/rust-for-linux/20251002-bounded_ints-v1-0-dd60f=
5804ea4@nvidia.com/

> On maintenance: no core functionality can be merged unmaintained - it's
> a strict rule. While in drivers, bitfields are maintained by the nova
> maintainers as part of the driver. If you make it a generic library,
> you need to define a responsible person(s) in advance. It's also a good
> practice to add a core maintainer as a reviewer or co-maintainer. Alice
> and Burak added me for bitmap/rust because I already look after bitmaps
> in C. You can do the same for bitfields, for the same reason.

We can assume maintainership of this of course, but is there a problem
if this falls under the core Rust umbrella? As this is a pretty core
functionality. Miguel and other core folks, WDYT?
