Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6691A69AA7B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A691C10EF83;
	Fri, 17 Feb 2023 11:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::708])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C0510EF83
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogLmBNccP5n3T10jMPg5jhWluUtvtL7Bd/L2wYZUQ9YN2UP5IBG/cLVE9/6dLWA0fTbQ6YcpS8INQFOy7ZRFfwIw2O8A7DzwPqIbmD512wmoxiiROXYVhuBcXf1Hu1Q4Qrhbpio1MBc71d1cYUvnRL9aL6C/7HSlkq/rBlR+F3Qy+HNXgBRJfBicd5QKvlqdmAP3owN7HqWd5iKLk8NfHXwSY73F4PReCXop67fXnRTUipr6bOwcnbmi2p3QEn7J3ZoWkSoJXc7rH4eB7f1sa0MYtARK9ULIa3X6uJGgwHO9oFnCFJGYbqw53bbNs9MBNUymkMfrrPk/lud4yLtNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLfitW43UxuNHZmqdlK3kJDGm+MFX1SCGq2vSyHhfJI=;
 b=blNbdUurDQrcTMtqciYWAhlYRDvbzetLkN1vihn09a3OQTvMe9AykIgSUb7Z3wb1K5+hdZtXccZROznwbVEyxSi4jlzsniqQtbjigLVQ5km3rY0nVKWYK92K/xc54y3A4x1sdB6X3ZdOPkgoVmpbyTO8D6eJzkZqCvg5Zyw6PUs9TtA7GFOZbrzX6KnLseZVXRYomRgHTxKELw3/39r6uIrHe8M/Y3WOeomzAgxFbeP2Aiq3cYghikF/YRkFfAiel+BMVVUlvAH/8Wkt3hQ11KkfAm5T8yJrLt3J410Tnfnre/dsqiteazBamPByqsA21yiIKRZTLddb7PwxDCw70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLfitW43UxuNHZmqdlK3kJDGm+MFX1SCGq2vSyHhfJI=;
 b=etljcd56cxfs/55IOo/Utn1HCISeY/Pf9saz/uF1l0t8VdvQNUWCCqgOjzfjCjV7/j+5f+fCkvjZof4A5G2r9dGmasVfhZ5kOJXIJ49dUcSGT2VE9WDRugq1WBgkliw30ZX56+rS5RM+xzENHNksd2HEliepMlxk+z8P3qGPOIJ11Nk1kz++Kin+Wfjt33Oj/HLdwe3FDKqRmWKDZtktp3xoQsoOq9iYx4IZrtv0p/Dgbnw4+PRA3n77wxKz330Jm8mklBnht4wbvGJ9rTjl1keufq6wwoQgMWumDTfNl5vVAUbGsSodMGdYrYluyvih0I5/+mWwXYX+im0f+DKPcg==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by PR3PR02MB6281.eurprd02.prod.outlook.com (2603:10a6:102:7a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 11:34:39 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca%9]) with mapi id 15.20.6111.015; Fri, 17 Feb 2023
 11:34:39 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Oded Gabbay
 <ogabbay@kernel.org>
Subject: RE: [PATCH 08/27] habanalabs: add info when FD released while device
 still in use
Thread-Topic: [PATCH 08/27] habanalabs: add info when FD released while device
 still in use
Thread-Index: AQHZPyLsTfgvgpc53EmXP2FILg7rhK7RhU+AgAAgbQCAAAwCgIABTzNg
Date: Fri, 17 Feb 2023 11:34:39 +0000
Message-ID: <DU2PR02MB75734395957E6DC59D387B28D2A19@DU2PR02MB7573.eurprd02.prod.outlook.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-8-ogabbay@kernel.org>
 <20230216122545.GE2849548@linux.intel.com>
 <CAFCwf13c6T-S2MgwmWJkrQTwdXYDGMK+GG8ZVUjPipsXNrW_ZQ@mail.gmail.com>
 <20230216150447.GJ2849548@linux.intel.com>
