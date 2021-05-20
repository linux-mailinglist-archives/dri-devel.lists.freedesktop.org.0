Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192F38B433
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 18:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056B26F4AD;
	Thu, 20 May 2021 16:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1536F4D5;
 Thu, 20 May 2021 16:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbG8knMlEArQXfBrkhzttfTUSCLi96V6mNKpgRjMlPm5jYHQwQyi4zYqtGdiNpPvwdoPuMLv1FMj10b32j/+xE4EEheVKQoZeN1N5pZ9kUnCLRSZyjIRmSYYyJl8/uYJ/9zdVlabeL07Bsoy1mvWiU1oh1QcJNhEqwkCGUehUdMKod1TRNZDv0slZKKneKH6/s0iHjKX3Nh/Va37eZqrToFFyTrVzPj686AWMi3wHiuaOruDSpLHKnz0Ct8dsVMMnrysW2hTuWMvylhLxzRLH6SBk9yU4TdRzUhcgDo58Nb8kAEJZ+gSaGGbHCTCwwQVXA0lsHnr2qWOU00RRYyIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usUZ6ajGb4EYJ2FJB6X6ZyX67bN6NYsl1ZOMX1EOCiw=;
 b=IWUQ0mMOduIL5Vg04y/nI2qGJhLk3iped51DScsTieEwI7VVxUGrewb2jPYxRNl62uNUbN18kYmkTOjGK0NgJnpgKjZnVFr9C/Azp55cqAAHdt/o4ZrgXVmgs274yrG+MJ+X7WlgHGlgTQbaFL6VlZYJfcPAVPJ956XorxQZDFuqZk3nz5cd/wnWkkEjYJxkUv3C+3QRMUg90tmEOdmeLMfmG8FHNB13bQ+x+X8Mo9lswdJxV41Rdjnb02KTc4W90UnvFnl8G247NRvg+CUeo99BWUURlMnHxz81lCCXUKZ3VY3A5ieFP6m1ISG8AUFEmy7FwUsOuEwvM/qjnIQxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usUZ6ajGb4EYJ2FJB6X6ZyX67bN6NYsl1ZOMX1EOCiw=;
 b=rfpjWGDS4cftNv5ZE+kPyWJoFQouTDa4IUCcfj7Xwc6FDjjB0m/2oxme9hiG8vhCLvg5+KOgd7CypQQ8qFj8hwvcVDREM0m28RSQRjgbQaxxPT7ETCGHELQ7uFE/dWVl8bbyb40HQOHR3OlDXNY9KHXT+qVMcBkZertZxcltYrI=
Received: from BYAPR12MB2840.namprd12.prod.outlook.com (2603:10b6:a03:62::32)
 by BYAPR12MB3062.namprd12.prod.outlook.com (2603:10b6:a03:aa::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 16:26:34 +0000
Received: from BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616]) by BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616%7]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 16:26:33 +0000
From: "Nieto, David M" <David.Nieto@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
Subject: Re: [RFC 7/7] drm/i915: Expose client engine utilisation via fdinfo
Thread-Topic: [RFC 7/7] drm/i915: Expose client engine utilisation via fdinfo
Thread-Index: AQHXTYq24cZbvGtlAk2r4smwWWBDBarsi5Al
Date: Thu, 20 May 2021 16:26:33 +0000
Message-ID: <BYAPR12MB28401B22CACDC249926C0A19F42A9@BYAPR12MB2840.namprd12.prod.outlook.com>
References: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>,
 <20210520151254.959958-8-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210520151254.959958-8-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-05-20T16:26:33.130Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD-Official
 Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.53.104]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7984c1a4-6b93-4b97-f56d-08d91bac0866
