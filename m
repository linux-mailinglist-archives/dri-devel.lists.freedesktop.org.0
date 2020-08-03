Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB123A33F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 13:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF786E261;
	Mon,  3 Aug 2020 11:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FD66E262
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 11:23:56 +0000 (UTC)
IronPort-SDR: qJ/29/++7jz2Pg9bFaHSb6Ji4GJHs8VbF8NCb16PwHiIdsqIPnWNf83UVbxSBcegZW+O07HYXS
 HiTUMcIH1JqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="153281791"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; 
 d="scan'208,217";a="153281791"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 04:23:56 -0700
IronPort-SDR: 0BV+lsHhxkDSI/KA//AT0o13RZSlsBxuBT4qEIZQD2kd2/be+sYEeXiK3WnbGnXd7Bdc4Zws8W
 h2QAgHPJxZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; 
 d="scan'208,217";a="491791375"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.252.159.245])
 ([10.252.159.245])
 by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2020 04:23:52 -0700
Subject: Re: [PATCH] drm: fix drm_dp_mst_port refcount leaks in
 drm_dp_mst_allocate_vcpi
To: Xin Xiong <xiongx18@fudan.edu.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200719154545.GA41231@xin-virtual-machine>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <b0825761-e33e-c7ad-6b8e-6852b540ca45@intel.com>
Date: Mon, 3 Aug 2020 16:53:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20200719154545.GA41231@xin-virtual-machine>
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
Cc: Xin Tan <tanxin.ctf@gmail.com>,
 "yuanxzhang@fudan.edu.cn" <yuanxzhang@fudan.edu.cn>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>
Content-Type: multipart/mixed; boundary="===============0224718105=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0224718105==
Content-Type: multipart/alternative;
 boundary="------------6E1028B7AD6C345B6FE00826"

This is a multi-part message in MIME format.
--------------6E1028B7AD6C345B6FE00826
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Xin Xong,

I have seen insufficient vcpi ports issues with MST daisy chain. While 
running the IGT tests on MST, some times the vcpi ports are all used up.

Due to this the atomic check fails and the flips start failing with ENOSPC.
<https://gitlab.freedesktop.org/drm/intel/-/issues/1255>

https://gitlab.freedesktop.org/drm/intel/-/issues/1255

I think this patch would be fixing this.

Regards,
Ankit

On 7/19/2020 9:15 PM, Xin Xiong wrote:
> drm_dp_mst_allocate_vcpi() invokes
> drm_dp_mst_topology_get_port_validated(), which increases the refcount
> of the "port".
>
> These reference counting issues take place in two exception handling
> paths separately. Either when “slots” is less than 0 or when
> drm_dp_init_vcpi() returns a negative value, the function forgets to
> reduce the refcnt increased drm_dp_mst_topology_get_port_validated(),
> which results in a refcount leak.
>
> Fix these issues by pulling up the error handling when "slots" is less
> than 0, and calling drm_dp_mst_topology_put_port() before termination
> when drm_dp_init_vcpi() returns a negative value.
>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
> ---
>   drivers/gpu/drm/drm_dp_mst_topology.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 1e26b89628f9..97b48b531ec6 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4261,11 +4261,11 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>   {
>   	int ret;
>   
> -	port = drm_dp_mst_topology_get_port_validated(mgr, port);
> -	if (!port)
> +	if (slots < 0)
>   		return false;
>   
> -	if (slots < 0)
> +	port = drm_dp_mst_topology_get_port_validated(mgr, port);
> +	if (!port)
>   		return false;
>   
>   	if (port->vcpi.vcpi > 0) {
> @@ -4281,6 +4281,7 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>   	if (ret) {
>   		DRM_DEBUG_KMS("failed to init vcpi slots=%d max=63 ret=%d\n",
>   			      DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
> +		drm_dp_mst_topology_put_port(port);
>   		goto out;
>   	}
>   	DRM_DEBUG_KMS("initing vcpi for pbn=%d slots=%d\n",


--------------6E1028B7AD6C345B6FE00826
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hi Xin Xong,</p>
    <p>I have seen insufficient vcpi ports issues with MST daisy chain.
      While running the IGT tests on MST, some times the vcpi ports are
      all used up.</p>
    <p>Due to this the atomic check fails and the flips start failing
      with ENOSPC.<a
        href="https://gitlab.freedesktop.org/drm/intel/-/issues/1255"><br>
      </a></p>
    <p><a href="https://gitlab.freedesktop.org/drm/intel/-/issues/1255">https://gitlab.freedesktop.org/drm/intel/-/issues/1255</a></p>
    I think this patch would be fixing this.<br>
    <br>
    Regards,<br>
    Ankit<br>
    <br>
    <div class="moz-cite-prefix">On 7/19/2020 9:15 PM, Xin Xiong wrote:<br>
    </div>
    <blockquote cite="mid:20200719154545.GA41231@xin-virtual-machine"
      type="cite">
      <pre wrap="">drm_dp_mst_allocate_vcpi() invokes
drm_dp_mst_topology_get_port_validated(), which increases the refcount
of the "port".

These reference counting issues take place in two exception handling
paths separately. Either when “slots” is less than 0 or when
drm_dp_init_vcpi() returns a negative value, the function forgets to
reduce the refcnt increased drm_dp_mst_topology_get_port_validated(),
which results in a refcount leak.

Fix these issues by pulling up the error handling when "slots" is less
than 0, and calling drm_dp_mst_topology_put_port() before termination
when drm_dp_init_vcpi() returns a negative value.

Signed-off-by: Xiyu Yang <a class="moz-txt-link-rfc2396E" href="mailto:xiyuyang19@fudan.edu.cn">&lt;xiyuyang19@fudan.edu.cn&gt;</a>
Signed-off-by: Xin Tan <a class="moz-txt-link-rfc2396E" href="mailto:tanxin.ctf@gmail.com">&lt;tanxin.ctf@gmail.com&gt;</a>
Signed-off-by: Xin Xiong <a class="moz-txt-link-rfc2396E" href="mailto:xiongx18@fudan.edu.cn">&lt;xiongx18@fudan.edu.cn&gt;</a>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 1e26b89628f9..97b48b531ec6 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4261,11 +4261,11 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 {
 	int ret;
 
-	port = drm_dp_mst_topology_get_port_validated(mgr, port);
-	if (!port)
+	if (slots &lt; 0)
 		return false;
 
-	if (slots &lt; 0)
+	port = drm_dp_mst_topology_get_port_validated(mgr, port);
+	if (!port)
 		return false;
 
 	if (port-&gt;vcpi.vcpi &gt; 0) {
@@ -4281,6 +4281,7 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 	if (ret) {
 		DRM_DEBUG_KMS("failed to init vcpi slots=%d max=63 ret=%d\n",
 			      DIV_ROUND_UP(pbn, mgr-&gt;pbn_div), ret);
+		drm_dp_mst_topology_put_port(port);
 		goto out;
 	}
 	DRM_DEBUG_KMS("initing vcpi for pbn=%d slots=%d\n",
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------6E1028B7AD6C345B6FE00826--

--===============0224718105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0224718105==--
