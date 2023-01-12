Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFF3666A25
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 05:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB41E10E861;
	Thu, 12 Jan 2023 04:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F47310E861
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 04:21:20 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id i65so9480120pfc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 20:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q03I2SqtfUHT+b3Yv/iRQSSryxJAUHsZ8NrVScVRxMI=;
 b=f2KQNOhtwineaLdPBaanYUTkfKpWAsRnLTpA0trox4XkuknVYCNctsxaTb9tGgNaKu
 BiPdVJaRaMWIfNSedsGVzbWEWFA4Oyfa54lxWC+pmDiQ7Wu/rMobAp8vivpq2qPeoyru
 JGwxDlf/wLaFD441dPBCsW1FecE5k3Uf5Jc5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q03I2SqtfUHT+b3Yv/iRQSSryxJAUHsZ8NrVScVRxMI=;
 b=MBYA+87Uz0T5DT8jftaLgJ8lsafeEG4P/iH6N0UP+dm+qEI8vGJE7yk7HU+rpBeFBV
 3iVfON+XPAEP/KIpTMgr3Gg8AoEox7Rsc2RZOgLML2tGfrKNFPkJG5W8b/EOmBGDqpLF
 IBw+DFXl0tWIXqEl45XRCwYjZmAEBDlJF8jbyCcNkj4jb6w8O+eGGxB2RB1eWUfQycJc
 AIEMjCwm5k+sGDj4sYrlq6aJ+3BxUaxBvnZsBFpYPbeM3aEq6mdH9h8CrOX0vyeHYkVL
 nnSVzPkk+zOEL9/pKN9xSwN9gssV3ET0zPSUEEhAdHQoptOchprML5p9Wy2QRuPpA+Ku
 RNtA==
X-Gm-Message-State: AFqh2koYwtJ+croCQxzuwCFKskDRlIUZxsDW13OGBx4voNmhG2j2eOS9
 1Trvr9wn78pAUG9pXlUvAnrAJQ==
X-Google-Smtp-Source: AMrXdXswXbMeS9BT39H8sowcVIjkCoMbgp4IdQMCSlK3qQjJDGOScnXIeb7KOT5Cr83jpiG8FcP3dg==
X-Received: by 2002:a62:e708:0:b0:583:2a2e:3465 with SMTP id
 s8-20020a62e708000000b005832a2e3465mr4830150pfh.1.1673497279634; 
 Wed, 11 Jan 2023 20:21:19 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:594f:5484:7591:d074])
 by smtp.gmail.com with ESMTPSA id
 s8-20020aa78bc8000000b00582579cb0e0sm5519478pfd.129.2023.01.11.20.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 20:21:19 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v10 1/9] device property: Add remote endpoint to devcon matcher
Date: Thu, 12 Jan 2023 12:20:56 +0800
Message-Id: <20230112042104.4107253-2-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230112042104.4107253-1-treapking@chromium.org>
References: <20230112042104.4107253-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 Xin Ji <xji@analogixsemi.com>, Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prashant Malani <pmalani@chromium.org>

When searching the device graph for device matches, check the
remote-endpoint itself for a match.

Some drivers register devices for individual endpoints. This allows
the matcher code to evaluate those for a match too, instead
of only looking at the remote parent devices. This is required when a
device supports two mode switches in its endpoints, so we can't simply
register the mode switch with the parent node.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v6:
- New in v6

 drivers/base/property.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 2a5a37fcd998..48877af4e444 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1223,6 +1223,21 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
 			break;
 		}
 
+		/*
+		 * Some drivers may register devices for endpoints. Check
+		 * the remote-endpoints for matches in addition to the remote
+		 * port parent.
+		 */
+		node = fwnode_graph_get_remote_endpoint(ep);
+		if (fwnode_device_is_available(node)) {
+			ret = match(node, con_id, data);
+			if (ret) {
+				if (matches)
+					matches[count] = ret;
+				count++;
+			}
+		}
+
 		node = fwnode_graph_get_remote_port_parent(ep);
 		if (!fwnode_device_is_available(node)) {
 			fwnode_handle_put(node);
-- 
2.39.0.314.g84b9a713c41-goog