x-ms-traffictypediagnostic: BYAPR12MB3062:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB30626EB01C7F2B3A9E0791AEF42A9@BYAPR12MB3062.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E58VmZj20wi5Hq33JJNnG33vj6oUuONqNOtCDHQOE57OK+498aVscgXjgPuT3xoWtzbuWM2mwYUstPqP92nHQOWQkehvUiXNPEjh86XKvuXyGI0Q72RuQlSoLFiOxOmDJ9eFPDLt817Xygk7uXbYTKYXsVY7P+uOUjXo3/2BNpnC9g+kv+FGGoSEtrciLGqTxbiDPTDiPH7qRJb2dZyMtOGdFwDREAUd64bqiRXo8F3YSsOJkXJPuyOkIC4BL2ZnwGtGoqQHrD0B+4PBmgIJyRWB0AWLiW+pt5EEsKI3a0R9f3hNDyBmx0mxq1BpRyrSW40LAoEO0kgq4GeFCYXz8GJaVYg3fyuWLlrHf++22CyZ9E0jxyJcxQZjmjZRmdT0sZFt2z8PXG/SbbUS8kiIJAj1LXqvbx4HTvE1k84vxSeCOtn4R0Hr0u1r4S4fsXfHd8Mv1C84G5c1syVr2R69gYD0Zo1FybtKedpNxgZ4lnXvyEp0NJJ0FkqtPyqeBP2OhS1c8Jk+bPq1RKtTDuCqRSjUmJGMmE9wCVNOBM8XMNF4cleEulVRyK8zq3yl1iuzuUUizkbESlLXrDoMm7cO3k+fjYQW6X5uJc9vfZ2/BNI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2840.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(38100700002)(19627405001)(66574015)(5660300002)(66476007)(66946007)(66446008)(52536014)(122000001)(64756008)(83380400001)(76116006)(66556008)(110136005)(316002)(478600001)(2906002)(86362001)(8936002)(8676002)(4326008)(6506007)(33656002)(26005)(71200400001)(54906003)(55016002)(53546011)(186003)(7696005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?dQO4PN+Ow/vwV1JTHHq9jbI+Y/fBLtx82RpkKYHeLTc1Ra92vBpEXgU0Sw?=
 =?iso-8859-1?Q?5sgjJLm0xfKQkAW44FtXNeIheQKlLXHkDFI3yDYDUM/58SxP2YdZ+iFdv3?=
 =?iso-8859-1?Q?74pa27qKZ40TgtGOEVQcbl09a/EnRZ7Ku8EZcAFDJBUlTpAZolIK2MSuQI?=
 =?iso-8859-1?Q?NF2Qd0REoXi4VB+C6DVwZUIxGkUCiWeWkDYDicSnZ4zMPrerSt2rlewyXB?=
 =?iso-8859-1?Q?ebZbHyKKh5SrtIjqjLHZCuhs5+wET3E+SV25vN3dV7IC/uKbeJho4Oo1Lv?=
 =?iso-8859-1?Q?1AXyU8cF45mXMTRDtslsdc9OJKYbi4cOYMKh44K+zmSvdI0CFjzS4w1xBu?=
 =?iso-8859-1?Q?Wo+u7rYI3FXmAd242gBC685WUO4mk7jTjxvuoguJvG94N7Plz3aRZOTsr8?=
 =?iso-8859-1?Q?AfXPyvL0BSRX1izzRMf2QKwMixudGQAHRqQI3udLCefajbw1wSDXHqLMoY?=
 =?iso-8859-1?Q?bGpoBGv9jO/lwTmV2YYKD44UBKHHsXfpnmA+T744PR1K4WlGFuJaTs55Nm?=
 =?iso-8859-1?Q?/f3WDyxi9HFMU4HG+BnEhZAdQHhLJfb0etcR2RUG5tjQyFyp9DWXmhWhaN?=
 =?iso-8859-1?Q?VxlckT3yjlIOGDM64TVo8+RWncN9fDfsPI00tfgXTi/Dod4CdRNZLCRQIN?=
 =?iso-8859-1?Q?+LfDzDtPjyTPgsMUa6YZZbxv3IgukHhgB5lihqSWRMteE6waBpy9KmUq6J?=
 =?iso-8859-1?Q?5Z9/jnPXzxVaPIXGsM6NC1Bk7CD63s+GSemfdza+5FvDTLBbvj4hah5dI+?=
 =?iso-8859-1?Q?yJ1qHjU+mOg4Wcvan/07j3lD1qBl5TCcG7IRqV/qq4RhSAIUAmNNCVdQHz?=
 =?iso-8859-1?Q?QdjEUeqD9W0QyphypNWjLrDym3afl30iiaebNy5UpWgjnKR0BB0enUJ2O4?=
 =?iso-8859-1?Q?XzbRBV9YGC6sg4e9btrwsPKghjxP7jszo/gP/8z7rlQtFG9YMmvF2Jy0ga?=
 =?iso-8859-1?Q?aNdO5ae9JiRYhzTrCwSRbW3FFDXesQ+0FB6TKLN9LMzYfD1g3lgAD4k7OI?=
 =?iso-8859-1?Q?gA3yiZM6uB5TnWqPuPpeP0uAPrjF/8SbXpsUtYiAnh4vBx+4jYFiFwcRHr?=
 =?iso-8859-1?Q?xLTD2euMI6Ad0LpcI1tSurIpJK+t9wDHkKxGjC5R80UoPorGzNwNekL1Jq?=
 =?iso-8859-1?Q?qQ/Ned+2C60pB85rEhLv0vlmOOct2irNL0hpBtocUq6NjLJom71GIIfHM8?=
 =?iso-8859-1?Q?nm003x5Hep9FgI1rfuBqurZriRxbGOZLdsdyn2NWi4UyISGHpTau98D7lk?=
 =?iso-8859-1?Q?VjDqxBR0xMxrOgv7bx+M0Aq8LxwKOicT+9j0gP8RbDxswst+jUbgGpFFwu?=
 =?iso-8859-1?Q?l7iJfZoH+RJBvKzrDJtbLgTNPH84nwozYAR4Y+unrYeuMs7azRn8Y8b1Kb?=
 =?iso-8859-1?Q?QeeELHFjWE?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB28401B22CACDC249926C0A19F42A9BYAPR12MB2840namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2840.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7984c1a4-6b93-4b97-f56d-08d91bac0866
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 16:26:33.7406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X8foRC6n7JMhGHgJDZCUsrypqudaMTWiMYjvDRlP5Cf0G6KS59bR8pX+5N5tY7IG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3062
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB28401B22CACDC249926C0A19F42A9BYAPR12MB2840namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

i would like to add a unit marker for the stats that we monitor in the fd, =
as we discussed currently we are displaying the usage percentage, because w=
e wanted to to provide single query percentages, but this may evolve with t=
ime.

May I suggest to add two new fields

drm-stat-interval: <64 bit> ns
drm-stat-timestamp: <64 bit> ns

If interval is set, engine utilization is calculated by doing <perc render>=
 =3D 100*<drm_engine_render>/<drm_stat_interval>
if interval is not set, two reads are needed : <perc render> =3D 100*<drm_e=
ngine_render1 - drm_engine_render0> / <drm-stat-timestamp1 - drm-stat-times=
tamp0>


Regards,

David


________________________________
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Sent: Thursday, May 20, 2021 8:12 AM
To: Intel-gfx@lists.freedesktop.org <Intel-gfx@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Tvrt=
ko Ursulin <tvrtko.ursulin@intel.com>; Nieto, David M <David.Nieto@amd.com>=
; Koenig, Christian <Christian.Koenig@amd.com>; Daniel Vetter <daniel@ffwll=
.ch>
Subject: [RFC 7/7] drm/i915: Expose client engine utilisation via fdinfo

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Similar to AMD commit
874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
infrastructure added in previous patches, we add basic client info
and GPU engine utilisation for i915.

Example of the output:

  pos:    0
  flags:  0100002
  mnt_id: 21
  drm-driver: i915
  drm-pdev:   0000:00:02.0
  drm-client-id:      7
  drm-engine-render:  9288864723 ns
  drm-engine-copy:    2035071108 ns
  drm-engine-video:   0 ns
  drm-engine-video-enhance:   0 ns

DRM related fields are appropriately prefixed for easy parsing and
separation from generic fdinfo fields.

Idea is for some fields to become either fully or partially standardised
in order to enable writting of generic top-like tools.

Initial proposal for fully standardised common fields:

 drm-driver: <str>
 drm-pdev: <aaaa:bb.cc.d>

Optional fully standardised:

 drm-client-id: <uint>

Optional partially standardised:

 engine-<str>: <u64> ns
 memory-<str>: <u64> KiB

Once agreed the format would need to go to some README or kerneldoc in
DRM core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: David M Nieto <David.Nieto@amd.com>
Cc: Christian K=F6nig <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_drm_client.c | 68 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h |  4 ++
 drivers/gpu/drm/i915/i915_drv.c        |  3 ++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/=
i915_drm_client.c
index 1e5db7753276..5e9cfba1116b 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -9,6 +9,11 @@

 #include <drm/drm_print.h>

+#include <uapi/drm/i915_drm.h>
+
+#include "gem/i915_gem_context.h"
+#include "gt/intel_engine_user.h"
+
 #include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_gem.h"
@@ -168,3 +173,66 @@ void i915_drm_clients_fini(struct i915_drm_clients *cl=
ients)

         xa_destroy(&clients->xarray);
 }
