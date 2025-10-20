Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167B5BF30D5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FC410E4E2;
	Mon, 20 Oct 2025 18:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RPXrp+/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011017.outbound.protection.outlook.com [52.101.57.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2069E10E4E0;
 Mon, 20 Oct 2025 18:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGkIrAQsn7OltmpbFJFkdzKNz7FhePDJjkrvKCwjD4zSSgfmqJ8BrF2L0dqw2qDXle5eLDJ/aJ9nhmz6MVC6nBbcbocpwtte2SU7pPzxKArXGBjiYUHxswP7zzTiEP/5qfQiF3wAVUNnEawKDDnOChCYBgMCOaZmt0bo51uqgRf2ZuuugfgVIxuWILAR56t3Xen4XyCdZY6+ieJwclWMo9PyxqGQlVS7G8EaqM7x417lpknPmrglz/AEWdAjaUXawyr+sx37rs+1l2SevSMzCi+yRmUYJ/G0HvO3KUbwJAfScJVtcx3eXt/EQrH3MksodhpefGB4uP1S8vrDiH7pZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrRstk6XH+cKSNvjdaRydBGrDqlUgENf6MHOQkDYwz4=;
 b=Pz022N26l00KGuiHjLw57ElpXqBQ08zHKlpzA65V5za1XymFwjAAs3uwWt3+Pt7aUtOg4wxHq7HqbWgeDoUk7b5x+PtWG49IoGaO9J09NFUAmY7XPoX88Qwf+WY7JDYg7p0J7vjphWojDWYqUjIzC7iZY3QIgH2oAe1wF9owSWMDk7kkHBS7d1CE17Txa25LzN6tNQ81EAyOA9p7aR73hqis2rCMw3hGKdmfvmP7L3z+eJTvT2i227lIFPZ6KNL8VbBtrhFZ7eqp6Q91x1k1AEpk2WY1F5CgajGQ3/RKGSQVXofTSo5mdUjUWljScWcC+EL7RdfXjjvgcTZczU1hvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrRstk6XH+cKSNvjdaRydBGrDqlUgENf6MHOQkDYwz4=;
 b=RPXrp+/D+wQ90BE85ZwP99U384INjfdMrT+a16kk+aVs5whJ5YUHZRnXxf/Z4khqg6rlaYQW2wSU8fS8hefmOjqTAbrc1PlBQry2XP6WMGBfh7+dLc+/rmxcdv0ajdqaH6H4XasJScOgTs15+WhZQb23baPuC3vzRF+mP8ctVrosfU4Tgu/2c53R8/Yoq09VB7upal9/SRZUzFHucEJtgB1PmWYwhPRle4/y9Lc55oFSHxnzxhEINrJhb3CBBx+t29i+oiWWWG9MvaQwv+tC68QMONDQt/J9Nv7OksHrOQINjB9ZyWgd48QLRy91tsRDxVTGQqujE9hgR7rj+V2tEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:55:52 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:55:52 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH 2/7] gpu: nova-core: Add support to convert bitfield to
 underlying type
