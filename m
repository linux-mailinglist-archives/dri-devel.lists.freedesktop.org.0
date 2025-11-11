Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77862C4E949
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 15:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5FE10E5E0;
	Tue, 11 Nov 2025 14:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4P9MiOXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7D10E00C;
 Tue, 11 Nov 2025 14:49:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLr6zKieMSVVefIlFTh7nsIlEvZpHlmLKfgr8BaEY0Y8L5rqp0Fj3BxStwAIBbT5BGQq1k67Uh00lg6IOUu6z7+68JNOe+6BJ5sywANpENpahOCVgN5sNEIekfhYBCZ1Tm1xDGNIV4O/gQo51keDFUfhN7oCVMUGYxtBukaXZxi8SqO+vubeD25jv5He1IaKDAuqqsdrxf7CzTQUGJebnOxx+K1TCGWwYnizVSg5SorW/8xTR1m0LUTBq9AOozQCVgvgXYJEHg8Wio1BNC91aH4ojUOJ02KjaRRsxjcyZ9uqD4ayxZdOyGFjAe79f/K6soKZr8KE1omYk9ex0pbOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkwU1mVH+FzBYHWZ3X6mk/Izupa+NNZcIjjrI7JLXfo=;
 b=AOudp2oYNzb9houkyo++FnpeGyGX0J5MHiIWdJfdMNZJTqw/1zUbCC0+2M+o+gFF52D32J9Y9LWAANI1keCnJPbVVLgchVmwtmtB2N+rVJUXBmTstK5lSCA7jWzn1ZL/mJTHMdV+MYWOjztNGMHtEJHoYKC5u+oDxBsIrbaTiRja7keZYFQhqd4svBu7KtgHzKK9nfQswo4RnzP+qOG5ZDP5jsW1Qo2SrZS30TGTvJTYmpFamBxSka3CseZTOFwp1iJMrlDZP7jPrVtIDWq/CPGLPhgsh+J53ZR0wFAH6HVhVL/tebQ3ZHA4rUuaxckh9C53KjO4WkW01owOr5iNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkwU1mVH+FzBYHWZ3X6mk/Izupa+NNZcIjjrI7JLXfo=;
 b=4P9MiOXgvEP+e7EzPGB5BGeeuBZHm2J677y9FNU1WMGmPWwaOhSXPDvMxl0uv8xTfoPZeDJVTGqK3e/GeBu6cxClu0JYS1+9LWRsH6W2WWGiZB2ZrD0fq6nI90UOCmvHGVzrVUKwbB87qtvUOkzbqVy34JSJs3ATrrVFM1qdcIo=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH3PR12MB9147.namprd12.prod.outlook.com (2603:10b6:610:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 14:49:53 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 14:49:53 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Corey Minyard
 <corey@minyard.net>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Dr.
 David Alan Gilbert" <linux@treblig.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Matthew Brost
 <matthew.brost@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Vitaly
 Lifshits <vitaly.lifshits@intel.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>, Calvin Owens
 <calvin@wbinvd.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sagi Maimon
 <maimon.sagi@gmail.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Casey Schaufler <casey@schaufler-ca.com>, Steven
 Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, Viacheslav
 Dubeyko <Slava.Dubeyko@ibm.com>, Max Kellermann <max.kellermann@ionos.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "intel-wired-lan@lists.osuosl.org"
 <intel-wired-lan@lists.osuosl.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>, "ceph-devel@vger.kernel.org"
 <ceph-devel@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>
CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?iso-8859-2?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vladimir Oltean <olteanv@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek
 Kitszel <przemyslaw.kitszel@intel.com>,
 =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>, Richard Cochran
 <richardcochran@gmail.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Stefan
 Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Satish
 Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [PATCH v2 05/21] drm/amdgpu: Switch to use %ptSp
Thread-Topic: [PATCH v2 05/21] drm/amdgpu: Switch to use %ptSp
Thread-Index: AQHcUwahm1/91wHoNkKlQRJwdZtlULTtjo6Q
Date: Tue, 11 Nov 2025 14:49:53 +0000
Message-ID: <BL1PR12MB5144DAA1CB83640FBE834FFFF7CFA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
 <20251111122735.880607-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251111122735.880607-6-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-11T14:49:03.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CH3PR12MB9147:EE_
x-ms-office365-filtering-correlation-id: d4b40aa3-753f-488e-1215-08de213192e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?OrgQba1o8VRkBRZy5KjWGPJFxxdvb9PI2OytFVyn9ss6KeRgUuNKhjHq35?=
 =?iso-8859-2?Q?TostFJ91nWS81XunmUZXFcM2dNwFIbkVmwmviAN+9MjVoCn72yk+qV9/5A?=
 =?iso-8859-2?Q?21+5lZS4OSEk52i+HU2wOlVTAPVHrqsJeulWOiRwU3/W7rwng+pLW2yAp+?=
 =?iso-8859-2?Q?As3Ne6InDCuJtLmdM8uov6bkArZCyP2vOHy+lt3GAWT01g6K5BgDCr2uC9?=
 =?iso-8859-2?Q?gf4ACKmQUAIB7dloGnx7EDamcoMLI7LN7KDxEM/GgryhlxofaJUn54ONUo?=
 =?iso-8859-2?Q?87XOuy1pofi8FmPIPCfM2TnaXnPHxJAV0CBZqO6++8OdKlBUDhpCMtlIZm?=
 =?iso-8859-2?Q?aunWC2gJWf6w0vRU3d9r7qYJTuKlUZZM9YLSTWYgwHzAOiTEoGuYVN2SEn?=
 =?iso-8859-2?Q?hbbGJ09XHFDsWtThS7skygDzK0JLlRoixUeCBowVxhRxdT9qCGUaESEHZz?=
 =?iso-8859-2?Q?inQGnPOVbW1Ym7bDVbXMAiH6oG6Pk3QVQwVoAEe1FroEFxhmFkNfjOliQI?=
 =?iso-8859-2?Q?TSBwpejmYUIomMkjHXkMn/TZ+A2CBlihIjFM0LN+Ttl3qet+43xn0ORJny?=
 =?iso-8859-2?Q?c6k6BReErVvD5d/rPI2DEJd+wLjA3QGsBhggqq+j+SIyRx69buZvU5zOGB?=
 =?iso-8859-2?Q?Iovxhmb5Hev18SvFA3KGQHd+9cC8H/FFHvoO0zAQ++a5eoduMTa6BIYJCM?=
 =?iso-8859-2?Q?KM8Hm28rtQBlYR37ydHv8Ix1gpMobT6UHT9m4rYv1FeeV1S6CH9gzPviZd?=
 =?iso-8859-2?Q?iRBR/QrNWdDIOs53ce6k8U6BVctuRZP/B8fEW0rS/sR4g0GqBBvS0K2Lcs?=
 =?iso-8859-2?Q?ooXVutaSDB5BgNCt2OFKXSqZmozfl3Wi17iZHZlEnq4Uxwndzyh0xV035m?=
 =?iso-8859-2?Q?Zd/y26S9fGY8r4WKahf9kzkOtVXM50z+Znb5Igz94CrhVMvB6G3CqIJ31z?=
 =?iso-8859-2?Q?C0aWEQ4nSVIzW7LrUPygs19CkKZLZ0+k+SlA5pbFEoB/0GXk09e+tbaDGZ?=
 =?iso-8859-2?Q?tQwmpzNwF7Lkphf9pszGwyl7CsRPAV5/OnmXvYIGCiCuVqfckFKDFkTUr3?=
 =?iso-8859-2?Q?Q2VRcX9xwHIQS2QKu2Zsi3AotquwCdxWm4a46szrCjX9xPSQs027Rm7Cl9?=
 =?iso-8859-2?Q?4b085D4VFJV0eboQCARbXD2zkQ76uWewrb+xqoHw3onhtBEPlWOezuxiSH?=
 =?iso-8859-2?Q?PtvjCkcR3kZ7x6cjCVOdh6Bcnigv6mXjZWYm7kMNFh8XlAt0M135Y/vzuP?=
 =?iso-8859-2?Q?4kHzyErkKxpFPVf+wj7UWcwfYNKqkP+XTkHACDpnvNjyFieGfOYm/IEr/6?=
 =?iso-8859-2?Q?h93VPcZULXAj4o9XCHEh/f5CxjM0h/55TO4i0pS8C704uFEmSCreSXZzkq?=
 =?iso-8859-2?Q?DFkORbsr9XMN+B+8bpblyDG6BB5Mu7wP/b4jm2Bn3qzPx2XRhHwduUFLyc?=
 =?iso-8859-2?Q?ngfIa6ZBGzNEAUio7tLJqTIpPwAYf0BhC/gvyivI6UEpHF6YrCTeGYG+tp?=
 =?iso-8859-2?Q?/HKhtRnFwD7iRSeeaIy94LpY7oQi1insn6B8R/kOoYspHnlG8YuppUjqHs?=
 =?iso-8859-2?Q?0glvuqnkbygBFDPvLiba3YNSWWURlRA8Vo9XEbKseLDk9A/bFw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?YdFRE1eWrPnF1GjQxYY0iivBiOqCLGtbo/c8RewREhlsgtC52oCM8zemPI?=
 =?iso-8859-2?Q?0qvXvKbT+ZMeYZQXNbhSEV8Sg8tSlMGI5V2NO0+p6pxP99hKRk1COI4llZ?=
 =?iso-8859-2?Q?ST/JV80w6gw+skR6ltDbLAnwO2u/lLPr2sO21LQh1+CXnIRMinHpG8MZx1?=
 =?iso-8859-2?Q?nEW0grvYDrKv97xxD7p69ayMEcyrpAYL1KwPs6f5M7syyFwQB7/xxtcCNT?=
 =?iso-8859-2?Q?/bsNITszdE5LmV4JeNJOTz4Q0PEfx36uLSXyMyFtjPFNGBkZlz8p3TdPCw?=
 =?iso-8859-2?Q?NApYU7IU7DQCUNCWwTq1UKY0MDBCcvYjDJ7UgtoMKQoco2TX8sgzA5FjR7?=
 =?iso-8859-2?Q?SgrOJQfMoipCUnG5+xURExhi8TNpm9Z+S69rbDNORhsb9Hr6+i8UutL1JA?=
 =?iso-8859-2?Q?Pss1pw2Ox+ih9kSrok60aWWMn4ak12yytPJ2u9svnFi1WELcZr1n0R01l9?=
 =?iso-8859-2?Q?XnnD2imFQ9ZKk3NRZ7QfWKZKYFvSaY3kSTYYzA1hWUX8UIlxDjos+zkgXd?=
 =?iso-8859-2?Q?Z721P/FFL4iJeooBRjT9HtUIfIpi/w61N4W5e0IT+jxcmFR9qngdP2vG3N?=
 =?iso-8859-2?Q?yDxarCQayMQDH7FcttW7LnPNiszlNR72jUyLAL94FTnEv7T8009qnZPJyX?=
 =?iso-8859-2?Q?SU0FdWiZJ3sBv6u9NglxMcudswyLdufcX+a0tlHma2PxWJvNnMf0SvClXe?=
 =?iso-8859-2?Q?oLPfLaCtYfMPQdHbviakBEL65iMf3lbmRfLDC/MBLawgmYbDOD0oK51Cht?=
 =?iso-8859-2?Q?js+b1cG4f+9yWC28tIq3s/m6PeCO9CRY9WjaEbJUktLtwUhNZWUYgWkb2U?=
 =?iso-8859-2?Q?+vNbELTISQ/KeHKGITtUmsnGpUXStXWSvaFx/PEGqrhyBVXmP9hJE6IdJs?=
 =?iso-8859-2?Q?KWk7i+gfjPJh7oGin0qoJ5q63Di5I0x9zHNNPsbnTu8nHTZOw+WzfjR2Ig?=
 =?iso-8859-2?Q?IevCIZDu7N6V1fR6+pOn9bUD7grI8lKghyP/ziUA7dM5XzzXJXl8DtW3zc?=
 =?iso-8859-2?Q?qkJr7ItoFSSv2+kNOA+03nTw0GecoT/x4ETpC+1f8JXgaH5TDc6i+Ouh2O?=
 =?iso-8859-2?Q?kBCS9BWRtGq0kS3EJlqHYGFkTc/RDazOYHLReoXS0KW9NUw76g5IzbBu5M?=
 =?iso-8859-2?Q?JL87YPJ5Nn4py0aP4oqbPLjuTfUqatXTGdgy2FgDG+kyfGJZlrTZfKJuw5?=
 =?iso-8859-2?Q?GFm4WH+0OSWqq4qL8knsiKECPX4NWNXdQ1etGJGCHFqew9wb6pPckPMqV9?=
 =?iso-8859-2?Q?14QR8ZZS9fvH2tWGG/wOFfCeEu7jKHouX1heuvxBE0pnSzEBGxRrKL/+Ik?=
 =?iso-8859-2?Q?pq0s5ZoSz6537o1pgzuSprTrALvxluza4vmbWJg2D0vX2jMYP3D39/kesj?=
 =?iso-8859-2?Q?+LguNMz2DQ2xnIJaGDQufP1KUJSDuUcoqEDnXzZJuzkcfNspQ6PNZI24Rx?=
 =?iso-8859-2?Q?1C2BpsS4iEpMa7Ab5yKzLyWDDMtUqEqSnFNzFhbMLfzDSUhVU2gogmr8oz?=
 =?iso-8859-2?Q?A+1/S7/hrAujQl07+mHY4SZsGs4CQzDLN6sd5mU1H1R6kUIJKQ68YbM16N?=
 =?iso-8859-2?Q?DlCyqmqXDoEEqS6n04RPnZIKOJYWo3OfQWqTTxfCJ/4ywkBhfIdsI0yBK1?=
 =?iso-8859-2?Q?GE0em/cq9Hlrc=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b40aa3-753f-488e-1215-08de213192e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 14:49:53.4262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +UWf/dYI0w3WKb4fcGJtSH5FXiPAuJpcMfWbfhyLN3SsBFmhHj6n4u4N2adU0+K4dmMYqSb6UrCDOkmV4OPSLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9147
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

[Public]

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Tuesday, November 11, 2025 7:20 AM
> To: Corey Minyard <corey@minyard.net>; Koenig, Christian
> <Christian.Koenig@amd.com>; Dr. David Alan Gilbert <linux@treblig.org>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Thomas Zimmermann
> <tzimmermann@suse.de>; Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com>; Rob Clark
> <robin.clark@oss.qualcomm.com>; Matthew Brost
> <matthew.brost@intel.com>; Ulf Hansson <ulf.hansson@linaro.org>; Andy
> Shevchenko <andriy.shevchenko@linux.intel.com>; Vitaly Lifshits
> <vitaly.lifshits@intel.com>; Manivannan Sadhasivam <mani@kernel.org>;
> Niklas Cassel <cassel@kernel.org>; Calvin Owens <calvin@wbinvd.org>; Vadi=
m
> Fedorenko <vadim.fedorenko@linux.dev>; Sagi Maimon
> <maimon.sagi@gmail.com>; Martin K. Petersen
> <martin.petersen@oracle.com>; Karan Tilak Kumar <kartilak@cisco.com>;
> Hans Verkuil <hverkuil+cisco@kernel.org>; Casey Schaufler <casey@schaufle=
r-
> ca.com>; Steven Rostedt <rostedt@goodmis.org>; Petr Mladek
> <pmladek@suse.com>; Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>; Max
> Kellermann <max.kellermann@ionos.com>; linux-doc@vger.kernel.org; linux-
> kernel@vger.kernel.org; openipmi-developer@lists.sourceforge.net; linux-
> media@vger.kernel.org; dri-devel@lists.freedesktop.org; linaro-mm-
> sig@lists.linaro.org; amd-gfx@lists.freedesktop.org; linux-arm-
> msm@vger.kernel.org; freedreno@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; linux-mmc@vger.kernel.org;
> netdev@vger.kernel.org; intel-wired-lan@lists.osuosl.org; linux-
> pci@vger.kernel.org; linux-s390@vger.kernel.org; linux-scsi@vger.kernel.o=
rg;
> linux-staging@lists.linux.dev; ceph-devel@vger.kernel.org; linux-trace-
> kernel@vger.kernel.org
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>; Sergey Senozhatsky
> <senozhatsky@chromium.org>; Jonathan Corbet <corbet@lwn.net>; Sumit
> Semwal <sumit.semwal@linaro.org>; Gustavo Padovan
> <gustavo@padovan.org>; David Airlie <airlied@gmail.com>; Simona Vetter
> <simona@ffwll.ch>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> Dmitry Baryshkov <lumag@kernel.org>; Abhinav Kumar
> <abhinav.kumar@linux.dev>; Jessica Zhang <jesszhan0024@gmail.com>; Sean
> Paul <sean@poorly.run>; Marijn Suijten <marijn.suijten@somainline.org>;
> Konrad Dybcio <konradybcio@kernel.org>; Lucas De Marchi
> <lucas.demarchi@intel.com>; Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>; Rodrigo Vivi <rodrigo.vivi@intel.com>=
;
> Vladimir Oltean <olteanv@gmail.com>; Andrew Lunn <andrew@lunn.ch>;
> David S. Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> <pabeni@redhat.com>; Tony Nguyen <anthony.l.nguyen@intel.com>;
> Przemek Kitszel <przemyslaw.kitszel@intel.com>; Krzysztof Wilczy=F1ski
> <kwilczynski@kernel.org>; Kishon Vijay Abraham I <kishon@kernel.org>;
> Bjorn Helgaas <bhelgaas@google.com>; Rodolfo Giometti
> <giometti@enneenne.com>; Richard Cochran <richardcochran@gmail.com>;
> Jonathan Lemon <jonathan.lemon@gmail.com>; Stefan Haberland
> <sth@linux.ibm.com>; Jan Hoeppner <hoeppner@linux.ibm.com>; Heiko
> Carstens <hca@linux.ibm.com>; Vasily Gorbik <gor@linux.ibm.com>;
> Alexander Gordeev <agordeev@linux.ibm.com>; Christian Borntraeger
> <borntraeger@linux.ibm.com>; Sven Schnelle <svens@linux.ibm.com>; Satish
> Kharat <satishkh@cisco.com>; Sesidhar Baddela <sebaddel@cisco.com>;
> James E.J. Bottomley <James.Bottomley@HansenPartnership.com>; Mauro
> Carvalho Chehab <mchehab@kernel.org>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Xiubo Li <xiubli@redhat.com>; Ilya Dryomov
> <idryomov@gmail.com>; Masami Hiramatsu <mhiramat@kernel.org>;
> Mathieu Desnoyers <mathieu.desnoyers@efficios.com>; Andrew Morton
> <akpm@linux-foundation.org>
> Subject: [PATCH v2 05/21] drm/amdgpu: Switch to use %ptSp
>
> Use %ptSp instead of open coded variants to print content of struct
> timespec64 in human readable format.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 8a026bc9ea44..4e2fe6674db8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -217,8 +217,7 @@ amdgpu_devcoredump_read(char *buffer, loff_t
> offset, size_t count,
>       drm_printf(&p, "version: " AMDGPU_COREDUMP_VERSION "\n");
>       drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>       drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> -     drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec,
> -                coredump->reset_time.tv_nsec);
> +     drm_printf(&p, "time: %ptSp\n", &coredump->reset_time);
>
>       if (coredump->reset_task_info.task.pid)
>               drm_printf(&p, "process_name: %s PID: %d\n",
> --
> 2.50.1