+
+#ifdef CONFIG_PROC_FS
+static const char * const uabi_class_names[] =3D {
+       [I915_ENGINE_CLASS_RENDER] =3D "render",
+       [I915_ENGINE_CLASS_COPY] =3D "copy",
+       [I915_ENGINE_CLASS_VIDEO] =3D "video",
+       [I915_ENGINE_CLASS_VIDEO_ENHANCE] =3D "video-enhance",
+};
+
+static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
+{
+       struct i915_gem_engines_iter it;
+       struct intel_context *ce;
+       u64 total =3D 0;
+
+       for_each_gem_engine(ce, rcu_dereference(ctx->engines), it) {
+               if (ce->engine->uabi_class !=3D class)
+                       continue;
+
+               total +=3D intel_context_get_total_runtime_ns(ce);
+       }
+
+       return total;
+}
+
+static void
+show_client_class(struct seq_file *m,
+                 struct i915_drm_client *client,
+                 unsigned int class)
+{
+       const struct list_head *list =3D &client->ctx_list;
+       u64 total =3D atomic64_read(&client->past_runtime[class]);
+       struct i915_gem_context *ctx;
+
+       rcu_read_lock();
+       list_for_each_entry_rcu(ctx, list, client_link)
+               total +=3D busy_add(ctx, class);
+       rcu_read_unlock();
+
+       return seq_printf(m, "drm-engine-%s:\t%llu ns\n",
+                         uabi_class_names[class], total);
+}
+
+void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
+{
+       struct drm_file *file =3D f->private_data;
+       struct drm_i915_file_private *file_priv =3D file->driver_priv;
+       struct drm_i915_private *i915 =3D file_priv->dev_priv;
+       struct i915_drm_client *client =3D file_priv->client;
+       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
+       unsigned int i;
+
+       seq_printf(m, "drm-driver:\ti915\n");
+       seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
+                  pci_domain_nr(pdev->bus), pdev->bus->number,
+                  PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+
+       seq_printf(m, "drm-client-id:\t%u\n", client->id);
+
+       for (i =3D 0; i < ARRAY_SIZE(uabi_class_names); i++)
+               show_client_class(m, client, i);
+}
+#endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/=
i915_drm_client.h
index b2b69d6985e4..9885002433a0 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -98,6 +98,10 @@ i915_drm_client_pid(const struct i915_drm_client *client=
)
         return __i915_drm_client_name(client)->pid;
 }

