Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD488C628A7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 07:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E3210E2C4;
	Mon, 17 Nov 2025 06:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="muouXfvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C4310E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvtQhQP80cO3uYsOvyr4FL17Uy19YcwzwIDL5lbdAWRZ+FiOSujXv+FXrMLnTzxnBWztXxJQW7LQ5V/UiTCfk+cE4DANYfWQSQErk3299Mq1SYZ84qJqLM9V2jHmXNcgTDEnpcCCWn566fsp4V+A4n1liNiaYR3Qy5QzRNFZRtbVTtNWXaNDtJkzFEPlcsDq3OIoSpON+CcfXtnFvzazVo7kGKjMknms6YqBb0wnT5c6mQA0IzXJE6wBr1SC6q953z1nILPvrHOp906sgk/hOqjldVQUPizRoF+j6rjNONr8dyPHVpEwcZfSQ3k810fDV6dJoqGqe3Oy1p0973BgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nriFT6XrbrTox7sfcBeMnmAws9kpXfnV6rPiiuLNviY=;
 b=Q0wBTYEza7GrR8KRoXItHJCylxOElnUp04g6NyppqoITNABocWCK68vFFgkS94ihDRUjQC50wgO6MFiplXrquAivieNRAyXd5qL48LShRhCxFUgW7+wkDfwGnBTTS5DRAFHBCxfKToKYS24bEmpM/GJ33x9Mb5o18gHP1zSj7NYQxTDOjH3dK0mZAvby96Kn6QTN9Td7D/Xvw51UM6TGrOk1IpSEy6Pb6kWDwDumT6lFASzeI9b3uFinHQEKfCbJAK94HDTW0knlwEE77iRVUV+dXG6IxgHrXUn1JSRkhwzJZMbEoecrNcJrPf/GmF3Eq4lm7wf6V+lgQDvAg3mLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nriFT6XrbrTox7sfcBeMnmAws9kpXfnV6rPiiuLNviY=;
 b=muouXfvBADZU4MwKtp7sXHKq4kS1TNCL3frTdc9q/3ou9wIYTyR04mYVT7soHdId79N1BALKxhWMLATZ1TasIpTiFAFunyNR2+MqSfyBE485ZrvJSLYrRk7DJA6kNBlUFZethUgqEFQrGCoc2pyZdJ6qtWJvILIz+L2aCZyQbyc=