Date: Mon, 20 Oct 2025 14:55:34 -0400
Message-Id: <20251020185539.49986-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020185539.49986-1-joelagnelf@nvidia.com>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0527.namprd03.prod.outlook.com
 (2603:10b6:408:131::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d04295d-71e0-4b60-cc7d-08de100a4add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5mJ1G8Y4Tjmp2ELGA+l9b35U7+bnpqZf2goVWhDzyX/E2csINsoo7nsuM1o1?=
 =?us-ascii?Q?3rjiKLu+4n1g9zC/4FBnVrPZ3T8uN+ZTqLqS5xgUnEMYao6RZUBfy5sUHSjo?=
 =?us-ascii?Q?jOpjAa3ykLjD0+oHBER2D9qhjurkHRptEadFzxwqqr4MoSePKWQ67/SSgTL1?=
 =?us-ascii?Q?okwHoXEs0ytCGmRE0nEFEpSi+wZBh7Zh8x8Cn4eLQMfQ6impsjyr5XaAqnUV?=
 =?us-ascii?Q?FA6GbG0nIpe/uo5C5X8oJJBu6r9sjXsd+KTewTaCtDyhkYa7ZqCC1uTClQNY?=
 =?us-ascii?Q?qYlw5+c4KcpqSMZNNuQ+lmbugoPMuw+HwogVnlB+npBUJvf1sAceXHtGkbbX?=
 =?us-ascii?Q?CMMAuApWLffvMVLdvWhSLSRcYs15dD7SZwx5oCCUXsrJFvWPS9WQzTvZWA79?=
 =?us-ascii?Q?FfhTAwqjrtqv93CiZ8Ts76wCspQCf9l1RCpbsKxnIZ0eARf4l78j+QTOS5G9?=
 =?us-ascii?Q?k1d2YzVa54aRHrV7LsxG+BpvhOBPNeM0pVMe2DFDeMNl8lYUSfwqe7NOx6lr?=
 =?us-ascii?Q?mL76PVZNsuDbtt7Drs48BadwSKIb6OzPHsli2inbhIGN0k2sieoCzVPpXP6V?=
 =?us-ascii?Q?AV7Vu9FcHCKf1QD4uImI6mbPMUIqltrSodqwsTFp5qEKF1+03jn6jeLvCbdm?=
 =?us-ascii?Q?lbzCmSm62wEFQyzaYzsQfsj/EcYNH+nzJFOK3Zfa3AMTwvJWI6gWnxnrTzjO?=
 =?us-ascii?Q?5oqw/UYs0T8JBhUibtlb4jrzWG25fj9BwwpAW9PjnQ01E7VBMduROMCmwLD1?=
 =?us-ascii?Q?yfa9I7y6VwjoQwY5bMELz2vnP2MowulJRLuyj7anjPgvXPHk6R3UmcGfqFOz?=
 =?us-ascii?Q?hNz3mbEz4RAnqDWc7P9ZyXdSfglhVsXZ/iEaaTKZiJWG+VfVkTbueJN6eW6L?=
 =?us-ascii?Q?6n5jV8+QM3uHHr3Dwpfx7dV5yYcBa+6Q/k6dfvQj+yvm928J+W4rbsG50H7L?=
 =?us-ascii?Q?UAYdNnGTrSlmvkCywcMu+wLwCzs1HAjrDiNY9/Gs1469c71/XkJgRbvYDr77?=
 =?us-ascii?Q?XJO82iIWSg4qiUaSdcTEY81w0hmgBy92x+oxYFpoWl3R386plsGnMxIiFc2N?=
 =?us-ascii?Q?upwsNEOF7dgOaquPmeFNAMZwGSytwk4wyTdUo8A0caSWU/TFRi6HNl7Ojtpc?=
 =?us-ascii?Q?GEISE0qjjmalWn78KmcpoFvQr1RNmiISuBxE/K6AF2Sbqag1HPjxIFwYSF5d?=
 =?us-ascii?Q?n0dQaErUOSKhfKPymIJvUTw65AfizrGPUO9HOlQAU2/u0moPSrksjvi/o86n?=
 =?us-ascii?Q?ont76IW6YkJ/dnqh2LGpLK9EkVESghT5siaB02nD7SX7OZuib1vAJ19ycSFF?=
 =?us-ascii?Q?jcT5Ky91aSse5Z7FBjYelSq1ok46fFGuIl9U4EjEPyCFLVHG1JPfwn68KmV6?=
 =?us-ascii?Q?zg429BT8B7aiG0qMI2gBO+p204bPF1Z2bupp3RbGJpkcehMl/SqVBk4LlWcN?=
 =?us-ascii?Q?RQMfhfJOIz7pFeM2rObXl9d1e67Ch8XL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2KD0P1JqfTL7aUemOGvyRSg23pQWuabf8vq4X+UwUoe1xU11MGRNtOufiYLu?=
 =?us-ascii?Q?7Een4MQfCjDWdGjTmnTMZLYqiajP42cYlnOQMBvE1fIvGGr9m0Jugzo5K3ni?=
 =?us-ascii?Q?vFjhKj+sTp9UrmFF9tb/O4FD8XNB80WH8K3ILbaGsYzrfv0dDAZvqS6SJ7vC?=
 =?us-ascii?Q?sXqz7KseC+7nf0GoNLidLweRYqriqTyvQ1yot5UyW6KMLxBlmRewGO8/C41R?=
 =?us-ascii?Q?+bLCapDYmeLqym1KeObKwmRUeH3n61BdHTWB+tC+7j0LKDICBuc4+ZrL4r+n?=
 =?us-ascii?Q?I7Rh/SXcrx9ZEDx0t5zaH/UfJjlmSLm6/RPefN7Gn4tq1veZd8+TJm39wJgx?=
 =?us-ascii?Q?8/7W3GPlHabn9KeBuF4PJzvQeOhQhucc8zk7zO/1+mS9P/wujO7lpGsyXx6L?=
 =?us-ascii?Q?4wuZP2gyW2C7JJMjGUtx7wR612z6yzxrGVo1TqTI/3IbjpKqFIk82Y6W1ZPK?=
 =?us-ascii?Q?uvwZMI+n0CC+seZBFlZIiTcr+ARauQdYQMBCBOIZO4pIyBKa7nIlVOn15NLZ?=
 =?us-ascii?Q?FiHJAR1AsQxUj0RNLXVMiHXOlfpxwfUDnutlVzfcAeSROBWs3cAQTrpu4yNK?=
 =?us-ascii?Q?BCO0aHcGVUVdYkIVszZ7knLu8sSAX4U9voMwJ0Yu+fA1WTd9oPwxV76NH5z4?=
 =?us-ascii?Q?hxE+4g6TsGwdP+w8rfsIX3vfy5eRMkkfuXLXujHAgtbR2G4JcJQ+LmkZ235C?=
 =?us-ascii?Q?vV1rXcG5QsdSwsrQYdfWxLBv5/kmgzScQt0zNz0gBBq2FlzQXR/O6jfKRM60?=
 =?us-ascii?Q?bY0761U3yVPNuIwb5DK21auMhQVfzAqK4WEiyvpoNltDQtJirlqFUF7lWvkX?=
 =?us-ascii?Q?MjDYXs9ryLMVb4tCzRWtUhy8kofqwNnyJ0Dnne8sElkSRYxDQttJ2+nCIFY5?=
 =?us-ascii?Q?Qb1k2M2R8nNW4ZxxcgS1RZbwOr+vTbcBDP0Qnqq6VKKOR7QXghfCNstapKZD?=
 =?us-ascii?Q?bCXfrGIXcmuu6aEIdnH1w2B9Y+jZJQ+aJUZdxchlWpxja/IKTQMdwZNwHqNJ?=
 =?us-ascii?Q?Gb6mn1MQs54xGWYzozZl3YXamdJsKlYBWmRbOCMXKZLrdqotCJ/Nsvyyk9hM?=
 =?us-ascii?Q?JkwooyYI98cfWi3Cu/nXRiIeL8ANIft5d+c1low0U9tJDLwZuMcdLRn0aWGc?=
 =?us-ascii?Q?X1qTQ58bZG1PBU+a/w+sgdIlaOO1A3qfKPwmJWiLBLSs0CSpKZRwoenDwX8y?=
 =?us-ascii?Q?i2dPuuk8FgqtKRmuq0Xlh+4DllRBd86qFW9Ej/nBnTY/hPgun2mq4O6rXYfB?=
 =?us-ascii?Q?vmdQBWhxvCshm2WNWhCpxWeS5CaTcXx2a4dAdq+QrZ4tOM78d5/sQFylRS46?=
 =?us-ascii?Q?SQsi1aNFLty3gtY2m4e6Fg95q/cl5uD1Bstipf6+x5VG61HFdnd3hRY9lOof?=
 =?us-ascii?Q?j7OikwRiSsA/28GZu+uMF1uSma5v4V5zAn/LnKaEKypqy+ZkbkD0aLU/Zr46?=
 =?us-ascii?Q?1d9QTKHzeApRomd4p/4X0K02bCjFK3oGr6ytmNsl9Vq58attvFzuQIp0vRih?=
 =?us-ascii?Q?ErmSralhY9R+d05Uv0qfX9iwPa1xBDvQUz6DQF4pfHm13/mR/MDGyBYNJP3F?=
 =?us-ascii?Q?81F288v0meKNZmz2P+rozR6tLsKCCXJesWOG48nJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d04295d-71e0-4b60-cc7d-08de100a4add
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:55:52.6431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUUqJcn6lTqJHbVWlog97ucfX8x4qKuEQcfQfHkVZ4Qe8NGgyG+yZqDljZ8Au/MiNq7bxHggYeMPHkxdWZixZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316
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

To support the usecase where we read a register and write to another
with identical bit layout, add support to convert bitfield to underlying type.

Another way to do this, is to read individual fields, on the caller
side, and write to the destination fields, but that is both cumbersome
and error-prone as new bits added in hardware may be missed.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 0994505393dd..2266abc3f7ab 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -72,6 +72,7 @@
 /// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
 ///   Note that the compiler will error out if the size of the setter's arg exceeds the
 ///   struct's storage size.
+/// - Conversion from the underlying storage type (e.g., `From<u32>`).
 /// - Debug and Default implementations.
 ///
 /// Note: Field accessors and setters inherit the same visibility as the struct itself.
@@ -117,6 +118,12 @@ fn from(val: $name) -> $storage {
             }
         }
 
+        impl ::core::convert::From<$storage> for $name {
+            fn from(val: $storage) -> $name {
+                $name(val)
+            }
+        }
+
         bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
     };
 
-- 
2.34.1