+#ifdef CONFIG_PROC_FS
+void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
+#endif
+
 void i915_drm_clients_fini(struct i915_drm_clients *clients);

 #endif /* !__I915_DRM_CLIENT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_dr=
v.c
index 33eb7b52b58b..6b63fe4b3c26 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1694,6 +1694,9 @@ static const struct file_operations i915_driver_fops =
=3D {
         .read =3D drm_read,
         .compat_ioctl =3D i915_ioc32_compat_ioctl,
         .llseek =3D noop_llseek,
+#ifdef CONFIG_PROC_FS
+       .show_fdinfo =3D i915_drm_client_fdinfo,
+#endif
 };

 static int
--
2.30.2


--_000_BYAPR12MB28401B22CACDC249926C0A19F42A9BYAPR12MB2840namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
i would like to add a unit marker for the stats that we monitor in the fd, =
as we discussed currently we are displaying the usage percentage, because w=
e wanted to to provide single query percentages, but this may evolve with t=
ime.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
May I suggest to add two new fields</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
drm-stat-interval: &lt;64 bit&gt; ns</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
drm-stat-timestamp: &lt;64 bit&gt; ns</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
If interval is set, engine utilization is calculated by doing &lt;perc rend=
er&gt; =3D 100*&lt;drm_engine_render&gt;/&lt;drm_stat_interval&gt;&nbsp;</d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
if interval is not set, two reads are needed : &lt;perc render&gt; =3D 100*=
&lt;drm_engine_render1 - drm_engine_render0&gt; / &lt;drm-stat-timestamp1 -=
 drm-stat-timestamp0&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
