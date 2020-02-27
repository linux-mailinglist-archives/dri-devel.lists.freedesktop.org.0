Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F617324C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 08:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360156EE1F;
	Fri, 28 Feb 2020 07:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 521 seconds by postgrey-1.36 at gabe;
 Thu, 27 Feb 2020 14:51:56 UTC
Received: from smtprelay-out1.synopsys.com (sv2-smtprelay2.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4946E44F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 14:51:56 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CACDB43B5B;
 Thu, 27 Feb 2020 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582814594; bh=S182m+RzcDCDcgk2+YGfnIhIwx/OEhwIxVHG+5s3j1g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=gOxMIW+b2n0TnTlepSVN/25Q4j2N3owzGR495hjmpM4TfhdCO3NFtG1Vr31uVzjdM
 HG/946d6vdOnRFyZJfeqLNSNJu7yh1cSjVd4Ymdfimuzcary/ONVrUa6dWqjtodM+R
 8Tm7KkY2bg+YB8kp+MHpmNGEYTP3Gj6SMqpksVHPxBUlJKUHaBDLpEn73i8oGslzvl
 Bj8uNkvBw1urLO+HYBRFVG/KJS+PuY01XU8TtgaXrmXnPisYtzAXDd6v80m67utcl8
 F2i/wBAAiY0rE0W8c1QGMaPr3kteLgx/2nMNXL+TwXTw8PPcbBbZBrM3fsnhsts+1z
 jguLNFD+ea/tg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3875DA0086;
 Thu, 27 Feb 2020 14:43:12 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 27 Feb 2020 06:43:12 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 27 Feb 2020 06:43:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THHxej8/RSVv1HzR7aBBptZ4k9QiTGbpbbWooifN6eLC6dFpVG726fhHsVov29QFybf/CLaSxJsRlabLrQOOWW7OTfxeh0ymCQnL0WOp5GOM0Ss7WCnmM/tVIE8VHnQoGFrCKWDgkvOdmtN3/lhKOwhlcf61sSqFIgqME1O60fF3sUa/5RDIUplKwNw3odkwXRexBLXPonwwjnuHeFFZ9OIqYSOAvzv7QkpdayzybtdZnXexHJbuSGsBgUogxOSTJUo4VLTQC5xbc0JY1Jkc1XFpGpLWJwOM7KghLm7W6AD38ogsBR5NS9Y068qYbu62OcevYgAJ/G144SHfJbbteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S182m+RzcDCDcgk2+YGfnIhIwx/OEhwIxVHG+5s3j1g=;
 b=c+3auN/r8EfJGWuOeUhZbQjGzoi7S2yi5R7ydIDhMcFn/ufWUC1koTjDSMeYFuHeJ2D3Ok/8dDcyfTUaSqAKG1zN6kH19lJ+MRJqjuhshxBXlnjIXW9nhFaRhB7V8xrT1foepyUD+U8zMqqLU2iQNOd4GUkBGzz+xfHPv16HpsaqiV723WM1VBLUs8gEC+9cWMHxp9z86ApRYuAGSlRunG6XO77TeDivc8+3BupjdU+Q5n8fVUNzvr6qcW9cC1CkhBl3XJSAvtYRGIRJ/DBQS0JMN+mgX2dChNKSyD4npujfsaVBhTcePyK0FggUbFjLgeorLGsmkE8MqrlgvVLpsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S182m+RzcDCDcgk2+YGfnIhIwx/OEhwIxVHG+5s3j1g=;
 b=YxEZxUR6l4xZORQ5/7Pd3Dto7TIyq8hUeYMWEHuwutjqZBPtc+mDxArDXI3BFJq5T9SrybrahwJGRz6pKm78B54kQkhOIYvr7HG9DhnQjFWjfqaDQ644sJ5sH9+TeONnbxyTeFOOPYoaad1RGpgHGZWb5nqZZJxnsortSy3LnO0=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 (2603:10b6:910:1c::14) by CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Thu, 27 Feb
 2020 14:43:10 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44%12]) with mapi id 15.20.2772.012; Thu, 27 Feb
 2020 14:43:10 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: RE: [PATCH 06/21] drm/arc: make arcpgu_debugfs_init return void
