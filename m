Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DFB7EBF28
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 10:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B7D10E507;
	Wed, 15 Nov 2023 09:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02olkn2099.outbound.protection.outlook.com [40.92.50.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FA610E507;
 Wed, 15 Nov 2023 09:09:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Npdft/OGYuMbmyAUX0ZvKN51KFI/lSAI0Wtst8V2Ct9zVLJZKrgvpJl2Yt5OgQjleoSZHrjVWu/MiSbgMLs6liphGqlG5FS3E86u0e+NC/NkN06KYopI2Zp6BLmRffaEN0OSgz4z/g6w7fUrqjwHF86G1DwpoYUlRNJ5pLXsvq9yAsjP7VATY0JddW8g38AVIlaNTLl6QFRfy8Lf2IYkJ/aHxta37cnoMFlnhd0syrmxNoGLDWtsyEByMbvVhg4Epws9C0yfJxAgnGNOmYaBqfLSq096YSZ6rykdpen6XoKDK5UqC46+VzVbYVun2ar9SnXK6qTF6ZBa0j0fwY1Zqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVufSnjklVtqYF/i2zyON1MCgifDrEx/Ju38yb3+pAM=;
 b=S7HXj9W6fd5f2lDgomLVneLC/IJdwkIjOsoJGLmeiowJucva6gD9UIs0roJrPJxU+WCU0lxX90EvDoHvcq50jfpt7EA6tGp/pQeYjf3Nu4fSyqMEf8zHUP/SdHfdvB1dv7vrcAuPaVXm3UT/LVoVPrtJgymsNtRWxDevjZCCxkGuUf8V4XgFYEboa63qiVN17SPWstgrISCa3k6pYptuNK0Wn656DNbGEjtvaMX3qOuXYpxTS8z0Kej2veIfNpImoDcir+vTDobmQ0+0nMKXQQLctDOA7jf0+EzMS4/N8YrcDrsRnZeV7M10fcy0gDdFPSzOyXnf7qX7nVZLrT7vJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVufSnjklVtqYF/i2zyON1MCgifDrEx/Ju38yb3+pAM=;
 b=IW542DAiHHO6tkqqS6GfvEVWMmSOuNXJ5oa2Z8S8OFxVhBy3EfOPDCX3z0JLzJvGX8iopHkpAGt1uBY9qTF2Vx7snr+dQEc1p45F9sRcHrp4FDvqm0OadG57rXWguJ8y5ao3zEQR750ERcXiG7LRGleJVNdYimiHZ10st3pN+Z2NCKbpncaCDKHOjYCGt0QvVuK+IASENuey2EVfrsaoUIMT6xZs3M4FY/+e54g6T6hnN58jBpulqFgmccw9tWz3zd7omASdQRhYFaHZfAiBiIfx4p5AbSVEB/bMxQz5TXjMqWL1bVgdk+zXEGyqt7TmoEaAbuDmMpFdIP0arkp2gg==
Received: from GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:83::20)
 by GV1PR10MB5937.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 09:09:14 +0000
Received: from GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c45:bfdf:a384:5450]) by GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c45:bfdf:a384:5450%6]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 09:09:14 +0000
Date: Wed, 15 Nov 2023 14:38:12 +0530
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Prevents NULL pointer dereference in
 nouveau_uvmm_sm_prepare
Message-ID: <GV1PR10MB6563980A0097762C6868E2DCE8B1A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
References: <DB3PR10MB6835FA6E15F3C830FC793D2EE8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <6a1ebcef-bade-45a0-9bd9-c05f0226eb88@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a1ebcef-bade-45a0-9bd9-c05f0226eb88@redhat.com>
X-TMN: [6Iqutr5U9611Hn/yxu9KtnQuiFevF5DX]
X-ClientProxiedBy: JN2P275CA0034.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::22)
 To GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:83::20)