David</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tvrtko Ursulin &lt;tv=
rtko.ursulin@linux.intel.com&gt;<br>
<b>Sent:</b> Thursday, May 20, 2021 8:12 AM<br>
<b>To:</b> Intel-gfx@lists.freedesktop.org &lt;Intel-gfx@lists.freedesktop.=
org&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; Tvrtko Ursulin &lt;tvrtko.ursulin@intel.com&gt;; Nieto, David M &l=
t;David.Nieto@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&g=
t;; Daniel Vetter &lt;daniel@ffwll.ch&gt;<br>
<b>Subject:</b> [RFC 7/7] drm/i915: Expose client engine utilisation via fd=
info</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Tvrtko Ursulin &lt;tvrtko.ursulin@intel.com&=
gt;<br>
<br>
Similar to AMD commit<br>
874442541133 (&quot;drm/amdgpu: Add show_fdinfo() interface&quot;), using t=
he<br>
infrastructure added in previous patches, we add basic client info<br>
and GPU engine utilisation for i915.<br>
<br>
Example of the output:<br>
<br>
&nbsp; pos:&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; flags:&nbsp; 0100002<br>
&nbsp; mnt_id: 21<br>
&nbsp; drm-driver: i915<br>
&nbsp; drm-pdev:&nbsp;&nbsp; 0000:00:02.0<br>
&nbsp; drm-client-id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7<br>
&nbsp; drm-engine-render:&nbsp; 9288864723 ns<br>
&nbsp; drm-engine-copy:&nbsp;&nbsp;&nbsp; 2035071108 ns<br>
&nbsp; drm-engine-video:&nbsp;&nbsp; 0 ns<br>
&nbsp; drm-engine-video-enhance:&nbsp;&nbsp; 0 ns<br>
<br>
DRM related fields are appropriately prefixed for easy parsing and<br>
separation from generic fdinfo fields.<br>
<br>
Idea is for some fields to become either fully or partially standardised<br=
>
in order to enable writting of generic top-like tools.<br>
<br>
Initial proposal for fully standardised common fields:<br>
<br>
&nbsp;drm-driver: &lt;str&gt;<br>
&nbsp;drm-pdev: &lt;aaaa:bb.cc.d&gt;<br>
<br>
Optional fully standardised:<br>
<br>
&nbsp;drm-client-id: &lt;uint&gt;<br>
<br>
Optional partially standardised:<br>
<br>
&nbsp;engine-&lt;str&gt;: &lt;u64&gt; ns<br>
&nbsp;memory-&lt;str&gt;: &lt;u64&gt; KiB<br>
<br>
Once agreed the format would need to go to some README or kerneldoc in<br>
DRM core.<br>
<br>
Signed-off-by: Tvrtko Ursulin &lt;tvrtko.ursulin@intel.com&gt;<br>
Cc: David M Nieto &lt;David.Nieto@amd.com&gt;<br>
Cc: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
Cc: Daniel Vetter &lt;daniel@ffwll.ch&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/i915/i915_drm_client.c | 68 +++++++++++++++++++++++++=
+<br>
&nbsp;drivers/gpu/drm/i915/i915_drm_client.h |&nbsp; 4 ++<br>
&nbsp;drivers/gpu/drm/i915/i915_drv.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp; 3 ++<br>
&nbsp;3 files changed, 75 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/=
i915_drm_client.c<br>
index 1e5db7753276..5e9cfba1116b 100644<br>
--- a/drivers/gpu/drm/i915/i915_drm_client.c<br>
+++ b/drivers/gpu/drm/i915/i915_drm_client.c<br>
@@ -9,6 +9,11 @@<br>
&nbsp;<br>
&nbsp;#include &lt;drm/drm_print.h&gt;<br>
&nbsp;<br>
+#include &lt;uapi/drm/i915_drm.h&gt;<br>
+<br>
+#include &quot;gem/i915_gem_context.h&quot;<br>
+#include &quot;gt/intel_engine_user.h&quot;<br>
+<br>
&nbsp;#include &quot;i915_drm_client.h&quot;<br>
&nbsp;#include &quot;i915_drv.h&quot;<br>
&nbsp;#include &quot;i915_gem.h&quot;<br>
@@ -168,3 +173,66 @@ void i915_drm_clients_fini(struct i915_drm_clients *cl=
ients)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xa_destroy(&amp;clients-&g=
t;xarray);<br>
&nbsp;}<br>
+<br>
+#ifdef CONFIG_PROC_FS<br>
+static const char * const uabi_class_names[] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [I915_ENGINE_CLASS_RENDER] =3D &quot;=
render&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [I915_ENGINE_CLASS_COPY] =3D &quot;co=
py&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [I915_ENGINE_CLASS_VIDEO] =3D &quot;v=
ideo&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [I915_ENGINE_CLASS_VIDEO_ENHANCE] =3D=
 &quot;video-enhance&quot;,<br>