Thread-Topic: [PATCH 06/21] drm/arc: make arcpgu_debugfs_init return void
Thread-Index: AQHV7WX1ZSK90WVHUU6ShqjnhWICZ6gvHVrA
Date: Thu, 27 Feb 2020 14:43:10 +0000
Message-ID: <CY4PR1201MB01205BF1508E321260A5B77FA1EB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-7-wambui.karugax@gmail.com>
In-Reply-To: <20200227120232.19413-7-wambui.karugax@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy03NzA1NjMwNC01OTZmLTExZWEtODAyZi04OGIx?=
 =?us-ascii?Q?MTFjZGUyMTdcYW1lLXRlc3RcNzcwNTYzMDYtNTk2Zi0xMWVhLTgwMmYtODhi?=
 =?us-ascii?Q?MTExY2RlMjE3Ym9keS50eHQiIHN6PSI5MTEiIHQ9IjEzMjI3Mjg4MTg3MTQ3?=
 =?us-ascii?Q?Mzc1NSIgaD0iWUladFh2elFvVHJ4Y3VxVk1oYXRMUlNjOVdJPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBQlFKQUFC?=
 =?us-ascii?Q?YnpGMDVmTzNWQVhJUlNZcjUxTW1nY2hGSml2blV5YUFPQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQ2tDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFNb04veHdBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
 =?us-ascii?Q?QmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhR?=
 =?us-ascii?Q?QVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QmhB?=
 =?us-ascii?Q?RzBBY3dCMUFHNEFad0JmQUhJQVpRQnpBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUcwQWFRQmpBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFITUFkQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZEFC?=
 =?us-ascii?Q?ekFHMEFZd0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhr?=
 =?us-ascii?Q?QVh3QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QjFBRzBBWXdBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQVp3QjBBSE1BWHdCd0FISUFid0JrQUhVQVl3QjBBRjhB?=
 =?us-ascii?Q?ZEFCeUFHRUFhUUJ1QUdrQWJnQm5BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCaEFHTUFZd0J2QUhVQWJnQjBBRjhBY0FCc0FHRUFi?=
 =?us-ascii?Q?Z0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFZUUJzQUdVQWN3QmZB?=
 =?us-ascii?Q?SEVBZFFCdkFIUUFaUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBTVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QnpBRzRBY0FCekFGOEFiQUJwQUdNQVpRQnVBSE1BWlFCZkFIUUFaUUJ5QUcw?=
 =?us-ascii?Q?QVh3QnpBSFFBZFFCa0FHVUFiZ0IwQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhZQVp3QmZBR3NBWlFC?=
 =?us-ascii?Q?NUFIY0Fid0J5QUdRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFB?=
 =?us-ascii?Q?QUFBQUNBQUFBQUFBPSIvPjwvbWV0YT4=3D?=
x-dg-rorf: true
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [183.89.35.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1a3bb74-35cb-4e58-2281-08d7bb935de3
x-ms-traffictypediagnostic: CY4PR1201MB0230:
x-microsoft-antispam-prvs: <CY4PR1201MB0230703294CCDBAC5FEAB6F1A1EB0@CY4PR1201MB0230.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(376002)(346002)(396003)(366004)(136003)(189003)(199004)(26005)(316002)(54906003)(4326008)(2906002)(53546011)(478600001)(186003)(81166006)(8676002)(81156014)(71200400001)(9686003)(55016002)(33656002)(6916009)(8936002)(5660300002)(4744005)(86362001)(52536014)(7696005)(66946007)(6506007)(66476007)(66556008)(64756008)(66446008)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0230;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a8EgK/xPuX2N8UL8+sDAR9Qvh/BgXnO4+xKjj8PrS0NghoFaJcPApFd1oNfqZwZwUqXCiDjgmCEpCW5IyrwbCvlyAOQ2DgGaYcJN6nbkhtbbrAjat6fSE0E1WIFD8WMdIQmeaZRNwxUG29ib8svaauJL3eEqrgmDnlMQ5o7kG91bcqEe+v3YbAvARlItC7EnD09OrXYNeMNNwFg5rIi7hhz27pEAv9KW0b7TWyiuGqspdL8YfzoJ6bgiOOEtpnpKQu5CIdi/vNVB4TiYfwHwOLAWijc+6s5Cl6SWdfsj9PEhgqnuzLQFwVkuLrRs/whOGWTumMSVfRTEr+rY6Z/c7UovJBkebZMbX0rZaHRkG4xLB9zpxE8NWnuLrz/lQTdWgEX35uZQNy8y7b0+tiqQKofncizxb2g8tsrHYet1gfQx8hEfEa1dhsAW1Tyery52
x-ms-exchange-antispam-messagedata: f/I1I9kzgHujFH7Oh2WGkBBzXmsnlvJvGYBv+0mVwfGoslQbskIq5ZKSjvWOinmYkFoDwBd6JYVzK7qOI5lFYoR9J/SGLTTrNZDQPezDys6lqwkl3VHojWihY0x9pq7nSLkUBnZ6wc0hXkOveU9BKw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a3bb74-35cb-4e58-2281-08d7bb935de3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 14:43:10.5388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bUvvKbZiTsGI9IfraSoF9wxBLD+ldGupmoJ9J2PSPGM3z8UILJQCxxLU7rEBUuvoveb3Jof3+2GxA4+aDeDIYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0230
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Fri, 28 Feb 2020 07:59:27 +0000
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wambui,

> -----Original Message-----
> From: Wambui Karuga <wambui.karugax@gmail.com>
> Sent: Thursday, February 27, 2020 7:02 PM
> To: daniel@ffwll.ch; airlied@linux.ie; Alexey Brodkin <abrodkin@synopsys.com>
> Cc: linux-kernel@vger.kernel.org; gregkh@linuxfoundation.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH 06/21] drm/arc: make arcpgu_debugfs_init return void
> 
> Since commit 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail), drm_debugfs_create_files never
> fails and should return void. Therefore, remove its use as the
> return value of arcpgu_debugfs_init and have the latter function also
> return void.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Thanks for this clean-up and

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
