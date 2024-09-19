Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D697CD79
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 20:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06210E11D;
	Thu, 19 Sep 2024 18:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ntgI7Vom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC34B10E11D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 18:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLqfrZjUQkbCuOsd7CbA/K14ax1C7wwxTen8kWeRH4NxFtGcwUa+JTZEpex0EpXphdfAqapzt0qKzgqrEa7TUYFTPmHUR5k3SP55s2MOIygocPtp2hC8ECVLip9EVv1fvUIPfesk1aplHBB9IeAXvvDJwhOnVGN0OGZYKz7MX1KHd/t9F5PAucEIyBJw4+YKD8SG12vfdDGgwuy779ZMQ4dbQcn2A0963iUlJZtc0FJ+iWSISNYZqV/wZ3p4XrNe5Q5ndrPSR7OOH4qgX0pJSsA+PWj1bfNOiPWRgp8jqqApuxmd2xHU92Th5yjeiTT5TMms2xtIVKh6s/eFXSdPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCKJqQV6ePdmFx2/jya4P8e6eny8Hy2z0JXfS7SXOe0=;
 b=MZtTQnLg54/abJUyvLe56WB6lzc34BAXwa4mM8EP3EJHo3Rmm3+kIev7Xl+f/vg7AovLmMT1YdKJF1dOJXoouPeme3AJjKxkVFgMpOh5Z4RZ2JKf+PrCe5VQ2iek+LYBBNEPpVCua1Zz7GEk4tjWFanOxuB0Xp+h7j45Ocnbm646adkfoYAthL5d91tQR1xYQIOJMidLS//4QR2OskEI/MbUOTtgVbwtbhO0grzWD+X9jGk1k6KaaG9/G3lPmsAQH3aTszlx8kNyEX+MF7wvhCLFax+UA16KE7tS4x13ZDqOMnkVEQL1mUJW1pTab8nF4H8mMnslmUolGXmrHyLaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCKJqQV6ePdmFx2/jya4P8e6eny8Hy2z0JXfS7SXOe0=;
 b=ntgI7VomsWEOFf+DfBsJee/M2Ob2Yb8uAaPoSEHo78f1NKFnJmFO3VZD7n1zRO3dRAsrLeAD+UlTD5ILKIHPVb5lJHRRq64NZ5zeBIq0Il//ejB9TFO3oxyM9v/QRkjnzthTDcFin37mKROxkFT5Ceuc05QoXSaKB9373aavJIcRB/W/+mewp2lnlpYLTUwZkknFhL4vXJhFPSES64jV+QaILdJlgGYT/uNxyLhSzPI7/X/lqIMf8NysaMM23pc2OysJgtTIto0UVAzZysRUCV+ahdV9uJdiltnLcDuS1s4nUy9m+XAj43+2EcuQ4kbtqo25ZaQuPJrS4O07ptKXxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ0PR12MB7458.namprd12.prod.outlook.com (2603:10b6:a03:48d::13)
 by CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 18:14:04 +0000