X-Microsoft-Original-Message-ID: <20231115090812.GA2381420@nmj-network>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR10MB6563:EE_|GV1PR10MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6aafc1-a82f-4db3-7b09-08dbe5ba6e59
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aM6hab7v2ftiW148wwotWQ8J/R3WvAn6+iq+8Id/xRZUpKp51RLxQLSQMyhoUlfTTSDZn59/IvTPYPqFwRm+y4wVjIO47TDebKb3+B/eMWx6aeBn8YqdBgyRd6biwtNGY3ED7FgT8B1GTm5oOmKk9nzG3/F6hfbi2Rarx+GN+FAFgeAtX/NquGI2XfRutVUa6N9exKA5vN9fgcwlNZrAflM/Damdhkyn+WtJVlZvvJyKbTTQYB1PUQmCiumn0O6Edq4c/OoVMDLrzNUAgdgSnCe9XPVcKn5cfeGVAQ58IPbmT67lJ0VyZp1vvcxlR2qewFfT+u70//3IYLCM0tk9B20c7ji3pEpO0LHNnzRv4p1IjORUPA+s2cHW4cORL/8dmgazbesBJzXjdL1bKs7QU2tPXbjkSVD6zt1QXsSus16UvUT1kR4grfhdby9VMvzRcPJOfTcxokOBGoovBJ4tFjv4Fj2i0qa6++EA9xQnCux7z3cKfm8mw6auS6gxk/iK+E8816um045AlEx9Xb6/Ud7SD8ywrbKUgyzPatOO0IFbUkohFgc8fr6fqCS9Cvy+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h3CH4Q8PKXybcKFv5OAy88ojmkvCZdx3xRLcOSq3Dg8uWYc6gd0vc9DLp5Sl?=
 =?us-ascii?Q?fGXNnW/CgZq8fxsIIrZU34+mfUiCRuLzLWZUfJ/x9FkBlIJ2A3J5t0iG/1K/?=
 =?us-ascii?Q?QarvwQcKo2jXvtiYyL6NiZC9LChAtgoh4JNNSBmxtI4cEaVOxdC3GAbC92ZB?=
 =?us-ascii?Q?ZEqP/lv7pwUOF/mss5m29Ll+7aaI0QrjAR+e8wHNmGRu4PuV7HZt2R3zuxQ2?=
 =?us-ascii?Q?XwgQx3spbofO7R+HhzAgTL+v/+kp9nWweGDG5GyTgONKN+8yoiO8vRIf3Fw6?=
 =?us-ascii?Q?xg7pn3ja3dg3woIpghFB/ae2syrmkdtxyeDQx8CXLNujj2NrfuBnN6PE+E49?=
 =?us-ascii?Q?JQokkvfjKqUtjv4eb97fXjYMeIryKSHH8iMLOSdebmlvlMYplByNvepqTdHM?=
 =?us-ascii?Q?D/AdSJgnjBygjVkpDi0nAeAEmulxndx48EYu1NCpnktxWEngjdYH9CzqLux7?=
 =?us-ascii?Q?3tXuYCpQIXtjiO9yQltTe3euMS8eZLJSSrJusybM1Mj5WxOQJe59NDXpFE4Y?=
 =?us-ascii?Q?FprLe9R4blEC21fH5RxEJFAlFTErdVn+hRnJz7uExTiNolEuy5GMTcZ358nS?=
 =?us-ascii?Q?YmpI4iuxuaCjb5s/yjOCDcLrYnVt5AD15TnlCWT4elgOllG3EXB3JZxza6Xf?=
 =?us-ascii?Q?VmPyIvoQ4xzX26FxvYzt9G31Aimj0c/vd01IF+mPwM1pfSV0JEXO00yPwVt3?=
 =?us-ascii?Q?TrI9cYDEQCAHeulxiA/d30T7DKwNk8iCEUtDAbcQkd11UX1uQXSKA3asnHiF?=
 =?us-ascii?Q?IK/8iCZBuxblC3StJyMS7QBd+2AQP26nZDhqM7/qfHozHYzTjJ1KCUKgl9CC?=
 =?us-ascii?Q?7tPBYAAH2N8vzEWT6FO0JubLGnug66LJiOciqm+w1eR7q1c6Faha9eBf0CP2?=
 =?us-ascii?Q?+LuaKFpairwXlsS1b7JCssm1xDiSNASWZaSD47Yp1fRSh8MzvGgLFT1USyZh?=
 =?us-ascii?Q?Ya1tzuzIkNZrpQpCwoB5xfBX9M8xTOOwWFssaBqZvqcNr8w4fWegjrddaq6P?=
 =?us-ascii?Q?SmMe9/p4xi7eHrUNJHf9Zw6Sf6mAQ6PAqIfW/N1Zf03Rb6aPqtnAeFGFcJrR?=
 =?us-ascii?Q?qPysucbZaQoHnlYuKFrWxMyahVECcxomffCtSucwzvk2gVUjjT1xgDJx8kiQ?=
 =?us-ascii?Q?yy6SzYYuJsz5HT1ocjw4ZC+xF27zrzIVvq7IdJwvVCSvkQ89ElcTNxLl8Zf5?=
 =?us-ascii?Q?/1wZltK3VLf26dKRZ5sPOGeIB+ZxblV2rTKPURMQRdQE1gYr26CKPLY2jwI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6aafc1-a82f-4db3-7b09-08dbe5ba6e59
X-MS-Exchange-CrossTenant-AuthSource: GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 09:09:14.3652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5937
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Danilo,
On Tue, Nov 14, 2023 at 05:23:59PM +0100, Danilo Krummrich wrote:
> Hi Yuran,
> 
> op_map_prepare() can't be called with `args` being NULL, since when called
> through nouveau_uvmm_sm_unmap_prepare() we can't hit the DRM_GPUVA_OP_MAP
> case at all.
> 
> Unmapping something never leads to a new mapping being created, it can lead
> to remaps though.
> 
Yes, you're right. I certainly hadn't noticed that when I first
submitted this patch.
> 
> This check is not required for the reason given above. If you like, you
> can change this patch up to remove the args check and add a comment like:
> 
> /* args can't be NULL when called for a map operation. */
> 
Sure, I'll do that, sounds reasonable.

Thank you for your feedback.

Yuran
> 
> Yeah, I see how this unnecessary check made you think so.
> 
> - Danilo
> 
> 