In-Reply-To: <20230216150447.GJ2849548@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|PR3PR02MB6281:EE_
x-ms-office365-filtering-correlation-id: bf18066d-7538-49ed-bef6-08db10daf479
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 03HWqWoDGHoPmE/8zfRqw5lB7fHe1zk9PsFMXE5sGNauf2HqWZZR6rsedKaYhHbKtUrK1X2Tq6ZtsztTpq8+GKYoGesoZlZgm4HHcsrZlUDd3X9hIPwLITAtbJK7K6vHiajslKi7H3vEafReMhIHoLDjJAriOQDO2lQw4q4Bvl4NcuIIRF9o7q4ZTapfibSK+T6/OkPyb+OiO13jn8AGoe4TMCjxPRBtdsy+Ye2bsJTSxbRFXEV8MczIsseqI5K9RGsA/WNSS70skaT8cIi/lJ6ZUKQlZawWVReFOVK/iqkGwxASS465mNUj0grBJZ048Bc5+7YfF9mLQexcEMTFS6hx37Q4UrdkrMKiPdwYDJGsxVQ+/zUmBtW2GXi8L2+AoMfXxw6Kf5yeYo6scuU6N86y6mGaoNjOCqhaMpQPfVc9TbKouaIej495ofTjJD4N8y3ysceHZvbfi4pzmuXxXFG9RLbIDfNo5OenH1Uzrpc+qumBC+DmRRuM5znWnSKgEWmd0GZDfhwKL4qVy++Vg+G1T4K19k+gYBGFoQQ/BxqWvwF0oUIYfUa9Yl0yJ+hFq+5L623XFB6px8mOlSBTpQoDbbg54+zUWwIvsaZkQ+ZsEtY/KU5PNjgjwUmO0oQYbSO3cOdQN6TaaphtcjM5JzYII5QQApr1tJnDuBGCW/WNzHkOY8DDZJOGSN6uP4gk3/u0IJnPQ+rqxf1RLrdIiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39850400004)(376002)(136003)(396003)(346002)(451199018)(86362001)(83380400001)(55016003)(2906002)(7696005)(33656002)(71200400001)(186003)(6506007)(53546011)(26005)(9686003)(478600001)(122000001)(38070700005)(38100700002)(41300700001)(52536014)(5660300002)(82960400001)(8936002)(4326008)(66446008)(8676002)(66476007)(64756008)(66946007)(76116006)(66556008)(316002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MU480RcR/LMvN5sq1knKlw49SRwLO3XsElWy+ndm9HDIzM2o2uxSx+tB9ve1?=
 =?us-ascii?Q?3DRs9q4eueYKVrpTbxYWYRn3s0eFlDgAaiTPRbneMd8doz4ryN9RQu4Flxh8?=
 =?us-ascii?Q?QMxQigfcYFhk+povhEI2s1zCHJ3mOWvoF/X8IlA7occ9MOsH11R6Gdqovapk?=
 =?us-ascii?Q?Z6G3QSKYQSfXWO1LAP+T29uteNrDtVD794WilGr1d+4/224BmLIB8xTDHDGo?=
 =?us-ascii?Q?qPIE99EmurroXJVLcwjAOvf3npuG4xV+l1GNng08GUjVYduvoZpAMaodKWRY?=
 =?us-ascii?Q?QTmamUXNk+ALNG7v2emhB69e4boURXKiFwCQCP1e2gro11NKxMbMJbHsyPdU?=
 =?us-ascii?Q?tBLkLFcgM1yreKkt3zSYX9y4LsHI9NOZhOI7w2SHoXBBV5fbpiYt/K0mXppi?=
 =?us-ascii?Q?uWhDnyXcYfavooTPPWo95IcMNC6ngzPIJoQGUzYoD5xhaL3Qxh2JWmtcquG7?=
 =?us-ascii?Q?bvvk4P1mukanUWN02tzZRapSqzFIEaOSpNEbuGuw+3fzAeR8XP+ubcsJUmrv?=
 =?us-ascii?Q?p8nc0ysDUjC9iPENoZKNJnIFXX/FpXt00dwnYvjTRSkLy9sJ077ooHLQTauu?=
 =?us-ascii?Q?1VUmAfrCtCB5chwttK0Vd/fWjCe5ObIT5CblNt3rP/IKsa3CBq05B602IUTT?=
 =?us-ascii?Q?5gW9eiILOzz2dQUPR5KAqYPcreqftNO6Uzhx6FMrkEziKDBvci9NoLt4JcOo?=
 =?us-ascii?Q?PCoq+O2ZYafi3tOLt/E+cBch8EH1eKUzbVsL3xZBOksjp2KS8TbZkUPFwJ1F?=
 =?us-ascii?Q?x+092pcjgYP1ofpgfsPrvlGr3PXR7mQ12OUw+vxqqWVTlkrr9d+GOmi3tTKD?=
 =?us-ascii?Q?GiWw1nUYyzVatSaA+2toNgPeVgf8OT/G1wpzUXhx6DzYq7JCEVATlbaRttyW?=
 =?us-ascii?Q?1KzOpDiq3DAt4t4k8T0kE9XimqTCgnDFHhNcbIhxsr+4OU0l7yTah2krBn6C?=
 =?us-ascii?Q?LCkqGmTQKqKuY3eCYSSuu+8OeLOf1EjobrEOh3VwqlEcEhP4qT6HSJ9shRGU?=
 =?us-ascii?Q?I/XXhZwhBowvp4B788EoNnD84lHRakzsmQW2LomWu0BWY5Yz0p7qQfAbXBDI?=
 =?us-ascii?Q?rCio0j5XT1jLXbjq2zg6WcfKj2i1sr3q0cw5agUoKWgg3EJKciZHoltcQ4B9?=
 =?us-ascii?Q?YQ1Gs55G6Zy9l8QqIRY6R9v1wBxWTxIOUhdpIJUBat3gF9Iigx61Ka/3P7Mn?=
 =?us-ascii?Q?8beoms0PEXLcuq1iY8pVFslnakvTSX7Gdu3A7t0zQWqJanI8yHCmW28UIK7L?=
 =?us-ascii?Q?aVgSljDAkLbK0W7OErzDL+dNMF71sCN+hjBZg6txphi/fkK3NALDZ5/hsWiy?=
 =?us-ascii?Q?x3vwifk8wKxnRxYa8+o9JFAEyagBrv4Ih2KHnGLA2pn2JlsAWIvhmeBCl8IZ?=
 =?us-ascii?Q?G47TiejBcDuvsaRTftXDy0W5+F8ZOs5MrqUdt3l0qbXM20sehsLzcc3Gxp4v?=
 =?us-ascii?Q?6hAVFojh3r4en43KyeGkd1zjB5SZUM+mqzJto6LC1SsZ+SyGEadXp7ZHu0ah?=
 =?us-ascii?Q?Uqx1IOGnHaVjKFre2xph9qhXbsMiac0/GxirDOFu+xxvPVe2SrzK4jTYLOPA?=
 =?us-ascii?Q?g5J/Ns4JZ0BwaA0kfdp6uLaI/dDVSjMSyfNVmODY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf18066d-7538-49ed-bef6-08db10daf479
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 11:34:39.3279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jIJsaiVUXqgsH8/dQ7qP19dv/8+TOiHpbW8qEZp/APLuxJh9NshiXkCXqYLMEiCcKMNNICeks2V+P5dpxhtIbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6281
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 17:05 Stanislaw Gruszka <stanislaw.gruszka@linux.in=
tel.com> wrote:
> On Thu, Feb 16, 2023 at 04:21:48PM +0200, Oded Gabbay wrote:
> > On Thu, Feb 16, 2023 at 2:25 PM Stanislaw Gruszka
> > <stanislaw.gruszka@linux.intel.com> wrote:
> > >
> > > On Sun, Feb 12, 2023 at 10:44:35PM +0200, Oded Gabbay wrote:
> > > > From: Tomer Tayar <ttayar@habana.ai>
> > > >
> > > > When user closes the device file descriptor, it is checked whether =
the
> > > > device is still in use, and a message is printed if it is.
> > >
> > > I guess this is only for debugging your user-space component?
> > > Because kernel driver should not make any assumption about
> > > user-space behavior. Closing whenever user wants should be
> > > no problem.
> > First of all, indeed the user can close the device whatever it wants.
> > We don't limit him, but we do need to track the device state, because
> > we can't allow a new user to acquire the device until it is idle (due
> > to h/w limitations).
> > Therefore, this print is not so much for debug, as it is for letting
> > the user know the device wasn't idle after he closed it, and
> > therefore, we are going to reset it to make it idle.
> > So, it is a notification that is important imo.
>=20
> This sounds like something that should be handed in open() with -EAGAIN
> error with eventual message in dmesg. But you know best what info
> is needed by user-space :-)