+};<br>
+<br>
+static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct i915_gem_engines_iter it;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct intel_context *ce;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 total =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gem_engine(ce, rcu_dereferen=
ce(ctx-&gt;engines), it) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (ce-&gt;engine-&gt;uabi_class !=3D class)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; total +=3D intel_context_get_total_runtime_ns(ce);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return total;<br>
+}<br>
+<br>
+static void<br>
+show_client_class(struct seq_file *m,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; struct i915_drm_client *client,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; unsigned int class)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct list_head *list =3D &amp=
;client-&gt;ctx_list;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 total =3D atomic64_read(&amp;clie=
nt-&gt;past_runtime[class]);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct i915_gem_context *ctx;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rcu_read_lock();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry_rcu(ctx, list, cl=
ient_link)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; total +=3D busy_add(ctx, class);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rcu_read_unlock();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return seq_printf(m, &quot;drm-engine=
-%s:\t%llu ns\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uabi=
_class_names[class], total);<br>
+}<br>
+<br>
+void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_file *file =3D f-&gt;priva=
te_data;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_i915_file_private *file_pr=
iv =3D file-&gt;driver_priv;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_i915_private *i915 =3D fil=
e_priv-&gt;dev_priv;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct i915_drm_client *client =3D fi=
le_priv-&gt;client;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pci_dev *pdev =3D to_pci_dev(i=
915-&gt;drm.dev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;drm-driver:\ti915=
\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;drm-pdev:\t%04x:%=
02x:%02x.%d\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_domain_nr(pdev-&gt;bus), pdev-&gt;bus-&gt;=
number,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; PCI_SLOT(pdev-&gt;devfn), PCI_FUNC(pdev-&gt;de=
vfn));<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;drm-client-id:\t%=
u\n&quot;, client-&gt;id);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(uabi_=
class_names); i++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; show_client_class(m, client, i);<br>
+}<br>
+#endif<br>
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/=
i915_drm_client.h<br>
index b2b69d6985e4..9885002433a0 100644<br>
--- a/drivers/gpu/drm/i915/i915_drm_client.h<br>
+++ b/drivers/gpu/drm/i915/i915_drm_client.h<br>
@@ -98,6 +98,10 @@ i915_drm_client_pid(const struct i915_drm_client *client=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return __i915_drm_client_n=
ame(client)-&gt;pid;<br>
&nbsp;}<br>
&nbsp;<br>
+#ifdef CONFIG_PROC_FS<br>
+void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);<br>
+#endif<br>
+<br>
&nbsp;void i915_drm_clients_fini(struct i915_drm_clients *clients);<br>
&nbsp;<br>
&nbsp;#endif /* !__I915_DRM_CLIENT_H__ */<br>
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_dr=
v.c<br>
index 33eb7b52b58b..6b63fe4b3c26 100644<br>
--- a/drivers/gpu/drm/i915/i915_drv.c<br>
+++ b/drivers/gpu/drm/i915/i915_drv.c<br>
@@ -1694,6 +1694,9 @@ static const struct file_operations i915_driver_fops =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .read =3D drm_read,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .compat_ioctl =3D i915_ioc=
32_compat_ioctl,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .llseek =3D noop_llseek,<b=
r>
+#ifdef CONFIG_PROC_FS<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .show_fdinfo =3D i915_drm_client_fdin=
fo,<br>
+#endif<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static int<br>
-- <br>
2.30.2<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB28401B22CACDC249926C0A19F42A9BYAPR12MB2840namp_--