Received: from SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 06:38:51 +0000
Received: from SA3PR12MB7922.namprd12.prod.outlook.com
 ([fe80::9b6:464:1a68:ed47]) by SA3PR12MB7922.namprd12.prod.outlook.com
 ([fe80::9b6:464:1a68:ed47%6]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 06:38:51 +0000
From: "Katakam, Harini" <harini.katakam@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify dma-coherent
 property
Thread-Topic: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify dma-coherent
 property
Thread-Index: AQHcVipjsH7TYINoC0qSGcnNCETQ07T2bREg
Date: Mon, 17 Nov 2025 06:38:50 +0000
Message-ID: <SA3PR12MB7922C216B3A409FF6C58DB329EC9A@SA3PR12MB7922.namprd12.prod.outlook.com>
References: <20251115122120.35315-4-krzk@kernel.org>
 <20251115122120.35315-5-krzk@kernel.org>
In-Reply-To: <20251115122120.35315-5-krzk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-17T06:37:52.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR12MB7922:EE_|PH0PR12MB7861:EE_
x-ms-office365-filtering-correlation-id: d95b2cd0-56c7-44fc-4235-08de25a3f860
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yK5gYC02RNSZf5AD+oHkdoJvu0LCiYIvt/ZUYG8FSHvG9k3YtaWDXArqEoFk?=
 =?us-ascii?Q?3VgAjttlTOnlRdaM9LP/dsqjbRHznilWqaXbCyltr8VvuYeaQ1hCnsyKGINT?=
 =?us-ascii?Q?cdoY3zw7czqiflFufT+YDDz7SNCdUkSh+fscUkIS9WWjwJ+xJlGLdtGWCRU6?=
 =?us-ascii?Q?hFHyotE2iZ0Fkx94OO+DceMfobLRmQDelBKPywMrgLyDxBUbNGR9M+3MIqIR?=
 =?us-ascii?Q?YCb0kv8G9D4SPy99Pq0cPD2cZk7VRJs8Yt3g2AmH2JdEzEeShTrjiQsuVy2O?=
 =?us-ascii?Q?rUfvMfjPW2T6fyM2RkUogpcbTDzwANu70L8iDtxks8bCh55S7zgyYZzz+0w+?=
 =?us-ascii?Q?ThN+a7aer7qGEON8xWao5crs3wOTCi7AzHuvFzMBXMWex95rkeUr/Vgo4Ae0?=
 =?us-ascii?Q?nlrXAUYaC5HL4sBTe4xlMGReazjgEqMWGbUhwIUghDquFpwUnh5ZJBerNrdd?=
 =?us-ascii?Q?FY5xAH1IQNqviCIsz/ogpSS8AKzS9keXhoiRJ7SXcg5AskIumtySVHU+6Rh6?=
 =?us-ascii?Q?/9urNwCIk1b/yIUOP7izpyIuekTk6hOAUk3G+G5Y7GP3nXPrqfAmJH52BW7O?=
 =?us-ascii?Q?vWiex04HIcdRhXJN9X2RLIDdGTevza+2mcdC1x8rSwanQ72AzOO+J+MMgbhM?=
 =?us-ascii?Q?gROwe9KwgLImUiavY9gW0Ty5EHiizYMJGRJuRAv5b6fII4aHcg+hC41szVyx?=
 =?us-ascii?Q?Kx8qcCZCLxTE4Jd928EpiK754Llyi5/uBTpXgd1p2dOLDCZShIKqTgHQpMOt?=
 =?us-ascii?Q?bT84iz8rY5/VPNLJJlLG1pyhUpqVFlYe+GDRq+YOn3XHZDF0gIntH3cK293O?=
 =?us-ascii?Q?EFAHADFE+1ulIt4u0eJJHTZp8mAIeMXf9pc+8bt1jlXSxap+NrhHz3FqiMVd?=
 =?us-ascii?Q?3B/76n9JDHCK/2JNevWoPxAeJmHXEEMOmKuo+z9KCMzdXdMCg9Q8nMAgCi7F?=
 =?us-ascii?Q?aGI2H3WzDdpJbaOxRU6WmNtIoimBB6asIk11riKG9eU+PC8EqioarA108TJO?=
 =?us-ascii?Q?vaxjQ50jH63tci+QQZb3I5bAl4I1J5r5N23iFF5pFsL7UqE4dVLhtoqq8B94?=
 =?us-ascii?Q?aFrXSTQuyTunC4srFZq0gDBkWK1gjYaHREH8/B1Y6CChmGkGqJVMMxvOIDAL?=
 =?us-ascii?Q?yYJXoDAsp5VNwMA4BLTjLn1aI6dTFcIOeJMPqgDl2YTXcARY7ZIqtmNQPPdI?=
 =?us-ascii?Q?9Sc70hPoY2DCbEa7Nr9SGxwj5m4XRmCy835aSwRGCsmG8u/Cg7fPZAlUvncA?=
 =?us-ascii?Q?UBAZYaKYyKMnxKp/MdNU1CthbXHJKJJFPMzUT3LurWYLUDwl4Xa23/D7q+2F?=
 =?us-ascii?Q?Isak2RAh55xNsKn7sShS9JyLqKDyB6TOl1NhTYChZHN7T0SIS9lpp8aa1LLm?=
 =?us-ascii?Q?6T1KUmVlpeBNNejAuzgpRpn9LOAv+Sr53ycKUFRR1W3a8ySja4eAz6tzaXtn?=
 =?us-ascii?Q?NF6RfEL/lyBQVjCON9tNxFsWVSg69jmhrSWRlzSEYvoZ1/Cf5DcB6uh0yp5O?=
 =?us-ascii?Q?j6Qjfhpjo90cD10Ta6u8h9zqtKgAIpG11NTcbPkmdW2DSzmQkZccTkf+4g?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB7922.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nsqmdI9rjqgktG79Et2ZNJ2UDJcctbXaXCQmahqaDo+O5sqzf0kQrVyX6Dke?=
 =?us-ascii?Q?vtX2OjRpfWur3UZTibC5yVIBvWBIzy5KC1xkB/0fMVJrquwDSQn1qKFVqnYS?=
 =?us-ascii?Q?bgQfb8bCFsC1A0JA96EBBXbPomuFla0sJnXQ0ud26+UVs+RNz+crvWhE6t3d?=
 =?us-ascii?Q?fVzA3YKd9Z7BRFKRzHy3baSsFiODtjnkkkzb4lshANd869+rjZl74PbkYGwa?=
 =?us-ascii?Q?XQvLyPhRvjxL0YaDenvjIybHAq44r5ukbc1HQRGL1PT3KWxJeMDV2jLj/BmV?=
 =?us-ascii?Q?kXpdfYufNJADSLF0YrL6YFre5NiDw4+rewdF+4DvYq/nV3TKw+uSnQtLs9bL?=
 =?us-ascii?Q?s4Eo1O0SBSKjZUQpKo7GuiPXEQqHhO4CLkc9CzVQ7Gg9Q72GfTt7mKHO4Jyk?=
 =?us-ascii?Q?+GwkKtLYIOy1ImUaZFFcnGOwYA8Ibl6SClGPIbYDv9Xr9jAd3xF2QIsPPoDx?=
 =?us-ascii?Q?5GEVPyxYIFqB2umR/5/+ZSQ8gpobLDSZ2pwdwovwhjMc3UbxX6Gm8LXXsstm?=
 =?us-ascii?Q?+bVFUjkAqY6STam2XdD/S1eJ1ixB4d9zUOvgIQXdIRx4Wm4dTO6bLej8NRxS?=
 =?us-ascii?Q?vbM5Cc/NoKrdornDp69AUcv/Pz/r4KRO28JZelkxNWPZmX1AGpOI6ICcpaLh?=
 =?us-ascii?Q?XKZz/2pJx8dN/WE/qSOH8KI+E6HpyAu3Nz6B1ZdeIaJ63KcnSO7JZtFkwhj9?=
 =?us-ascii?Q?gJeKtlTPMURTEQoWTdJN/dmnrnU+eSVgnSJYMDlD14uoCoAinZ8kzpqsCz8l?=
 =?us-ascii?Q?nC/RWYhrLEmMzWgteF0lDhlVPsbGvxx9GL4dystF1cbo7XcNlbUX+zobra2y?=
 =?us-ascii?Q?wMnnijsUzTWBJ7OClE0j5gJhEa7k7KWVFmGryMhWYVSbUhsxSopDUebIM8QX?=
 =?us-ascii?Q?w0unO8wyj4bpLgIK2gI9g6XFdEM61gMbNbdlyIpyGRwQfCZChgX8Qb9KzOFf?=
 =?us-ascii?Q?UUXMv3eKMsOgUEQleDl0biMiXx9fp4/7RP4W03NVry0z2+iVlx1OiNUPLbtn?=
 =?us-ascii?Q?z1UORYxh28hHbX5z9bLw2sCxoyQuKxkzt/kd3M5AIo5K67FYUff2MPbUCnDi?=
 =?us-ascii?Q?fWiyK0Orc7YZ0b5k7pAByutwoC1nDW24McXWkhWH5kRnVNLaJhQSHGkv/9Ov?=
 =?us-ascii?Q?/493oprwWApKCgjPc9R2TVtSsLcsfOS73pDnvkB4L7jnXzb48KI6N0XILnZN?=
 =?us-ascii?Q?NCwweIbttB1WYVyEecl260vHr1C5t/p74VKHfAZaMceVOckwuzWt3IkfOCAr?=
 =?us-ascii?Q?KPVWfPjzeK6CWRLimgsXWU6Vj2GPWsJGksQVXCto9dohz63hDCBfPvO5Yjud?=
 =?us-ascii?Q?T8mYefyvWVSb82iRytXffxxdSG/vU2Fq4Tj4qwUcPb4iN3ohFjndJra02eEf?=
 =?us-ascii?Q?uQ46bp5vs22MWoBUVaZRauEBLiBOYFxxpjloJj9DzVhbRTWdzPpLy47pRV6P?=
 =?us-ascii?Q?gcVx2ro3LmwgRj3tz1uTGfzXxnhQDo0ny5LuEGI6ZMlzW0k6LKMzcsWRx6i6?=
 =?us-ascii?Q?ca5drFRneIJaXsCjDWyVpkaZ8czXxQcr/LRYnzSnIDeMzIlHxxAa4RlsXLQE?=
 =?us-ascii?Q?9lIN1cchKhOrBNz/LXQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7922.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95b2cd0-56c7-44fc-4235-08de25a3f860
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:38:50.9522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6gKQ8uLQG6AiNPHvCNc13Gwn8uU4R8JnjhChvmdVnYwBVPhEKS9kFAcirflLiASG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861
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

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Saturday, November 15, 2025 5:51 PM
> To: Jyri Sarha <jyri.sarha@iki.fi>; Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com>; David Airlie <airlied@gmail.com>;
> Simona Vetter <simona@ffwll.ch>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> Thomas Zimmermann <tzimmermann@suse.de>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Vinod Koul <vkoul@kernel.org>; Simek, Michal
> <michal.simek@amd.com>; Ulf Hansson <ulf.hansson@linaro.org>; Michael
> Tretter <m.tretter@pengutronix.de>; Katakam, Harini
> <harini.katakam@amd.com>; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; dri-devel@lists.freedesktop.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> dmaengine@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> mmc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Subject: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify dma-coherent prop=
erty
>
> Common boolean properties need to be only allowed in the binding (":true"=
),
> because their type is already defined by core DT schema.
> Simplify dma-coherent property to match common syntax.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks,
Reviewed-by: Harini Katakam <harini.katakam@amd.com>

Regards,
Harini

> ---
>  .../devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml    | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma=
-
> 1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-
> dma-1.0.yaml
> index b5399c65a731..2da86037ad79 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-
> 1.0.yaml
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-
> 1.0.y
> +++ aml
> @@ -59,8 +59,7 @@ properties:
>    power-domains:
>      maxItems: 1
>
> -  dma-coherent:
> -    description: present if dma operations are coherent
> +  dma-coherent: true
>
>  required:
>    - "#dma-cells"
> --
> 2.48.1