Because of the reset in this case and the involved cleanup, this info won't=
 be available in next open().

> > > > +static void print_device_in_use_info(struct hl_device *hdev, const=
 char
> *message)
> > > > +{
> > > > +     u32 active_cs_num, dmabuf_export_cnt;
> > > > +     char buf[64], *buf_ptr =3D buf;
> > > > +     size_t buf_size =3D sizeof(buf);
> > > > +     bool unknown_reason =3D true;
> > > > +
> > > > +     active_cs_num =3D hl_get_active_cs_num(hdev);
> > > > +     if (active_cs_num) {
> > > > +             unknown_reason =3D false;
> > > > +             compose_device_in_use_info(&buf_ptr, &buf_size, " [%u=
 active
> CS]", active_cs_num);
> > > > +     }
> > > > +
> > > > +     dmabuf_export_cnt =3D atomic_read(&hdev->dmabuf_export_cnt);
> > > > +     if (dmabuf_export_cnt) {
> > > > +             unknown_reason =3D false;
> > > > +             compose_device_in_use_info(&buf_ptr, &buf_size, " [%u
> exported dma-buf]",
> > > > +                                             dmabuf_export_cnt);
> > > > +     }
> > > > +
> > > > +     if (unknown_reason)
> > > > +             compose_device_in_use_info(&buf_ptr, &buf_size, " [un=
known
> reason]");
> > > > +
> > > > +     dev_notice(hdev->dev, "%s%s\n", message, buf);
> > >
> > > why not print counters directly, i.e. "active cs count %u, dmabuf exp=
ort
> count %u" ?
> > Because we wanted to print the specific reason, or unknown reason, and
> > not print all the possible counters in one line, because most of the
> > time most of the counters will be 0.
> > We plan to add more reasons so this helper simplifies the code.
>=20
> Ok, just place replace compose_device_in_use_info() with snprintf().
> I don't think you need custom implementation of snprintf().

compose_device_in_use_info() was added to handle in a single place the snpr=
intf() return value and the buffer pointer moving.
However, you are correct and it is too much here, as the local buffer size =
is set with a value that should be enough for max possible print.
We will remove compose_device_in_use_info() and use snprintf() directly.
Thanks!

> > > > +             print_device_in_use_info(hdev, "User process closed F=
D but
> device still in use");
> > > >               hl_device_reset(hdev, HL_DRV_RESET_HARD);
> > >
> > > You really need reset here ?
> > Yes, our h/w requires that we reset the device after the user closed
> > it. If the device is not idle after the user closed it, we hard reset
> > it.
> > If it is idle, we do a more graceful reset.
>=20
> Hmm, ok.
>=20
> Regards
> Stanislaw

