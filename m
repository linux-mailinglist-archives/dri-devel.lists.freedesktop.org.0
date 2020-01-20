Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6576C143840
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 09:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B755B6EBD7;
	Tue, 21 Jan 2020 08:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50123.outbound.protection.outlook.com [40.107.5.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8136EB26
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 20:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmNyaSmdOWoBaa9L5z6OJJTTnCMPIu1k9va66fWvEp1qumrNymcgbASwURBsFw1FOtEmvF/wQepkKZ/Za/Qje2PiOX52mx9qFxSgF5+lRJ0l4lpHJJEs3Q7eAYgcdRe7Nb8fQWVY8n/AyfNC6Ufkph6HHsUMiSgA2kEvyXmSp+M+XWYxa5OzgzoM+/n8HuJHk9Zm+QTGm0h4yBlpWLQOj6YS+0GuVP/3e5OPyPdeQqreAW/SyMGVs2Uxy1oPxRRd3aBlwAJXNLatDYDckmOQdHPGLxzeIi/bKKnbNjQk7mo8FB1sclnkyJoSoQvFftnqzx/CKBjtYxx/f5qqHSGVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10kvrjA6WNGE5CxJ20pHpOyXgNuB4nv+Iy55f98qdSc=;
 b=R+MSTVPKAYlH8w4388sdyEmpH84Z65hkCfHfebyGQaVo6wgz6mD+BIE0/JgFQIL1VVJeiDbph2j/+0dtAl1MmdoCtETuXjZwzdr4/EmYQhh7XKUek0ZSoqEDOR403gWX8ml1yPPC8dyAx8VIqTsjGruRaqRISWbr1EsqV7jW7XTlL338SDNlHq2Ij35X2/utpyJFuPs6vtk1aW3G5Vj6fUuOURU9xewJk5Z6yimPEM3HzXA+mLhCJGolGIWl4vDjgTP/XQo+JRF1OLiDcO76BUAS7Me1U0h2RDO314iZ1k+MFbXG+/akBttrQNaKOphIMfELrkfSbsq57NiBtZaZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10kvrjA6WNGE5CxJ20pHpOyXgNuB4nv+Iy55f98qdSc=;
 b=bvueePmKvsM3x1e25RuEAXyoKbY4R+zE+9p7aa31vpCaQyzIrGoJ4Bi3O6QdgcaC/ybO5L1cf0ZXv19asnZji3FDsdMeC0NUCk85vvKO0Y6FSIddhGsVFrUzvvaz/G0LA+G+lCM3mchpjJROcvTR3XWIog1lFbIyq8xIfl/4lnk=
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB4447.eurprd05.prod.outlook.com (10.171.182.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Mon, 20 Jan 2020 20:54:59 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 20:54:59 +0000
Received: from mail-qt1-f170.google.com (209.85.160.170) by
 BL0PR01CA0010.prod.exchangelabs.com (2603:10b6:208:71::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19 via Frontend Transport; Mon, 20 Jan 2020 20:54:59 +0000
Received: by mail-qt1-f170.google.com with SMTP id j5so868858qtq.9 for
 <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 12:54:59 -0800 (PST)
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Thread-Topic: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Thread-Index: AQHVz80w4HhwlRHTykqlZw21DVxxdqf0BjKA
Date: Mon, 20 Jan 2020 20:54:59 +0000
Message-ID: <CAGgjyvGh8idpvijVcV0vA8R_iaB0mQMTk_=wWDSSKWX7hwdYPw@mail.gmail.com>
References: <20200120200641.15047-1-sam@ravnborg.org>
 <20200120200641.15047-2-sam@ravnborg.org>
In-Reply-To: <20200120200641.15047-2-sam@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR01CA0010.prod.exchangelabs.com (2603:10b6:208:71::23)
 To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAU5ktfJKYQk+mXsUDE/QuAI+rHK9BSXP9Ae+Bh9UzBWw71EU/UI
 TyfMCw+BSbDRyr6BVNLpxK3nJul8yFfw3mJcdfI=
x-google-smtp-source: APXvYqxRsY6PBm7SFmk9FKkztBRkbGWlFRVKW63cegNsfwHASEVVYLUzYdjZFtlKXLvkvibN89sFGw+hG+ooIUd7q00=
x-received: by 2002:a05:620a:21d4:: with SMTP id
 h20mr1361174qka.468.1579553289927; Mon, 20 Jan 2020 12:48:09 -0800 (PST)
x-gmail-original-message-id: <CAGgjyvGh8idpvijVcV0vA8R_iaB0mQMTk_=wWDSSKWX7hwdYPw@mail.gmail.com>
x-originating-ip: [209.85.160.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2368ec95-3a83-4918-837a-08d79deb0364
x-ms-traffictypediagnostic: VI1PR05MB4447:
x-microsoft-antispam-prvs: <VI1PR05MB4447342871DE1BEB0FAF8366F9320@VI1PR05MB4447.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(189003)(199004)(81166006)(8936002)(26005)(186003)(8676002)(107886003)(966005)(53546011)(478600001)(2906002)(81156014)(55446002)(9686003)(6862004)(55236004)(42186006)(86362001)(54906003)(44832011)(4326008)(71200400001)(52116002)(316002)(5660300002)(66556008)(66946007)(66476007)(64756008)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB4447;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pvOlnIHFYt1+aBtCGO9icB4/9CRuI8xwpwuCRAdKLBVaf4VBW8WHBwioJ17vYhepyAFM7L+4jxryA79+UBDyuPpvQOpur8sVuRDjLFBBKn3prYJdkUrdTBAspA9WJ+AuZso/yIq7n+SgMATJvCTzUeQqHdgHdFlzM8V21Q9wxjSpNp8BJx2pICaxH7h0NOYbhXRBFBEASMX//xY0j6mEigvpxAB5m+Pu+g689purwiwSL33To6X5CqlZS4stwRfr9qz8M92qShJdkCruinLbtdeOGLY1wcwa+BCLJaiEA/sQ9m6oJVwX4h7eAbz4Gg50YNSEYKiFg5LU5oRgHzpgD49dBbnKK6+QIvq+XKidYw2ZC3HWww84ptJ9O/YgLHfcT1HQPHNSbibVfKiI6lvIeFrOvUqaA6LucLu1y6//uupN6TQAtm58n7u6LUi/uApRVoMvD3uqP0I2BsB0YmPCehPqqsUzk7K3/aBI5XFFZ2A=
x-ms-exchange-transport-forked: True
Content-ID: <06CEC4EEAD20C54FB035C9507BCB1AD9@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2368ec95-3a83-4918-837a-08d79deb0364
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 20:54:59.8457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5oW79HS3Wkx6K6ew7WxRWiWeYaE/aFZ3+ZrQA4NGu8nDiYPWROXinpIqthTAdqcieMt45PgvAddBz/kda/dVvVrbs8WifPsDI5SCAERTNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4447
X-Mailman-Approved-At: Tue, 21 Jan 2020 08:32:00 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 10:07 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Add meta-schema variant of panel-timing and
> reference it from panel-common.yaml.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>

There some typos:

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> new file mode 100644
> index 000000000000..59891c7a58ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> @@ -0,0 +1,253 @@
...
> +description: |
> +  There are different ways of describing the timing data data of a panel. The
-----------------------------------------------------------------------^^^^^^^^^
s/data data/data/

...
> +  vactive:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Verical panel resolution in pixels
---------^^^^^^
Vertical

Anyway, those are minor issues, so

Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