Received: from SJ0PR12MB7458.namprd12.prod.outlook.com
 ([fe80::3518:64f8:f908:eb7d]) by SJ0PR12MB7458.namprd12.prod.outlook.com
 ([fe80::3518:64f8:f908:eb7d%4]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 18:14:04 +0000
Date: Thu, 19 Sep 2024 13:14:03 -0500 (CDT)
From: Vidith Madhu <vmadhu@nvidia.com>
To: dri-devel@lists.freedesktop.org
Subject: Changes to `vrr_enabled` property
Message-ID: <dd6a9d79-8a90-89c7-86de-47548a397a9@nvidia.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: SJ0PR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:332::32) To SJ0PR12MB7458.namprd12.prod.outlook.com
 (2603:10b6:a03:48d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7458:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d64cd2-ad8a-49e1-2891-08dcd8d6d835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jviIahvGmBMDlXbZNCcrsI5mc4eNl3/bJMCMoBfnmQkZmkwLQZJBIH3u1v1N?=
 =?us-ascii?Q?pBC0RpJdmcVFU4UzJ5Ht31yJhP34aHyGRVvUvtvAAHM8bk+6aO1dQgXBEqjq?=
 =?us-ascii?Q?gZzxbxW3elwAFNZEP0ekCURajmNVumIon6FRSTG0Ih0C3RBWBQ9vFRP6KWGG?=
 =?us-ascii?Q?nDtOTGyFXDPSG3EeZ3ZGjqhRgcZ+zxqY3M4xS88adAgc5cYWg1lFyS0veNyp?=
 =?us-ascii?Q?9g7q/xivBjBC+Xs6nTGF0hKMaqhkp423bY68I9kE0sHBhLU9Ft46jqWb/Z0M?=
 =?us-ascii?Q?L0vmtN996K1/cZO3ov1JjQRL8EQp9rhbPE2TM8bROC2BJlH2PswWU8ASZuMB?=
 =?us-ascii?Q?rxZrArWB8Rio8eS7DTKSHvYbjgVw7U5+5cmlWwAGKR8lsHwo+8vGpzLfHSZn?=
 =?us-ascii?Q?RpEB+LH2jFB3OC2buLaFf9e4SgMw6V9z6jfRu7iy8wgz07LcwW7BLcp/T99M?=
 =?us-ascii?Q?lWmh5DmwrKxbn9WzEm/vUTQwK8VSTLefbERvLb4Hx1Ss44vMbl6eu8+EYN9c?=
 =?us-ascii?Q?0Bnzb/WEVgkX1Ir3iLZ+C/eMo5BmHhxWrGAimt1sgQk/b4Jvy1uIA2kwFPb9?=
 =?us-ascii?Q?AqQWf/zlUdVW3MmBDJuokGGRffL2JlOV679HTZ/aQv2Yp4rV0bCkO7A0XVkU?=
 =?us-ascii?Q?2Xi9fzHaM5IEmMEXF0Xb1h6C8OfgvFWqb5PnLNgRllwcOS0FZgixOt0fJ1y2?=
 =?us-ascii?Q?5dX+fjLXZ2qBC9w/ICUl6cDn67c0F0UvMcAi1xBDFWirjYWY5bNIrKSI4K/r?=
 =?us-ascii?Q?kcr0w3CcdPclA6Rgm70ggcM+eWA133D5agNB1sUBrZPR9oLuj7/c9pnJinrk?=
 =?us-ascii?Q?SnV+u4Jr3Rz/k5A9Nh8lVL1538LBLqolKNu4znVaFqrjDZGdbd001dnz/ion?=
 =?us-ascii?Q?Yv0CU90mSHI1jS1qNYYwXGVn2l/5X+g8xIDPxJnCU0IhBnQIKneQEEBzgso3?=
 =?us-ascii?Q?OR94u7yZwT+NFhHGpS2REPlQ/ygNtdKjevFMn5t2bUEJzzShSv/ogphH/Yvl?=
 =?us-ascii?Q?Vm9BlTFA/iw/LKpjaAA3xsUbFcI17A2KhM06OB1qE7fTuhe7MNAJL6SBDI6S?=
 =?us-ascii?Q?czs0AM8j5OdFWyioOqM5LBQbZ3VHTmcAKMsN8jctVw5Ym+8PZeJMEWDMATTR?=
 =?us-ascii?Q?hKvn8dCqvyufnz3GIdUCTWgJX9XCqsqxX2XBtFp0ubfAwOHQJ9H9tf9RfXNE?=
 =?us-ascii?Q?2hmsyc/m6ybCk+RqUx1TqdRlfcWug/wUUgqzIcQg3V8Y0Za2svwxAFLa8ZtP?=
 =?us-ascii?Q?bdgr3sKgovVOjSpifhUADk7LM5mdYAZWWJlUaCJF910EqmZsKkfCojj6xEhD?=
 =?us-ascii?Q?Qk0owZ3r3OAhtkV4WYZlMGs1kc3Md0b56o7vOD+V3RLmyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7458.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LqQ/h4YWKc9NfFEzErGj7tem62WwKaGdkAUL7+uBRpV6fkXOvrIq33AdJdzP?=
 =?us-ascii?Q?YiAmxk500mUtYORg5dwmxhsATPRZlp7QlpXq/zsqkGSc7PBqD6n0A0AQGCVv?=
 =?us-ascii?Q?nCrGvNDUnEGJ4ZKtBYjznzQy1IXdzqNJTZtUdcDOI8QJK/zEBFMl+RuUFHWi?=
 =?us-ascii?Q?6tdPcCWB3nTz2v/Xce9aSo5gJCWWHaX/3km2YZrq9f9DJvT6bGg/7BnN03Hj?=
 =?us-ascii?Q?GC4+V9k5n181I/9yjXb1p8ZeIhNlnWQJI1GB6cLPKumCLR8UY/Rpfh4DjwUc?=
 =?us-ascii?Q?QQQ8BEMdzC5vWlTIW9ayYVOygqnm26IYdUutXWO2Hgyi5jbU63XfyLHfKgDp?=
 =?us-ascii?Q?xXAxaQofPntqJdWkzYA071S8OLxS1oyyAXx6GCwTRysmMdOcSLq1WaPsZNLF?=
 =?us-ascii?Q?6tfRCipWayo68M9aFAgJCKXALm6yR+M2NY1xaJKAPfj8WytZdjzxyXdpOrNy?=
 =?us-ascii?Q?JH7XPdoq2K+jkdkKQI10ZeQ6jNQBLmsJ71SW4/Ag8T6R3n371Zf0j3VDF04Z?=
 =?us-ascii?Q?wN2L0EOVQhU47fnKujd/2ZxCGriVatfesPyXUZMHfDsHK+u1Z51CNPuJ7iLu?=
 =?us-ascii?Q?o9mAS3uAxTWd13OV1a9SgfZUP4UFIJr5kuLHv5Y2NK3+uTdtT9An+JTQ56sV?=
 =?us-ascii?Q?KyEQM93+dr8qipVM+D0oIynVnfGjdzXB2dMuWVRnCfYUaZ+1cwmJiusyCLnO?=
 =?us-ascii?Q?tTXt0wVTRfw0ILpxjm8OgZjHcOWcvg3WlGcehQ1pRkx3wQtIiLGL3zKHO+MA?=
 =?us-ascii?Q?IpedCNdk0x+W1fcV5sw3ellEoh8ZnZjDyCNsgzS8cwBy8+G7MQFBXlW0vqtN?=
 =?us-ascii?Q?Idfgz10fwxtp2z8vCK4UkRw69lnCfQrHItJXsgAg4xCx8osducG9VfpbYaHA?=
 =?us-ascii?Q?gRsJdoKXpildI7xHidbXautHhlXiL7yIDOhvlTk+JW1DyZahxjDP1aqmOepZ?=
 =?us-ascii?Q?Abe+amrpKiHHDbC/+anKcv9rQ55SwXhpsY01AIR1FNh/5xRpJL9q6UjA5RYB?=
 =?us-ascii?Q?OR4+e4SuIwIZYowpILXjpTpo0NvgIzpSfVhreXAcjAcuWUDdE76UWvwDGvUb?=
 =?us-ascii?Q?9rornWNDgoeTZLaGl+QUUPUmAuVD1OV6AiRI0Qqd4jDbAsGy6uhaUovrWt5+?=
 =?us-ascii?Q?liyK4anu/47PuoH1yukKofHygGKX6mmPE65zzKo2T9NWf1SDWQV+VAq4oEPR?=
 =?us-ascii?Q?RDdp5Ka7mq++GE0zn61bWS2cA3bGzXncaGv54Us/3CHapKPFZ0UfQ6v72z0H?=
 =?us-ascii?Q?5m9aJFvtQ4G5F1k4wJCy4/ugpS7TchvfkN9c4eyH9BzMcJ31diBxvs3JibNR?=
 =?us-ascii?Q?ScT6/MqQQjPRDckapNwuB9kFrQwZqMUfq1hzRcGUYmRCQ1WglqUhT9pI0SuR?=
 =?us-ascii?Q?DOBNHh19c9yrkzpGKPKnOGZ+qCvaGi34cKxBqzYu3V7U4hAS2vEEydF9jrGf?=
 =?us-ascii?Q?LRfPa/7mhzO8W6wp/LNGtfca9HVxgXk2QVy39F8zVugVw9x2/m9FWLOmQLd7?=
 =?us-ascii?Q?wuZVvfll4arVxmlfDVMxnPcVreku+gwHSjiGiYjSMjCTM0bNfgJ/4LowZfS6?=
 =?us-ascii?Q?G8VNNHpE+W6nYAPoH88lDQIUookA5eCHY6UYobw+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d64cd2-ad8a-49e1-2891-08dcd8d6d835
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7458.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:14:04.2407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRymYTLxD77l6b7IOSpW551m1GqrnHW6FuYnZiCO28y+fnwn5YyQ6l7Qa/aBYmeTAKchW8pHUB/KRhFtgIFluw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227
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

Hi all,
I'd like to discuss a potential opportunity to enhance the `vrr_enabled` property of `drm_crtc_state`. Currently, this property is a Boolean flag, but this exposes some ambiguity and potential disconnect between client and driver/display behavior. Namely, it's unclear to the client whether it must allow a modeset for changes to `vrr_enabled`. I understand that the DP spec mandates seamless VRR transitions, but there is no such requirement for HDMI. Therefore, it is possible for clients to toggle `vrr_enabled` without setting `allow_modeset`, when in fact the display requires a modeset and/or display blanking. There are multiple ways this might be handled, each of which has flaws:

1. The driver proceeds with a modeset/blanking transition anyways, if the display requires it. As I understand, this is how amdgpu and i915 work [1, 2]. This is a problem because any Wayland compositor that has the "Automatic" option for VRR may transition in and out at unexpected moments, causing disruptive blanking effects.

2. The driver initially forces all VRR-capable displays into VRR mode, and controls whether the refresh rate is fixed or variable on-the-fly. This is a problem because many displays have features like ULMB, motion interpolation, black frame insertion, etc.  that are unavailable when the display is in VRR mode. This is how the NVIDIA driver currently handles the situation; there have been user complaints about this [3].

3. The driver rejects the request. This is a uAPI violation, as currently `allow_modeset` is not required for changes to `vrr_enabled`.

I would suggest the following approach: Make `vrr_enabled` an enum of {TRUE, INACTIVE, FALSE}. FALSE would shut off VRR on the display (potentially with a modeset), and TRUE/INACTIVE would turn it on (again, potentially with modeset). INACTIVE would have the driver lock a fixed refresh rate while keeping VRR enabled on display. Transitioning between (TRUE/INACTIVE) and (FALSE) on any CRTC would require `allow_modeset` in `drm_atomic_state` to be set, else the request will fail. In addition, it would be the driver's responsibility to implement the distinction between TRUE and INACTIVE. With this change, clients are forced to declare their intentions clearly, and driver-side ambiguity is eliminated.
 
I would appreciate any feedback or discussion about this.

References:
1. https://gitlab.freedesktop.org/drm/amd/-/issues/2200#note_2160244
2. https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7542#note_1643183
3. https://forums.developer.nvidia.com/t/cant-enable-ulmb-2-on-wayland/277478

Thanks,
Vidith
